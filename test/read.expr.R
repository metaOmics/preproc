shouldSuccess("Read Study from file", {
  ReadExpr(file.name="test/data/study.csv", name="test", dtype=DTYPE.microarray)
})

shouldSuccess("Read Study with legal clinical data", {
  ReadExpr("test/data/study.edata.csv", name="test", dtype=DTYPE.microarray,
           clinical.file="test/data/study.pdata.csv")
})

shouldFail("Read Study with missing clinical data", {
  ReadExpr("test/data/study.edata.csv", name="test", dtype=DTYPE.microarray,
           clinical.file="test/data/study.pdata.missing.csv")
})
