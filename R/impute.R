#' Impute missing values in gene expression data set using nearest neighbor
#' averaging or remove the genes with missing values directly.
#'
#' See also \link{knnImputation}.
#'
#' @title Impute missing values
#' @param dataset a numeric matrix of gene expressions or a Study object.
#' For matrix, each row is for one gene and each column is for one sample.
#' The row names are gene symbols. For Study object, the same rule applies
#' to matrix in Study@datasets
#' @param method a character string to specify how to deal with the
#' missing values. It could be \code{"impute"} or \code{"remove"}, which
#' means to impute missing values using nearest
#' neighbor averaging or remove the genes with missing values
#' directly.
#' @param k the number of neighbors to be used in the imputation. The
#' default is \code{10}.
#' @return A matrix of the gene expressions after dealing with
#' missing values.
#' @author Lin Wang
#' @import DMwR
#' @export
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' res <- Impute(dataset = study.eg[[1]])
# generic function "Impute"
setGeneric("Impute",
  function(dataset, method=IMPUTE.method.knn, k=10) {
    standardGeneric("Impute")
  }
)

#' Title Impute Gene Expression Matrix
#'
#' @param dataset matrix. A gene expression matrix.
#' @inheritParams Impute
#'
#' @return A gene expression matrix with missing value imputed.
#' @export
#'
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' res <- Impute(study.eg[[1]])

setMethod("Impute", signature(dataset="matrix"),
  function(dataset, method, k=10) {
    if (method == IMPUTE.method.knn) {
      res <- knnImputation(data=dataset, k=k)
    } else if (method == IMPUTE.method.remove) {
      index <- is.na(dataset)
      # so we keep NA?
      index2 <- rowSums(index) == 0
      res <- dataset[index2, ]
    } else {
      stop("Unrecognized method!")
    }
    return(res)
  }
)

#' Title Impute Study
#'
#' @param dataset Study. A Study object.
#' @inheritParams Impute
#'
#' @return Study object with missing value imputed.
#' @export
#'
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=study.eg[1])
#' res <- Impute(study)
setMethod("Impute", signature(dataset="Study"),
  function(dataset, method, k=10) {
    study <- dataset
    study@datasets <- lapply(study@datasets, function(dataset) {
      Impute(dataset, method, k)
    })
    study
  }
)
