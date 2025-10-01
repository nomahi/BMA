
# BMA package


## Bartlett-type corrections for improved confidence intervals in random-effects meta-analysis

In medical meta-analysis, the DerSimonian–Laird and restricted maximum likelihood (REML) confidence intervals for the average treatment effect have been widely used in practice. However, it is well recognized that their coverage probabilities, that is, the probabilities that the intervals contain the true value, can fall substantially below the nominal level. One important reason is that the validity of these confidence intervals relies on the assumption that the number of studies included in the synthesis is sufficiently large. In most medical meta-analyses, however, the number of studies is fewer than 20. Noma (2011) (https://doi.org/10.1002/sim.4350) developed three alternative confidence intervals to improve coverage performance, based on (i) the Bartlett-corrected likelihood ratio statistic, (ii) the efficient score statistic, and (iii) the Bartlett-type adjusted efficient score statistic. The Bartlett and Bartlett-type corrections enhance the large-sample approximations for the likelihood ratio and efficient score statistics, and markedly improve coverage performance.



## Installation

Please download "BMA_1.1.1.tar.gz" and install it by R menu: "packages" -> "Install package(s) from local files...".

Download: [please click this link](https://github.com/nomahi/BMA/raw/main/BMA_1.1.1.tar.gz)

Manual: [please click this link](https://github.com/nomahi/BMA/blob/main/BMA_1.1.1.pdf)





```r

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


