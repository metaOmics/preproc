#' Pool the replicated gene symbols to one using the method \code{"IQR"},
#' \code{"largest"}, or \code{"average"}.
#'
#' \code{method} can be \code{"IQR"}, \code{"largest"}, or \code{"average"}.
#' \tabular{llll}{
#' \code{IQR} \tab \tab \tab \cr
#' \tab \tab \tab Represent the target gene symbol using the genes that
#' presented the greatest inter-quartile range (IQR). This method has been
#' recommended in Bioconductor.\cr
#' \code{largest} \tab \tab \tab \cr
#' \tab \tab \tab Represent the target gene symbol using the largest
#' expression.\cr
#' \code{average} \tab \tab \tab \cr
#' \tab \tab \tab Represent the target gene symbol using the average of
#' the expressions.
#' }
#' @title  Pool the replicated gene symbols
#' @param dataset A numeric matrix of gene expressions without
#' missing values or a Study object. For matrix, each row is for one gene
#' and each column is for one sample. The row names are gene symbols.
#' If dataset is Study object, the same rule applies to the matrix in
#' Study@datasets.
#' @param method A character string of the method to deal with the
#' replicated gene symbols. It can be \code{"IQR"}, \code{"largest"}, or
#' \code{"average"}. The default is \code{"IQR"}. See details.
#' @return A numeric matrix of gene expressions without replicated
#' gene symbols. Each row is for one gene and each column is for one
#' sample. The row names are gene symbols.
#' @author Lin Wang, Schwannden Kuo
#' @importFrom stats IQR
#' @export
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' mydata <- Annotate(dataset=study.eg[[1]], id.type=ID.TYPE.probeID,
#'                    platform=PLATFORM.hgu133plus2)
#' mydata <- Impute(dataset=mydata)
#' res  <- PoolReplicate(dataset=mydata)
setGeneric("PoolReplicate",
  function(dataset, method=REPLICATE.IQR) {
    standardGeneric("PoolReplicate")
  }
)

#' Title Handle Duplicated Gene Symbol
#'
#' @param dataset matrix. A gene expression matrix.
#' @inheritParams PoolReplicate
#'
#' @return A gene expression matrix with unique row entries.
#' @export
setMethod("PoolReplicate", signature(dataset="matrix"),
  function(dataset, method) {
    handler <- NULL
    if (method == REPLICATE.IQR) {
      handler <- function(x) {
        x <- as.data.frame(x)
        IQRS <- apply(x, 1, IQR, na.rm=T)
        temp.index <- which.max(IQRS)
        return(x[temp.index, ])
      }
    } else if (method == REPLICATE.largest) {
      handler <- function(x) {
        x <- as.data.frame(x)
        max.var <- apply(x, 2, max, na.rm=T)
        return(max.var)
      }
    } else if (method == REPLICATE.average) {
      handler <- function(x) {
        x <- as.data.frame(x)
        mean.var <- apply(x, 2, mean, na.rm=T)
        return(mean.var)
      }
    } else {
      stop("Unrecognized method!")
    }
    D <- split(as.data.frame(dataset), as.factor(rownames(dataset)))
    res <- t(sapply(D, handler))
    res <- t(apply(res, 1, unlist))
    rownames(res)<-names(D)

    colnames(res)<-colnames(dataset)
    return(res)
  }
)

#' Title Handle Duplicated Gene Symbol
#'
#' @param dataset Study. A Study object.
#' @inheritParams PoolReplicate
#'
#' @return A Study object with datasets of unique row entries
#' @export
setMethod("PoolReplicate", signature(dataset="Study"),
  function(dataset, method) {
    study <- dataset
    if (stype(study) == STYPE.multiple)
      stop("PoolReplicate shuold only be called on single study")
    dataset <- PoolReplicate(study@datasets[[1]], method)
    study@datasets <- list(dataset)
    study
  }
)
