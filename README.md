<!--- R2_AFT --->

# R-squared measure for AFT model

The repository contains code for implementing the R-squared measure for AFT model proposed in the Chan et. al (2018) paper [DOI: 10.1080/03610918.2016.1177072](https://doi.org/10.1080/03610918.2016.1177072).

We use the `ovarian` data set from the `survival` R package as an illustration.
The R script `main.R` contains the main code for fitting an AFT model and compute the R2 measure, and the The R script `R2_AFT_src.R` contains the function `R2_AFT()` that takes a `survreg` object from fitting an AFT model and the data used to fit the AFT model as input, and output the R-squared measure.

## Usuage of the function `R2_AFT()`

`R2_AFT(fit.AFT, data)`

### Arguments
<!------> | <!------>
--- | ---
fit.AFT | result of a model fit using the survreg function
data |data used to get the model fit 'fit.AFT'
 
### Output value

The R2 measure.
