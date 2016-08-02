dataset <- TEST.study@datasets[[1]]

shouldSuccess("Impute matrix with knn impute", {
  res <- Impute(dataset)
  if(any(is.na(res)))
    stop("there are still NA value is the cells")
})

shouldSuccess("Impute matrix with remove impute", {
  res <- Impute(dataset, method=IMPUTE.method.remove)
  if(any(is.na(res)))
    stop("there are still NA value is the cells")
})

shouldSuccess("Impute study object with knn impute", {
  res <- Impute(TEST.study, k=3)
  if(any(is.na(res)))
    stop("there are still NA value is the cells")

})

shouldSuccess("Impute study object with remove impute", {
  res <- Impute(TEST.study, method=IMPUTE.method.remove)
  if(any(is.na(res)))
    stop("there are still NA value is the cells")
})
