shouldSuccess <- function(title, code) {
  cat(title, ": \n")
  tryCatch({
      code
      cat("..... Pass!\n")
    },
    error=function(e) print(e$message),
    warning=function(e) print(e$message)
  )
}

shouldFail <- function(title, code) {
  cat(title, ": \n")
  tryCatch({
      code
      stop("passed")
    },
    error=function(e) {
      if (e$message != "passed")
        cat("..... Pass!\n")
      else
        stop("this case did not fail, but it should fail!")
    },
    warning=function(e) print(e$message)
  )
}
