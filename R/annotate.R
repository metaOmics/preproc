#' Annotation for the gene expression data set.
#'
#' Annotate will transform the row names of the dataset to gene
#' symbol. The original row names could be either gene symbol
#' (in the case it is already gene symbol, no tranformation take
#' place), reference sequence, or entrez id.
#'
#' For human, the accepted platforms include \code{"chip hgu95a"},
#' \code{"chip hgu95av2"}, \code{"chip hgu95b"}, \code{"chip
#' hgu95c"}, \code{"chip hgu95d"}, \code{"chip hgu95e"}, \code{"chip
#' hgu133a"}, \code{"chip hgu133b"}, \code{"hgu133plus2"},
#' \code{"Illumina HumanHT-12 V3 Bead Array"}, \code{"Illumina
#' HumanHT-12 V4 Bead Array"}, \code{"Illumina HumanWG-6 V1 Bead
#' Array"}, \code{"Illumina HumanWG-6 V2 Bead Array"},
#' \code{"Illumina HumanWG V2 Bead Array"}, \code{"chip hgug4100a"},
#' \code{"chip hgug4101a"}, \code{"chip hgug4110b"}, \code{"chip
#' hgug4111a"}, and \code{"chip hgug4112a"}.
#'
#' For mouse, the accepted platforms include \code{"chip mgu74a"},
#' \code{"chip mgu74av2"}, \code{"chip mgu74b"}, \code{"chip
#' mgu74bv2"}, \code{"chip mgu74c"}, \code{"chip mgu74cv2"},
#' \code{"chip moe430a"}, \code{"chip moe430b"}, \code{"Affymetrix
#' GeneChip Mouse Genome 430 2.0"}, \code{"Illumina MouseWG-6 v1.0
#' Bead Array"}, \code{"Illumina MouseWG-6 v2.0 Bead Array"},
#' \code{"chip mgug4104a"}, \code{"chip mgug4120a"}, \code{"chip
#' mgug4121a"}, and \code{"chip mgug4122a"}.
#'
#' For rat, the accepted platforms include \code{"chip rat2302"},
#' \code{"chip rgu34a"}, \code{"chip rgu34b"}, \code{"chip rgu34c"},
#' \code{"Illumina Rat v1.0 Bead Array"}, \code{"chip rgug4105a"},
#' \code{"chip rgug4130a"}, and \code{"chip rgug4131a"}.
#'
#' For other platforms, an annotation file is needed to be uploaded
#' by \code{annotation.file}. The annotation file to be read should
#' be prepared strictly according following format. The first column
#' should be probe ID, and the second column should be gene
#' symbol. The first row should be the column headers.
#'
#' @title Gene annotation
#' @param dataset A numeric matrix of gene expressions or a Study
#' object. For matrix, Each row is for one gene and each column is
#' for one sample. The rownames should be gene IDs, which could
#' be probe IDs, refseq IDs, entrez IDs, or gene symbols.
#' For Study object, the same rule for matrix apply to each matrix
#' in the Study@datasets list.
#' @param id.type a character string to specify the type of gene
#' ID. It should be \code{"ProbeID"}, \code{"GeneSymbol"},
#' \code{"RefSeqID"}, or \code{"EntrezID"}.
#' @param species a character string to specify the species of the
#' gene expression data set. The accepted \code{species} include
#' \code{"human"}, \code{"mouse"}, and \code{"rat"}.
#' @param platform a character string to specify the platform of the
#' gene expression data set. See details.
#' @param annotation.file a character string of a txt file name to
#' upload user-specific annotation file. The default is
#' \code{NA}. See details.
#'
#' @return If dataset is matrix, it returns A numeric matrix of gene
#' expressions. with row names being genesymbol. If dataset is Study
#' object, a Study object is returned with Study@datasets annotates.
#' @author Lin Wang, Schwannden Kuo
#' @import AnnotationDbi
#' @importFrom utils read.delim
#' @export
#' @examples
#' data(study.eg)
#' data(preproc.option)
#' # Annotate Expression Matrix
#' res <- Annotate(dataset=study.eg[[1]], id.type=ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)
#' # Annotate Study
#' study <- new("Study", name="test", dtype=DTYPE.microarray, datasets=study.eg[1])
#' res <- Annotate(study, id.type=ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)

