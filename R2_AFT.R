# Code for implementing the R2 measure for AFT models

rm(list = ls())  # remove everything in the working environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))  # set working directory to the directory where this file is

library(survival)

# ----------------------------------------------------------------------------------
# Function for implementing the R2 measure for AFT model 
# ----------------------------------------------------------------------------------
# Input arguments:
##   fit.AFT: a survreg object from fitting an AFT model using survreg()
##   data: the data frame used to obtain the fitted object fit.AFT
# Output: the R2 measure
R2_AFT <- function(fit.AFT, data){
    dist = fit.AFT$dist
    sigma = fit.AFT$scale
    
    beta = coef(fit.AFT)[-1]
    Z = as.matrix(data[, names(beta)])
    var_Zbeta = var(as.vector(beta%*%t(Z)))
    
    if(dist == "logistic" | dist == "loglogistic"){
        var_epsilon = pi^2/3
    }else if(dist == "weibull" | dist == "exponential"){
        var_epsilon = pi^2/6
    }else if(dist == "gaussian" | dist == "lognormal"){
        var_epsilon = 1
    }
    
    R2 = 1 - sigma^2*var_epsilon/(var_Zbeta + sigma^2*var_epsilon)
    
    return(R2)
}
# End of the function --------------------------------------------------------------




# ----------------------------------------------------------------------------------
### Code for fitting an AFT model using survreg() and compute the R2 measure
### Use the 'ovarian' data set from the 'survival' package as an illustration

# fit the AFR model
fit.AFT = survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='weibull')  
# you may choose other distribution, see the R document for surveg() for more details


R2_AFT(fit.AFT, ovarian)


