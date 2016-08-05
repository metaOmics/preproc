# Validate the integrity of class "Study"
validateStudy <- function(object) {
  errors <- character()
  # checking data type is a valid option
  if(object@name == "")
    errors <- c(errors, "name is a required parameter")
  if(!(object@dtype %in% DTYPE.all))
    errors <- c(errors, paste("dtype should be one of: ", paste(DTYPE.all, collapse=" ")))
  # checking numeric type is a valid option
  if(object@ntype != "" && !(object@ntype %in% NTYPE.all))
    errors <- c(errors, paste("ntype should be one of: ", paste(NTYPE.all, collapse=" ")))
  # checking numeric type is a valid option
  if(object@stype != "" && !(object@stype %in% STYPE.all))
    errors <- c(errors, paste("stype should be one of: ", paste(STYPE.all, collapse=" ")))
  # checking if the datasets is a list
  if (class(object@datasets) != "list")
    errors <- c(errors, "datasets should be a list of matrix")
  # checking if the datasets is non-empty
  if (length(object@datasets) == 0)
    errors <- c(errors, "initialize datasets with at least one dataset")
  # checking if all dataset is matrix
  error <- NULL
  for(dataset in object@datasets) {
    if(class(dataset) != "matrix")
      error <- "datasets contains non matrix element\n"
  }
  errrors <- c(errors, error)
  # checking if the datasets is a list
  if (class(object@clinicals) != "list")
    errors <- c(errors, "clinicals should be a list of data.frame")
  # checking clinical data
  else if (length(object@clinicals) > 0) {
    # checking if all dataset has clinical data
    n <- length(object@datasets)
    if (n != length(object@clinicals)) {
      errors <- c(errors, "datasets must all have or all lack clinical data")
    }
    ref.dimension <- ncol(object@clinicals[[1]])
    ref.names     <- colnames(object@clinicals[[1]])
    for(i in 1:n) {
      clinical <- object@clinicals[[i]]
      clinical.attr <- colnames(clinical)
      if(class(clinical) != "data.frame")
        errors <- c(errors, "clinicals contain non data.frame element")
      if (length(clinical.attr) != ref.dimension || any(clinical.attr != ref.names))
        errors <- c(errors, "all clinical data should have same number of attributes")
      samples <- colnames(object@datasets[[i]])
      if (nrow(clinical) > 0 && !all(samples %in% rownames(clinical)))
        errors <- c(errors, "all samples must have clinical data")
    }
  }
  if (length(errors) == 0) TRUE else errors
}

##########################
# Study class definition #
##########################

#' Title Study Class
#'
#' @slot name  character. Name of the Study.
#' @slot dtype character. Data type of the Study, should be one of DTYPE.all.
#' @slot ntype character. Numeric type of the Study, should be one of NTYPE.all.
#' @slot stype character. Study type, should be one of STYPE.all.
#' @slot datasets  list. A list of gene expression matrix.
#' @slot clinicals list. A list of data.fram that is the clinical datas of the datasets.
#'
#' @return A Study class
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
setClass("Study",
  representation(
    name="character",
    dtype="character",
    ntype="character",
    stype="character",
    datasets="list",
    clinicals="list"
  ),
  prototype(
    name="",
    ntype="",
    stype="",
    clinicals=list()
  ),
  validity = validateStudy
)

setMethod("initialize", "Study",
  function(.Object, name, dtype, datasets, clinicals) {
    # First use default contructor and call the validator
    .Object <- callNextMethod()
    # Setting default name for the gene expression matrix
    # This is useful for multiple study to recover single study's name
    if(is.null(names(datasets)) && length(datasets) == 1) {
      datasets <- .Object@datasets
      names(datasets) <- name
      .Object@datasets <- datasets
    }
    # Rearranging clinical data
    n <- length(.Object@clinicals)
    if (n > 0) {
      for (i in 1:n) {
        dataset  <- .Object@datasets[[i]]
        clinical <- .Object@clinicals[[i]]
        sample.names <- colnames(dataset)
        .Object@clinicals[[i]] <- clinical[sample.names,]
      }
    }
    .Object@stype <- stype(.Object@datasets)
    .Object@ntype <- ntype(dtype)
    .Object
  }
)

##########################
# Generic Methods        #
##########################

#' Title Generic Function: meta
#'
#' @param object an object.
#'
#' @return The meta data of the object.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' meta(study)
setGeneric("meta", function(object) {
  standardGeneric("meta")
})

