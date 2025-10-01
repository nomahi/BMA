# "Confidence intervals for a random-effects meta-analysis based on Bartlett-type corrections"
# by Hisashi Noma

#  R example code for calculating improved confidence intervals by the Bartlett-type corrections

# The "BMA" package
# GitHub webpage: https://github.com/nomahi/BMA/

###

# Download the R package file from the following URL:
# https://github.com/nomahi/BMA/raw/main/BMA_1.1.1.tar.gz

# Then, install the package (tar.gz format) by R menu: "packages" -> "Install package(s) from local files...".

###

pkgCheck <- function(pkg){
	if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
	library(pkg, character.only = TRUE)
}

pkgCheck("meta")			# load and/or install "meta" package
pkgCheck("metafor")			# load and/or install "metafor" package

##

library("BMA")

data(magnesium)
print(magnesium)

rem1 <- metabin(d1, n1, d0, n0, sm="OR", studlab=study, data=magnesium)
summary(rem1)
# Standard random-effects model analysis by "meta" package

plot(rem1)			# Forest plot

##

edit_Mg <- escalc(measure="OR", ai=d1, n1i=n1, ci=d0, n2i=n0, data=magnesium)
# Calculating the summary statistics of individual studies 

BMA(yi, vi, data=edit_Mg, eform=TRUE)
# The Bartlett-type corrections for random-effects meta-analysis

