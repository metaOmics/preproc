shouldSuccess("Handling Duplicate value for matrix", {
  PoolReplicate(TEST.study@datasets[[1]])
})

shouldSuccess("Handling Duplicate value for study", {
  PoolReplicate(TEST.study)
})
