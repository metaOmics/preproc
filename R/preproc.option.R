#' Constant Option
#' @name ID.TYPE.probeID
#' @docType data
ID.TYPE.probeID    <- "ProbeID"

#' Constant Option
#' @name ID.TYPE.geneSymbol
#' @docType data
ID.TYPE.geneSymbol <- "GeneSymbol"

#' Constant Option
#' @name ID.TYPE.RefSeqID
#' @docType data
ID.TYPE.RefSeqID   <- "RefSeqID"

#' Constant Option
#' @name ID.TYPE.EntrezID
#' @docType data
ID.TYPE.EntrezID   <- "EntrezID"

#' Constant Option
#' @name ID.TYPE.all
#' @docType data
ID.TYPE.all <-
  c(ID.TYPE.probeID, ID.TYPE.geneSymbol, ID.TYPE.RefSeqID, ID.TYPE.EntrezID)
names(ID.TYPE.all) <- 
  c("Probe ID", "Gene Symbol", "Reference Sequence ID", "Entrez ID")

#' Constant Option
#' @name SPECIES.human
#' @docType data
SPECIES.human <- "human"

#' Constant Option
#' @name SPECIES.mouse
#' @docType data
SPECIES.mouse <- "mouse"

#' Constant Option
#' @name SPECIES.rat
#' @docType data
SPECIES.rat   <- "rat"

#' Constant Option
#' @name SPECIES.all
#' @docType data
SPECIES.all   <- c(SPECIES.human, SPECIES.mouse, SPECIES.rat)
names(SPECIES.all) <- SPECIES.all

#' Constant Option
#' @name DTYPE.microarray
#' @docType data
DTYPE.microarray   <- "microarray"

#' Constant Option
#' @name DTYPE.RNAseq.count
#' @docType data
DTYPE.RNAseq.count <- "RNAseq-count"

#' Constant Option
#' @name DTYPE.RNAseq.FPKM
#' @docType data
DTYPE.RNAseq.FPKM  <- "RNAseq-FPKM/RPKM/TPM"

#' Constant Option
#' @name DTYPE.all
#' @docType data
DTYPE.all <-
  c(DTYPE.microarray, DTYPE.RNAseq.count, DTYPE.RNAseq.FPKM)
names(DTYPE.all) <-
  c("microarray", "RNAseq-count", "RNAseq-FPKM/RPKM/TPM")

#' Constant Option
#' @name STYPE.multiple
#' @docType data
STYPE.multiple <- "multiple"

#' Constant Option
#' @name STYPE.single
#' @docType data
STYPE.single   <- "single"

#' Constant Option
#' @name STYPE.all
#' @docType data
STYPE.all <- c(STYPE.multiple, STYPE.single)
names(STYPE.all) <- c("multiple studies", "single study")

#' Constant Option
#' @name NTYPE.continuous
#' @docType data
NTYPE.continuous <- "continuous"

#' Constant Option
#' @name NTYPE.discrete
#' @docType data
NTYPE.discrete   <- "discrete"

#' Constant Option
#' @name NTYPE.all
#' @docType data
NTYPE.all <- c(NTYPE.continuous, NTYPE.discrete)
names(NTYPE.all) <- NTYPE.all

#' Constant Option
#' @name SPECIES.refseq.human
#' @docType data
SPECIES.refseq.human <- "org.Hs.eg.db::org.Hs.egREFSEQ2EG"

#' Constant Option
#' @name SPECIES.refseq.mouse
#' @docType data
SPECIES.refseq.mouse <- "org.Mm.eg.db::org.Mm.egREFSEQ2EG"

#' Constant Option
#' @name SPECIES.refseq.rat
#' @docType data
SPECIES.refseq.rat   <- "org.Rn.eg.db::org.Rn.egREFSEQ2EG"

#' Constant Option
#' @name SPECIES.refseq.all
#' @docType data
SPECIES.refseq.all <- c(SPECIES.refseq.human, SPECIES.refseq.mouse, SPECIES.refseq.rat)
names(SPECIES.refseq.all) <- SPECIES.all

#' Constant Option
#' @name SPECIES.entrez.human
#' @docType data
SPECIES.entrez.human <- "org.Hs.eg.db::org.Hs.egSYMBOL"

#' Constant Option
#' @name SPECIES.entrez.mouse
#' @docType data
SPECIES.entrez.mouse <- "org.Mm.eg.db::org.Mm.egSYMBOL"

