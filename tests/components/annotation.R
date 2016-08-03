dataset <- TEST.study@datasets[[1]]
TEST.dataset.annotated <- read.csv("data/dataset.annotated.csv", header=T)
TEST.dataset.annotated <- as.matrix(TEST.dataset.annotated)
row.names(TEST.dataset.annotated) <- TEST.dataset.annotated[,1]
TEST.dataset.annotated <- TEST.dataset.annotated[,-1]
truth <- row.names(TEST.dataset.annotated)

shouldSuccess("annotation for matrix", {
  res <- Annotate(dataset, id.type = ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)
  if(any(row.names(res) != truth, na.rm=T))
    stop("Incorrect Annotation")
})

shouldSuccess("annotation for study object", {
  res <- Annotate(TEST.study, id.type = ID.TYPE.probeID, platform=PLATFORM.hgu133plus2)
  if(any(row.names(res@datasets[[1]]) != truth, na.rm=T))
    stop("Incorrect Annotation")
})
