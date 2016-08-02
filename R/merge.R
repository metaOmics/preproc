##' Merge microarray data sets in possibly irregular order.
##'
##' The gene expression data sets may be in possibly irregular order
##' with different numbers of genes. This function is used to extract
##' the common genes across studies. The merged data sets have the
##' same genes in the same order.
##'
##' @title Merge microarray data sets
##' @param datasets a list of gene expression matrice or list of Study. 
##' object. Each row of the matrix (study@datasets[[i]]) is for one gene,
##' each column is for one sample. The row names are gene symbols.
##' @param name The name od the Study object that will be returened
##' @return If dataset is a list of gene expression matrice, it returns 
##' a list of gene expression matrice after merging. Each matrix is for 
##' one study. Each row of the matrix is for one gene and each column 
##' is for one sample. The row names are gene symbols.
##' If dataset is a list of Study object, it returns a Study object with
##' multiple study type, and datasets would be a list of gene expression 
##' matrice after merging, clinicals would be a list of clinical data 
##' after merging.
##' 
##' @author Lin Wang, Schwannden Kuo
##' @export
##' @examples
##' data(study.eg)
##' data(preproc.option)
##' SinglePreproc <- function(x) {
##'   x <- Annotate(dataset=x, id.type=ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)
##'   x <- Impute(dataset=x)
##'   x <- PoolReplicate(dataset=x)
##' }
##' study.eg <- lapply(study.eg, SinglePreproc)
##' res <- Merge(datasets = study.eg)

Merge <- function(datasets, name) {
  if (class(datasets) != "list")
    stop("Merge only apply on list of Study or list of matrix")
  if (length(datasets) <= 1)
    stop("Merge only apply for more than one dataset")
  if (class(datasets[[1]]) == "matrix")
    Merge.matrix(datasets)
  else if (class(datasets[[1]]) == "Study")
    Merge.Study(datasets, name)
}

Merge.matrix <- function(datasets) {
  symbol <- lapply(datasets, function(a) rownames(a))
  id.count <- table(unlist(symbol))
  n <- length(symbol)
  common.id <- names(which(id.count >= n))
  
  MatchId <- function(study) {
    exprs <- study
    id <- rownames(exprs)
    diff.id <- setdiff(common.id, id)
    n.sample <- ncol(exprs)
    margin.na <- matrix(NA, ncol=n.sample, nrow=length(diff.id))
    colnames(margin.na) <- colnames(exprs)
    rownames(margin.na) <- diff.id
    exprs <- rbind(exprs, margin.na)
    index <- match(common.id, rownames(exprs))
    exprs2 <- exprs[index, ]
    return(exprs2)
  }

  res <- lapply(datasets, MatchId)
  return(res)
}

Merge.Study <- function(datasets, name) {
  studies <- datasets
  study.dtype <- NULL
  if (all(is.continuous(studies)))
    study.dtype <- DTYPE.continuous
  else if (all(is.discrete(studies)))
    study.dtype <- DTYPE.discrete
  else
    stop("You can't merge continuous data with discrete data")
  datasets <- Merge.matrix(lapply(studies, function(s) to.matrix(s)))
  clinicals <- lapply(studies, function(study) 
    as.data.frame(clinical.to.matrix(study@clinicals))
  )
  new("Study", name=name, dtype=study.dtype, datasets=datasets, clinicals=clinicals)
}

# take datasets and merge it into a matrix
clinical.to.matrix=function(clinicals) {
  do.call(rbind, clinicals)
}