#' meta method
#' @inheritParams meta
#' @rdname meta-methods
#' @aliases meta,Study-method
setMethod("meta", signature(object="Study"), function(object) {
  nrows <- nrow(object@datasets[[1]])
  ncols <- 0
  for(dataset in object@datasets) {
    ncols <- ncols + ncol(dataset)
  }
  m <- as.data.frame(list(object@dtype, object@ntype, object@stype, nrows, ncols))
  colnames(m) <- c("data type", "numeric nature", "study type",
                   "features", "sample size")
  rownames(m) <- object@name
  m
})


#' Title Custom print Function
#'
#' @param x a Study object.
#' @param ... Any extra arguments
#'
#' @return show the meta data of the Study object.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' print(study)
print.Study <- function(x, ...) {
  meta(x)
}


#' Title Custom show Function
#'
#' @param object Study. A Study object.
#'
#' @return show the meta data of the Study object.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' show(study)
setMethod("show", signature(object="Study"), function(object) {
  print(meta(object))
})

#' Title Generic Function: stype
#'
#' @param object a list of dataset, or a Study object.
#'
#' @return a string for the study type of the object.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' stype(study)
#' stype(list(matrix()))
setGeneric("stype", function(object) {
  standardGeneric("stype")
})

#' stype method
#' @inheritParams stype
#' @rdname stype-methods
#' @aliases stype,list-method
setMethod("stype", signature(object="list"), function(object) {
  if (length(object) > 1)
    STYPE.multiple
  else if (length(object) == 1)
    STYPE.single
  else
    NA
})

#' stype method
#' @rdname stype-methods
#' @aliases stype,Study-method
setMethod("stype", signature(object="Study"), function(object) {
  stype(object@datasets)
})


#' Title Generic Function: ntype
#'
#' @param object a Study object or a string in DTYPE.all.
#'
#' @return the numeric type of the object.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' # ntype for Study
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' ntype(study)
#' # ntype for dtype character
#' ntype(DTYPE.RNAseq.count)
setGeneric("ntype", function(object) {
  standardGeneric("ntype")
})

#' ntype method
#' @inheritParams ntype
#' @rdname ntype-methods
#' @aliases ntype,character-method
setMethod("ntype", signature(object="character"), function(object){
  if(object == DTYPE.RNAseq.count || object == DTYPE.discrete)
    NTYPE.discrete
  else
    NTYPE.continuous
})

#' ntype method
#' @rdname ntype-methods
#' @aliases ntype,Study-method
setMethod("ntype", signature(object="Study"), function(object){
  ntype(object@dtype)
})


##########################
# Public Helpers         #
##########################

#' Title is.discrete
#'
#' @param studies vector of string (data type) or list of studies.
#'
#' @return a vector with each entry corresponding to whether the data type or 
#' study is discrete.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' is.discrete(study)
is.discrete <- function(studies) {
  if(length(studies) == 1)
    ntype(studies) == NTYPE.discrete
  else {
    res <- logical()
    for (study in studies)
      res <- c(res, ntype(study) == NTYPE.discrete)
    res
  }
}

#' Title is.discrete
#'
#' @param studies studies vector of string (data type) or list of studies.
#'
#' @return a vector with each entry corresponding to whether the data type or 
#' study is continuous.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' is.continuous(study)
is.continuous <- function(studies) {
  (!is.discrete(studies))
}

#' Title Set Clinical Data
#'
#' @param study a Study object
#' @param clinicals a list of clinical data.frame. The length of clinicals, if none
#' empty, must equal the length of the datasets. And clinical[[i]] is the clinical
#' data for datasets[[i]]. Each clinical data.frame has row names corresponding 
#' to sample ID, and column names corresponding to clinical recording. And all 
#' samples in the corresponding dataset should have a clinical 
#' while clinical data can contain more then samples' clinical data.
#'
#' @return a study with updated clinical data
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(preproc.option)
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
#' setClinical(study, list())
setClinical <- function(study, clinicals) {
  study@clinicals <- clinicals
  validObject(study)
  study
}

#' Title Study to matrix
#'
#' @param study A Study object.
#' @param what get datasets matrix or clinical data matrix. Datasets matrix 
#' results from datasets being column binded together. clinical data matrix
#' results from clinical data being row binded together.
#'
#' @return The Gene expression matrix of the Study, and if more then one dataset
#' present in the Study, the datasets are column binded.
#' @author Schwannden Kuo
#' @export
#'
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' dataset.matrix <- to.matrix(study.eg)
#' clinical.matrix <- to.matrix(study.eg, what=TO.MATRIX.clinicals)
to.matrix <- function(study, what=TO.MATRIX.datasets) {
  if (what == TO.MATRIX.datasets)
    do.call(cbind, study@datasets)
  else if (what == TO.MATRIX.clinicals) {
    clinicals <- lapply(study@clinicals, function(x) as.matrix(x))
    do.call(rbind, clinicals)
  }
}