#' Constant Option
#' @name SPECIES.entrez.rat
#' @docType data
SPECIES.entrez.rat   <- "org.Rn.eg.db::org.Rn.egSYMBOL"

#' Constant Option
#' @name SPECIES.entrez.all
#' @docType data
SPECIES.entrez.all <- c(SPECIES.entrez.human, SPECIES.entrez.mouse, SPECIES.entrez.rat)
names(SPECIES.entrez.all) <- SPECIES.all

#' Constant Option
#' @name TO.MATRIX.datasets
#' @docType data
TO.MATRIX.datasets <- "datasets"

#' Constant Option
#' @name TO.MATRIX.clinicals
#' @docType data
TO.MATRIX.clinicals <- "clinicals"

#' Constant Option
#' @name PLATFORM.hgu95a
#' @docType data
PLATFORM.hgu95a                            <- "hgu95a.db::hgu95aSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu95av2
#' @docType data
PLATFORM.hgu95av2                          <- "hgu95av2.db::hgu95av2SYMBOL"

#' Constant Option
#' @name PLATFORM.hgu95b
#' @docType data
PLATFORM.hgu95b                            <- "hgu95b.db::hgu95bSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu95c
#' @docType data
PLATFORM.hgu95c                            <- "hgu95c.db::hgu95cSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu95d
#' @docType data
PLATFORM.hgu95d                            <- "hgu95d.db::hgu95dSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu95e
#' @docType data
PLATFORM.hgu95e                            <- "hgu95e.db::hgu95eSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu133a
#' @docType data
PLATFORM.hgu133a                           <- "hgu133a.db::hgu133aSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu133b
#' @docType data
PLATFORM.hgu133b                           <- "hgu133b.db::hgu133bSYMBOL"

#' Constant Option
#' @name PLATFORM.hgu133plus2
#' @docType data
PLATFORM.hgu133plus2                       <- "hgu133plus2.db::hgu133plus2SYMBOL"

#' Constant Option
#' @name PLATFORM.HumanHT.12.V3.Bead.Array
#' @docType data
PLATFORM.HumanHT.12.V3.Bead.Array          <- "illuminaHumanv3.db::illuminaHumanv3SYMBOL"

#' Constant Option
#' @name PLATFORM.HumanHT.12.V4.Bead.Array
#' @docType data
PLATFORM.HumanHT.12.V4.Bead.Array          <- "illuminaHumanv4.db::illuminaHumanv4SYMBOL"

#' Constant Option
#' @name PLATFORM.HumanWG.6.V1.Bead.Array
#' @docType data
PLATFORM.HumanWG.6.V1.Bead.Array           <- "illuminaHumanv1.db::illuminaHumanv1SYMBOL"

#' Constant Option
#' @name PLATFORM.HumanWG.6.V2.Bead.Array
#' @docType data
PLATFORM.HumanWG.6.V2.Bead.Array           <- "illuminaHumanv2.db::illuminaHumanv2SYMBOL"

#' Constant Option
#' @name PLATFORM.HumanWG.V2.Bead.Array
#' @docType data
PLATFORM.HumanWG.V2.Bead.Array             <- "illuminaHumanv2BeadID.db::illuminaHumanv2BeadIDSYMBOL"

#' Constant Option
#' @name PLATFORM.hgug4100a
#' @docType data
PLATFORM.hgug4100a                         <- "hgug4100a.db::hgug4100aSYMBOL"

#' Constant Option
#' @name PLATFORM.hgug4101a
#' @docType data
PLATFORM.hgug4101a                         <- "hgug4101a.db::hgug4101aSYMBOL"

#' Constant Option
#' @name PLATFORM.hgug4110b
#' @docType data
PLATFORM.hgug4110b                         <- "hgug4110b.db::hgug4110bSYMBOL"

#' Constant Option
#' @name PLATFORM.hgug4111a
#' @docType data
PLATFORM.hgug4111a                         <- "hgug4111a.db::hgug4111aSYMBOL"

#' Constant Option
#' @name PLATFORM.hgug4112a
#' @docType data
PLATFORM.hgug4112a                         <- "hgug4112a.db::hgug4112aSYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74a
#' @docType data
PLATFORM.mgu74a                            <- "mgu74a.db::mgu74aSYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74av2
#' @docType data
PLATFORM.mgu74av2                          <- "mgu74av2.db::mgu74av2SYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74b
#' @docType data
PLATFORM.mgu74b                            <- "mgu74b.db::mgu74bSYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74bv2
#' @docType data
PLATFORM.mgu74bv2                          <- "mgu74bv2.db::mgu74bv2SYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74c
#' @docType data
PLATFORM.mgu74c                            <- "mgu74c.db::mgu74cSYMBOL"

