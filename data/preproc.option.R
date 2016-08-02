ID.TYPE.probeID    <- "ProbeID"
ID.TYPE.geneSymbol <- "GeneSymbol"
ID.TYPE.RefSeqID   <- "RefSeqID"
ID.TYPE.EntrezID   <- "EntrezID"
ID.TYPE.all <-
  c(ID.TYPE.probeID, ID.TYPE.geneSymbol, ID.TYPE.RefSeqID, ID.TYPE.EntrezID)
names(ID.TYPE.all) <- 
  c("Probe ID", "Gene Symbol", "Reference Sequence ID", "Entrez ID")

SPECIES.human <- "human"
SPECIES.mouse <- "mouse"
SPECIES.rat   <- "rat"
SPECIES.all   <- c(SPECIES.human, SPECIES.mouse, SPECIES.rat)
names(SPECIES.all) <- SPECIES.all

DTYPE.microarray   <- "microarray"
DTYPE.RNAseq.count <- "RNAseq-count"
DTYPE.RNAseq.FPKM  <- "RNAseq-FPKM"
DTYPE.continuous   <- "continuous"
DTYPE.discrete     <- "discrete"
DTYPE.all <-
  c(DTYPE.microarray, DTYPE.RNAseq.count, DTYPE.RNAseq.FPKM, DTYPE.continuous, DTYPE.discrete)
names(DTYPE.all) <-
  c("microarray", "RNA sequence count", "RNA sequence FPKM", "continuous", "discrete")

STYPE.multiple <- "multiple"
STYPE.single   <- "single"
STYPE.all <- c(STYPE.multiple, STYPE.single)
names(STYPE.all) <- c("multiple studies", "single study")

NTYPE.continuous <- "continuous"
NTYPE.discrete   <- "discrete"
NTYPE.all <- c(NTYPE.continuous, NTYPE.discrete)
names(NTYPE.all) <- NTYPE.all

SPECIES.refseq.human <- "org.Hs.eg.db::org.Hs.egREFSEQ2EG"
SPECIES.refseq.mouse <- "org.Mm.eg.db::org.Mm.egREFSEQ2EG"
SPECIES.refseq.rat   <- "org.Rn.eg.db::org.Rn.egREFSEQ2EG"
SPECIES.refseq.all <- c(SPECIES.refseq.human, SPECIES.refseq.mouse, SPECIES.refseq.rat)
names(SPECIES.refseq.all) <- SPECIES.all

SPECIES.entrez.human <- "org.Hs.eg.db::org.Hs.egSYMBOL"
SPECIES.entrez.mouse <- "org.Mm.eg.db::org.Mm.egSYMBOL"
SPECIES.entrez.rat   <- "org.Rn.eg.db::org.Rn.egSYMBOL"
SPECIES.entrez.all <- c(SPECIES.entrez.human, SPECIES.entrez.mouse, SPECIES.entrez.rat)
names(SPECIES.entrez.all) <- SPECIES.all