# generic function "Annotate"
setGeneric("Annotate",
  function(dataset, id.type=ID.TYPE.geneSymbol, platform="", species="", annotation.file=NA) {
    standardGeneric("Annotate")
  }
)

#' Title Annotate Gene Expression Matrix
#'
#' @param dataset matrix. A numeric matrix of gene expressions.
#' @inheritParams Annotate
#'
#' @return An annotated matrix of gene expressions.
#' @author Schwannden Kuo
#' @export
setMethod("Annotate", signature(dataset="matrix"),
  function(dataset, id.type, platform, species, annotation.file){
    if (is.na(annotation.file)) {
      # using external biomap for preprocessing
      # getting list of table (biomap) needed for row name conversion
      biomaps <- GetBiomaps(id.type=id.type, platform=platform, species=species)
      # converting the row names of dataset based on above biomaps
      dataset <- TransformDataNames(dataset, biomaps)
    } else {
      # using annotation file for preprocessing
      anno <- read.delim(annotation.file, header=TRUE)
      probes <- rownames(dataset)
      m <- match(probes, anno[[1]])
      rownames(dataset) <- as.character(anno[[2]])[m]
    }
    return(dataset)
  }
)

#' Title Annotate Study
#'
#' @param dataset Study. A Study object.
#' @inheritParams Annotate
#'
#' @return An annotated Study object.
#' @author Schwannden Kuo
#' @export
setMethod("Annotate", signature(dataset="Study"),
  function(dataset, id.type, platform, species, annotation.file){
    if(stype(dataset) != STYPE.single)
      stop("annotation on Study object is only applicable to single study")
    study <- dataset
    dataset <- to.matrix(study)
    dataset <- Annotate(dataset, id.type, platform, annotation.file)
    study@datasets <- list(dataset)
    study
  }
)

# Naive takes an vector, and change all the NULL value to NA
Naive <- function(x) if(is.null(x)) NA else (x)

# GetBiomaps find a list of biomap needed to change the row
# names of the dataset based on id.type, platform, and species
GetBiomaps <- function(id.type, platform, species) {
  biomaps <- c()
  if ("GeneSymbol" == id.type) {
    # no preprocessing needed if gene symbol is already provided
    # return an empty list of biomap
    biomaps <- c()
  } else if (id.type == "ProbeID") {
    # return a biomap for changing rownames from probe id to symbol
    biomap_name <- platform
    biomaps <- c(biomaps, biomap_name)
  } else {
    if (id.type == "RefSeqID") {
      # for refseq, we first need a biomap to map refseq to entrez id
      biomap_name <- SPECIES.refseq.all[species]
      biomaps <- c(biomaps, biomap_name)
    }
    # get the biomap for changing rownames from entrez id to symbol
    biomap_name <- SPECIES.entrez.all[species]
    biomaps <- c(biomaps, biomap_name)
  }
  # getting the real biomaps from the names we inserted in biomaps vector
  biomaps <- sapply(biomaps,
    function(biomap_name) eval(parse(text=biomap_name))
  )
  return (biomaps)
}

# TransformDataNames will transform the rownames of the dataset
# by successive apply table specified in biomaps vector
TransformDataNames <- function(dataset, biomaps) {
  # each biomaps is a map fro names from A to B
  # for example, A could be entrez id, B could be gene symbol
  for (biomap in biomaps) {
    # names.table is a vector with names from A and values from B
    names.table       <- as.list(biomap[mappedkeys(biomap)])
    names.old.all     <- names(names.table)
    names.old.dataset <- rownames(dataset)
    # names.new.index is the index of thoses names observed in the dataset
    names.new.index   <- match(names.old.dataset, names.old.all)
    # make sure the new row names does not contain NULL
    names.new         <- sapply(names.table[names.new.index], Naive)
    rownames(dataset) <- names.new
  }
  return (dataset)
}
