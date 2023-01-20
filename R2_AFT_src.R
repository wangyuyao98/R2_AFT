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


