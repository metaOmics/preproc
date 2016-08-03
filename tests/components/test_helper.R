PASS.msg <- "\tPASSED\n"
failedHandler <- function(e) {
  cat("\n........### FAILED ###........\n")
  print(e$message)
}

shouldSuccess <- function(title, code) {
  cat(title, ": ", sep="")
  tryCatch({
      code
      cat(PASS.msg)
    },
    error=failedHandler,
    warning=function(e) print(e$message)
  )
}

shouldFail <- function(title, code) {
  cat(title, ": ", sep="")
  tryCatch({
      code
      stop(PASS.msg)
    },
    error=function(e) {
      if (e$message != PASS.msg)
        cat(PASS.msg)
      else
        failedHandler(e)
    },
    warning=function(e) print(e$message)
  )
}