#' Constant Option
#' @name PLATFORM.mgu74cv2
#' @docType data
PLATFORM.mgu74cv2                          <- "mgu74cv2.db::mgu74cv2SYMBOL"

#' Constant Option
#' @name PLATFORM.moe430a
#' @docType data
PLATFORM.moe430a                           <- "moe430a.db::moe430aSYMBOL"

#' Constant Option
#' @name PLATFORM.moe430b
#' @docType data
PLATFORM.moe430b                           <- "moe430b.db::moe430bSYMBOL"

#' Constant Option
#' @name PLATFORM.GenePLATFORM.Mouse.Genome.430.2.0
#' @docType data
PLATFORM.GenePLATFORM.Mouse.Genome.430.2.0 <- "mouse4302.db::mouse4302SYMBOL"

#' Constant Option
#' @name PLATFORM.MouseWG.6.v1.0.Bead.Array
#' @docType data
PLATFORM.MouseWG.6.v1.0.Bead.Array         <- "illuminaMousev1.db::illuminaMousev1SYMBOL"

#' Constant Option
#' @name PLATFORM.MouseWG.6.v2.0.Bead.Array
#' @docType data
PLATFORM.MouseWG.6.v2.0.Bead.Array         <- "illuminaMousev2.db::illuminaMousev2SYMBOL"

#' Constant Option
#' @name PLATFORM.mgug4104a
#' @docType data
PLATFORM.mgug4104a                         <- "mgug4104a.db::mgug4104aSYMBOL"

#' Constant Option
#' @name PLATFORM.mgug4120a
#' @docType data
PLATFORM.mgug4120a                         <- "mgug4120a.db::mgug4120aSYMBOL"

#' Constant Option
#' @name PLATFORM.mgug4121a
#' @docType data
PLATFORM.mgug4121a                         <- "mgug4121a.db::mgug4121aSYMBOL"

#' Constant Option
#' @name PLATFORM.mgug4122a
#' @docType data
PLATFORM.mgug4122a                         <- "mgug4122a.db::mgug4122aSYMBOL"

#' Constant Option
#' @name PLATFORM.rat2302
#' @docType data
PLATFORM.rat2302                           <- "rat2302.db::rat2302SYMBOL"

#' Constant Option
#' @name PLATFORM.rgu34a
#' @docType data
PLATFORM.rgu34a                            <- "rgu34a.db::rgu34aSYMBOL"

#' Constant Option
#' @name PLATFORM.rgu34b
#' @docType data
PLATFORM.rgu34b                            <- "rgu34b.db::rgu34bSYMBOL"

#' Constant Option
#' @name PLATFORM.rgu34c
#' @docType data
PLATFORM.rgu34c                            <- "rgu34c.db::rgu34cSYMBOL"

#' Constant Option
#' @name PLATFORM.Rat.v1.0.Bead.Array
#' @docType data
PLATFORM.Rat.v1.0.Bead.Array               <- "illuminaRatv1.db::illuminaRatv1SYMBOL"

#' Constant Option
#' @name PLATFORM.rgug4105a
#' @docType data
PLATFORM.rgug4105a                         <- "rgug4105a.db::rgug4105aSYMBOL"

#' Constant Option
#' @name PLATFORM.rgug4130a
#' @docType data
PLATFORM.rgug4130a                         <- "rgug4130a.db::rgug4130aSYMBOL"

#' Constant Option
#' @name PLATFORM.rgug4131a
#' @docType data
PLATFORM.rgug4131a                         <- "rgug4131a.db::rgug4131aSYMBOL"


