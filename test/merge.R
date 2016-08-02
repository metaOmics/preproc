s1 <- ReadExpr("test/data/study.edata.csv", name="test", dtype=DTYPE.microarray,
               clinical.file="test/data/study.pdata.csv")
s2 <- s1
s3 <- s1

s2@datasets <- list(s1@datasets[[1]][11:20,])
s3@datasets <- list(s1@datasets[[1]][21:30,])
s1@datasets <- list(s1@datasets[[1]][1:10,])

shouldSuccess("merging three data", {
  Merge(c(s1, s2, s3), name="new")
})

s3@clinicals <- list(s3@clinicals[[1]][, -3])
shouldFail("merging three data with inconsistent clinical data", {
  Merge(c(s1, s2, s3), name="new")
})
