#' Merge microarray data sets in possibly irregular order.
#'
#' The gene expression data sets may be in possibly irregular order
#' with different numbers of genes. This function is used to extract
#' the common genes across studies. The merged data sets have the
#' same genes in the same order.
#'
#' @title Merge microarray data sets
#' @param datasets a list of gene expression matrice or list of Study. 
#' object. Each row of the matrix (study@datasets[[i]]) is for one gene,
#' each column is for one sample. The row names are gene symbols.
#' @param name The name od the Study object that will be returened
#' @return If dataset is a list of gene expression matrice, it returns 
#' a list of gene expression matrice after merging. Each matrix is for 
#' one study. Each row of the matrix is for one gene and each column 
#' is for one sample. The row names are gene symbols.
#' If dataset is a list of Study object, it returns a Study object with
#' multiple study type, and datasets would be a list of gene expression 
#' matrice after merging, clinicals would be a list of clinical data 
#' after merging.
#' 
#' @author Lin Wang, Schwannden Kuo
#' @export
#' @examples
#' data(datasets.eg)
#' data(preproc.option)
#' SinglePreproc <- function(x) {
#'   x <- Annotate(dataset=x, id.type=ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)
#'   x <- Impute(dataset=x)
#'   x <- PoolReplicate(dataset=x)
#' }
#' # Merge for list of expression matrix
#' datasets.eg <- lapply(datasets.eg, SinglePreproc)
#' res <- Merge(datasets=datasets.eg)
#' # Merge for list of Study
#' studies <- lapply(datasets.eg, function(dataset) {
#'              new("Study", name="test", dtype=DTYPE.microarray, datasets=list(dataset))
#'            })
#' res <- Merge(datasets=studies, name="mergedStudy")
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
  if(is.null(common.id))
    stop("there is no common id between the datasets")
  else
    lapply(datasets, function(dataset) as.matrix(dataset[common.id,]))
}

Merge.Study <- function(datasets, name) {
  studies <- datasets
  study.dtype <- NULL
  if (all(is.continuous(studies)))
    study.dtype <- DTYPE.microarray
  else if (all(is.discrete(studies)))
  study.dtype <- DTYPE.RNAseq.count
  #else
  #  stop("You can't merge continuous data with discrete data")
  else if (sum(is.continuous(studies)) >= sum(is.discrete(studies)))
    study.dtype <- DTYPE.microarray
  else if (sum(is.continuous(studies)) < sum(is.discrete(studies)))
    study.dtype <- DTYPE.RNAseq.count
    #study.dtype <- DTYPE.discrete 
  datasets  <- c()
  clinicals <- c()
  for (study in studies) {
    datasets  <- c(datasets, study@datasets)
    clinicals <- c(clinicals, study@clinicals)
  }
  datasets <- Merge.matrix(datasets)
  new("Study", name=name, dtype=study.dtype, datasets=datasets, clinicals=clinicals)
}