#' Constant Option
#' @name PLATFORM.all
#' @docType data
PLATFORM.all <- c(
  PLATFORM.hgu95a,
  PLATFORM.hgu95av2,
  PLATFORM.hgu95b,
  PLATFORM.hgu95c,
  PLATFORM.hgu95d,
  PLATFORM.hgu95e,
  PLATFORM.hgu133a,
  PLATFORM.hgu133b,
  PLATFORM.hgu133plus2,
  PLATFORM.HumanHT.12.V3.Bead.Array,
  PLATFORM.HumanHT.12.V4.Bead.Array,
  PLATFORM.HumanWG.6.V1.Bead.Array,
  PLATFORM.HumanWG.6.V2.Bead.Array,
  PLATFORM.HumanWG.V2.Bead.Array,
  PLATFORM.hgug4100a,
  PLATFORM.hgug4101a,
  PLATFORM.hgug4110b,
  PLATFORM.hgug4111a,
  PLATFORM.hgug4112a,
  PLATFORM.mgu74a,
  PLATFORM.mgu74av2,
  PLATFORM.mgu74b,
  PLATFORM.mgu74bv2,
  PLATFORM.mgu74c,
  PLATFORM.mgu74cv2,
  PLATFORM.moe430a,
  PLATFORM.moe430b,
  PLATFORM.GenePLATFORM.Mouse.Genome.430.2.0,
  PLATFORM.MouseWG.6.v1.0.Bead.Array,
  PLATFORM.MouseWG.6.v2.0.Bead.Array,
  PLATFORM.mgug4104a,
  PLATFORM.mgug4120a,
  PLATFORM.mgug4121a,
  PLATFORM.mgug4122a,
  PLATFORM.rat2302,
  PLATFORM.rgu34a,
  PLATFORM.rgu34b,
  PLATFORM.rgu34c,
  PLATFORM.Rat.v1.0.Bead.Array,
  PLATFORM.rgug4105a,
  PLATFORM.rgug4130a,
  PLATFORM.rgug4131a
)

names(PLATFORM.all) <- c(
  "chip hgu95a"                             ,
  "chip hgu95av2"                           ,
  "chip hgu95b"                             ,
  "chip hgu95c"                             ,
  "chip hgu95d"                             ,
  "chip hgu95e"                             ,
  "chip hgu133a"                            ,
  "chip hgu133b"                            ,
  "hgu133plus2"                             ,
  "Illumina HumanHT-12 V3 Bead Array"       ,
  "Illumina HumanHT-12 V4 Bead Array"       ,
  "Illumina HumanWG-6 V1 Bead Array"        ,
  "Illumina HumanWG-6 V2 Bead Array"        ,
  "Illumina HumanWG V2 Bead Array"          ,
  "chip hgug4100a"                          ,
  "chip hgug4101a"                          ,
  "chip hgug4110b"                          ,
  "chip hgug4111a"                          ,
  "chip hgug4112a"                          ,
  "chip mgu74a"                             ,
  "chip mgu74av2"                           ,
  "chip mgu74b"                             ,
  "chip mgu74bv2"                           ,
  "chip mgu74c"                             ,
  "chip mgu74cv2"                           ,
  "chip moe430a"                            ,
  "chip moe430b"                            ,
  "Affymetrix GeneChip Mouse Genome 430 2.0",
  "Illumina MouseWG-6 v1.0 Bead Array"      ,
  "Illumina MouseWG-6 v2.0 Bead Array"      ,
  "chip mgug4104a"                          ,
  "chip mgug4120a"                          ,
  "chip mgug4121a"                          ,
  "chip mgug4122a"                          ,
  "chip rat2302"                            ,
  "chip rgu34a"                             ,
  "chip rgu34b"                             ,
  "chip rgu34c"                             ,
  "Illumina Rat v1.0 Bead Array"            ,
  "chip rgug4105a"                          ,
  "chip rgug4130a"                          ,
  "chip rgug4131a"
)

#' Constant Option
#' @name IMPUTE.method.knn
#' @docType data
IMPUTE.method.knn    <- "knn"

#' Constant Option
#' @name IMPUTE.method.remove
#' @docType data
IMPUTE.method.remove <- "remove"

#' Constant Option
#' @name IMPUTE.method.all
#' @docType data
IMPUTE.method.all <- c(IMPUTE.method.knn, IMPUTE.method.remove)
names(IMPUTE.method.all) <- IMPUTE.method.all

#' Constant Option
#' @name REPLICATE.IQR
#' @docType data
REPLICATE.IQR     <- "IRQ"

#' Constant Option
#' @name REPLICATE.largest
#' @docType data
REPLICATE.largest <- "largest"

#' Constant Option
#' @name REPLICATE.average
#' @docType data
REPLICATE.average <- "average"

#' Constant Option
#' @name REPLICATE.all
#' @docType data
REPLICATE.all <- c(REPLICATE.IQR, REPLICATE.largest, REPLICATE.average)
names(REPLICATE.all) <- REPLICATE.all