PLATFORM.hgu95a                            <- "hgu95a.db::hgu95aSYMBOL"
PLATFORM.hgu95av2                          <- "hgu95av2.db::hgu95av2SYMBOL"
PLATFORM.hgu95b                            <- "hgu95b.db::hgu95bSYMBOL"
PLATFORM.hgu95c                            <- "hgu95c.db::hgu95cSYMBOL"
PLATFORM.hgu95d                            <- "hgu95d.db::hgu95dSYMBOL"
PLATFORM.hgu95e                            <- "hgu95e.db::hgu95eSYMBOL"
PLATFORM.hgu133a                           <- "hgu133a.db::hgu133aSYMBOL"
PLATFORM.hgu133b                           <- "hgu133b.db::hgu133bSYMBOL"
PLATFORM.hgu133plus2                       <- "hgu133plus2.db::hgu133plus2SYMBOL"
PLATFORM.HumanHT.12.V3.Bead.Array          <- "illuminaHumanv3.db::illuminaHumanv3SYMBOL"
PLATFORM.HumanHT.12.V4.Bead.Array          <- "illuminaHumanv4.db::illuminaHumanv4SYMBOL"
PLATFORM.HumanWG.6.V1.Bead.Array           <- "illuminaHumanv1.db::illuminaHumanv1SYMBOL"
PLATFORM.HumanWG.6.V2.Bead.Array           <- "illuminaHumanv2.db::illuminaHumanv2SYMBOL"
PLATFORM.HumanWG.V2.Bead.Array             <- "illuminaHumanv2BeadID.db::illuminaHumanv2BeadIDSYMBOL"
PLATFORM.hgug4100a                         <- "hgug4100a.db::hgug4100aSYMBOL"
PLATFORM.hgug4101a                         <- "hgug4101a.db::hgug4101aSYMBOL"
PLATFORM.hgug4110b                         <- "hgug4110b.db::hgug4110bSYMBOL"
PLATFORM.hgug4111a                         <- "hgug4111a.db::hgug4111aSYMBOL"
PLATFORM.hgug4112a                         <- "hgug4112a.db::hgug4112aSYMBOL"
PLATFORM.mgu74a                            <- "mgu74a.db::mgu74aSYMBOL"
PLATFORM.mgu74av2                          <- "mgu74av2.db::mgu74av2SYMBOL"
PLATFORM.mgu74b                            <- "mgu74b.db::mgu74bSYMBOL"
PLATFORM.mgu74bv2                          <- "mgu74bv2.db::mgu74bv2SYMBOL"
PLATFORM.mgu74c                            <- "mgu74c.db::mgu74cSYMBOL"
PLATFORM.mgu74cv2                          <- "mgu74cv2.db::mgu74cv2SYMBOL"
PLATFORM.moe430a                           <- "moe430a.db::moe430aSYMBOL"
PLATFORM.moe430b                           <- "moe430b.db::moe430bSYMBOL"
PLATFORM.GenePLATFORM.Mouse.Genome.430.2.0 <- "mouse4302.db::mouse4302SYMBOL"
PLATFORM.MouseWG.6.v1.0.Bead.Array         <- "illuminaMousev1.db::illuminaMousev1SYMBOL"
PLATFORM.MouseWG.6.v2.0.Bead.Array         <- "illuminaMousev2.db::illuminaMousev2SYMBOL"
PLATFORM.mgug4104a                         <- "mgug4104a.db::mgug4104aSYMBOL"
PLATFORM.mgug4120a                         <- "mgug4120a.db::mgug4120aSYMBOL"
PLATFORM.mgug4121a                         <- "mgug4121a.db::mgug4121aSYMBOL"
PLATFORM.mgug4122a                         <- "mgug4122a.db::mgug4122aSYMBOL"
PLATFORM.rat2302                           <- "rat2302.db::rat2302SYMBOL"
PLATFORM.rgu34a                            <- "rgu34a.db::rgu34aSYMBOL"
PLATFORM.rgu34b                            <- "rgu34b.db::rgu34bSYMBOL"
PLATFORM.rgu34c                            <- "rgu34c.db::rgu34cSYMBOL"
PLATFORM.Rat.v1.0.Bead.Array               <- "illuminaRatv1.db::illuminaRatv1SYMBOL"
PLATFORM.rgug4105a                         <- "rgug4105a.db::rgug4105aSYMBOL"
PLATFORM.rgug4130a                         <- "rgug4130a.db::rgug4130aSYMBOL"
PLATFORM.rgug4131a                         <- "rgug4131a.db::rgug4131aSYMBOL"

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

IMPUTE.method.knn    <- "knn"
IMPUTE.method.remove <- "remove"
IMPUTE.method.all <- c(IMPUTE.method.knn, IMPUTE.method.remove)
names(IMPUTE.method.all) <- IMPUTE.method.all

REPLICATE.IQR     <- "IRQ"
REPLICATE.largest <- "largest"
REPLICATE.average <- "average"
REPLICATE.all <- c(REPLICATE.IQR, REPLICATE.largest, REPLICATE.average)
names(REPLICATE.all) <- REPLICATE.all
