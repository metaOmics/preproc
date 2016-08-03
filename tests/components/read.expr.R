shouldSuccess("Read Study from file", {
  ReadExpr(file.name="data/study.csv", name="test", dtype=DTYPE.microarray)
})

shouldSuccess("Read Study with legal clinical data", {
  ReadExpr("data/study.edata.csv", name="test", dtype=DTYPE.microarray,
           clinical.file="data/study.pdata.csv")
})

shouldFail("Read Study with missing clinical data", {
  ReadExpr("data/study.edata.csv", name="test", dtype=DTYPE.microarray,
           clinical.file="data/study.pdata.missing.csv")
})
