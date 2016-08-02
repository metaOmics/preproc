##' Import gene expression data set into R and reformat it to the form
##' required for other functions in this package.
##'
##' The file to be read should be prepared strictly according
##' following format. The first column should be gene ID and the
##' remaining columns should be the gene expressions for samples. The
##' first row should be sample names and the remaining rows
##' should be gene expression profiles for the samples.
##' @title Import and reformat gene expression data set
##' @param file.name a character string of the name of the file to be
##' read. See details.
##' @param name The name of the Study object returned
##' @param dtype The data type of the dataset (should be one of DTYPE.all)
##' @param clinical.file if there is a clinical file containing clinical 
##' data relevent to the dataset.
##' @param log logical. Specify whether the gene expressions need to
##' be log2-transformed. The default is \code{TRUE}.
##' @param sep the field separator character. Values on each line of
##' the file are separated by this character. If \code{sep = ""}, the
##' separator is 'white space', that is one or more spaces, tabs,
##' newlines or carriage returns. The default is \code{"\t"}. See
##' \link{read.csv}.
##' @param quote the set of quoting characters. To disable quoting
##' altogether, use \code{quote = ""}.  See \link{scan} for the
##' behaviour on quotes embedded in quotes. Quoting is only
##' considered for columns read as character, which is all of them
##' unless colClasses is specified.  The default is \code{'"'}. See
##' \link{read.csv}.
##' @param header a logical value indicating whether the file contains
##' the names of the variables as its first line. If missing, the
##' value is determined from the file format: \code{header} is set to
##' \code{TRUE} if and only if the first row contains one fewer field
##' than the number of columns. The default is \code{TRUE}.
##' @return A Study object
##' @author Lin Wang, Schwannden Kuo
##' @importFrom utils read.csv
##' @export
##' @examples
##' data(study.eg)
##' data(preproc.option)
##' write.csv(study.eg[[1]], file="study.txt")
##' mydata <- ReadExpr(file.name="study.txt", name="test", dtype=DTYPE.microarray)
ReadExpr <- function(file.name, name, dtype, clinical.file=NULL, 
                     log=TRUE, sep=',', quote='"', header=T) {
  res <- read.csv(file.name, sep=sep, quote=quote, header=header, row.names=1)
  expr <- as.matrix(res)
  if (log) {
    expr[expr <= 0] <- 0.001
    expr <- log2(expr)
  }

  clinicals <- list()
  if (!is.null(clinical.file)) {
    clinical <- ReadClinical(clinical.file, sep=sep, quote=quote)
    clinicals <- list(clinical)
  }

  study <- new("Study",
    name=name,
    dtype=dtype,
    datasets=list(expr),
    clinicals=clinicals
  )
  return(study)
}

ReadClinical <- function(file.name, sep="\t", quote='"') {
  read.csv(file.name, sep=sep, quote=quote, header=T, row.names=1)
}
