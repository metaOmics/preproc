# preproc
Preprocessing package for meta-omits analysis

## Required Package
* utils, AnnotationDbi, DMwR, R(>= 2.14.1)
* To install these requirement, in R
```R
install.packages(c("utils", "DMwR"))
source("https://bioconductor.org/biocLite.R")
biocLite("AnnotationDbi")
```

## Install This Package
First you need R `devtools` package installed.
* In command line:
```
R -e "devtools::install_github(\"metaOmic/preproc\")"
```
* In R console
```R
library(devtools)
install_github("metaOmic/preproc")
```
