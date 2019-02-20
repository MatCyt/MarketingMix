# Addstock run through optimization

# credit: https://analyticsartist.wordpress.com/2014/01/31/adstock-rate-deriving-with-analytical-methods/

# Define Adstock Function
adstock <- function(x, rate=0){
  return(as.numeric(filter(x=x, filter=rate, method="recursive")))
}

# Run Optimization
modFit <- nls(sales~b0+b1*adstock(ad, rate), 
              start=c(b0=1, b1=1, rate=0))
summary(modFit)
