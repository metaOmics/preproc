shouldSuccess("create study", {
  new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
})

shouldFail("can not createa study without a name", {
  new("Study", dtype=DTYPE.microarray, datasets=list(matrix))
})

shouldFail("can not createa study without dtype", {
  new("Study", name="test", datasets=list(matrix))
})

shouldFail("can not createa study without datasets", {
  new("Study", name="test", dtype=DTYPE.microarray)
})

study <- ReadExpr("test/data/study.edata.csv", name="test", dtype=DTYPE.microarray)

shouldSuccess("setting cliical data", {
  clinical <- ReadClinical("test/data/study.pdata.csv")
  setClinical(study, list(clinical))
})

shouldFail("setting missing cliical data", {
  clinical <- ReadClinical("test/data/study.pdata.missing.csv")
  setClinical(study, list(clinical))
})

