### Code for fitting an AFT model using survreg() and compute the R2 measure
### Use the 'ovarian' data set from the 'survival' R package as an illustration.

rm(list = ls())  # remove everything in the working environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))  # set working directory to the directory where this file is

library(survival)
source("R2_AFT_src.R")


# fit the AFR model
fit.AFT = survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='weibull')  
# you may choose other distribution, see the R document for surveg() for more details


# compute the R2 measure
R2_AFT(fit.AFT)




