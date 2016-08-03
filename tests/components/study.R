shouldSuccess("create study", {
  new("Study", name="test", dtype=DTYPE.microarray, datasets=list(matrix()))
})

shouldFail("can not create a study without a name", {
  new("Study", dtype=DTYPE.microarray, datasets=list(matrix()))
})

shouldFail("can not create a study without dtype", {
  new("Study", name="test", datasets=list(matrix))
})

shouldFail("can not create a study without datasets", {
  new("Study", name="test", dtype=DTYPE.microarray)
})

study <- ReadExpr("data/study.edata.csv", name="test", dtype=DTYPE.microarray)

shouldSuccess("setting cliical data", {
  clinical <- ReadClinical("data/study.pdata.csv")
  setClinical(study, list(clinical))
})

shouldFail("setting missing cliical data", {
  clinical <- ReadClinical("data/study.pdata.missing.csv")
  setClinical(study, list(clinical))
})

