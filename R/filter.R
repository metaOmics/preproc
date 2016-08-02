#' Filter genes with low means and low variances.
#'
#' When \code{data.type} is \code{"microarray"} or
#' \code{"RNAseq-FPKM"}, two sequential steps of gene filtering are
#' performed. In the first step, the genes with very low expressions
#' are filtered out. These genes are identified with small average
#' expression values across studies. Specifically, mean intensities
#' of each gene across all samples in each study are calculated and
#' the corresponding ranks are obtained. The sum of such ranks across
#' studies of each gene is calculated and genes with the lowest
#' \code{del.perc[1]} percent rank sum are considered un-expressed
#' genes (i.e. small expression intensities) and filtered
#' out. Similarly, in the second step, the non-informative (small
#' variation) genes are filtered out by replacing mean intensity in
#' the first step with standard deviation. Genes with the lowest
#' \code{del.perc[2]} percent rank sum of standard deviations are
#' filtered out.
#'
#' When \code{data.type} is \code{"RNAseq-count"}, the genes with
#' very low counts are filtered out. These genes are identified with
#' minimum of mean counts across studies.
#'
#' @title Filter genes
#' @param datasets a list of gene expression matrice. Each matrix is
#' for one study. Each row of the matrix is for one gene and each
#' column is for one sample. The row names are gene symbols.
#' @param data.type a character string to specify the type of data in
#' \code{datasets}. It should be \code{"microarray"},
#' \code{"RNAseq-FPKM"}, or \code{"RNAseq-count"}.
#' @param del.perc a numeric vector with two elements, which specify
#' the percentage of genes to be filtered in the two sequential steps
#' of gene filtering when \code{data.type} is \code{"microarray"} or
#' \code{"RNAseq-FPKM"}. The default is \code{c(0.3, 0.3)}. See Details.
#' @param threshold a numeric value to specify the threshold when
#' \code{data.type} is \code{"RNAseq-count"}. The default is \code{1}.
#' See details.
#' @return A list of gene expression matrice after filtering. Each
#' matrix is for one study. Each row of the matrix is for one gene
#' and each column is for one sample. The row names are gene
#' symbols.
#' @author Lin Wang, Schwannden Kuo
#' @importFrom stats quantile
#' @export
#' @examples
#' data(datasets.eg)
#' data(preproc.option)
#' SinglePreproc <- function(x) {
#'   x <- Annotate(dataset=x, id.type = "ProbeID", platform=PLATFORM.hgu133plus2)
#'   x <- Impute(dataset=x)
#'   x <- PoolReplicate(dataset=x)
#' }
#' datasets.eg <- lapply(datasets.eg, SinglePreproc)
#' datasets.eg <- Merge(datasets=datasets.eg)
#' # Filter for matrix
#' res <- Filter(datasets=datasets.eg, data.type=DTYPE.microarray, del.perc=c(0.3, 0.2))
#' # Filter for Study
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=datasets.eg)
#' res <- Filter(datasets=study, data.type=DTYPE.microarray, del.perc=c(0.3, 0.2))
Filter <- function(datasets, data.type, del.perc=c(0.3, 0.3), threshold=1) {
  if (class(datasets) == "list")
    Filter.list(datasets, data.type, del.perc, threshold)
  else if (class(datasets) == "Study")
    Filter.Study(datasets, data.type, del.perc, threshold)
}

Filter.list <- function(datasets, data.type, del.perc, threshold) {
  if (data.type == DTYPE.continuous || data.type == DTYPE.RNAseq.FPKM ||
      data.type == DTYPE.microarray) {
    mean.rank <- sapply(datasets,
                        function(z)rank(apply(z, 1, mean, na.rm=T)))
    mean.r.mv <- rowMeans(mean.rank, na.rm=T)
    mean.r.mv <- mean.r.mv[order(mean.r.mv, decreasing=T)]
    index <- which(mean.r.mv > quantile(mean.r.mv, del.perc[1]))
    gene.mv <- names(mean.r.mv)[index]

    sd.rank <- sapply(datasets,
                      function(z)rank(apply(z[gene.mv,], 1, mean, na.rm=T)))
    mean.r.sd <- rowMeans(sd.rank, na.rm=T)
    mean.r.sd <- mean.r.sd[order(mean.r.sd, decreasing=T)]
    index <- which(mean.r.sd > quantile(mean.r.sd, del.perc[2]))
    final.genes <- names(mean.r.sd)[index]
    
    res <- lapply(datasets, function(x) x[final.genes, ])
  } else if (data.type == DTYPE.discrete || data.type == DTYPE.RNAseq.count) {
    min.mean <- apply(sapply(datasets, function(z)rowMeans(z)), 1, min)
    index <- min.mean > threshold
    
    res <- lapply(datasets, function(x) x[index, ])
  }

  return(res)
}

Filter.Study <- function(datasets, data.type, del.perc, threshold) {
  study <- datasets
  study@datasets <- Filter.list(study@datasets, data.type, del.perc, threshold)
  study
}
