# Marketing Mix implementation 
# source : http://rpubs.com/nihil0/mmm01

# libraries ----
install.packages("bayesm")
library(bayesm)
library(dplyr)

# dataset ----
data("cheese")

head(cheese)
summary(cheese) # disp stands for display activity

# create adstock transformation - save this for later!

adstockTransform <- function(x){
  stats::filter( 1/(1+exp(-2*x)), 0.25, method = "recursive")
}

# transform original dataset - log values for volume, price and adstock transformation for display activity
retail_data = cheese %>% 
  filter(RETAILER == 'CHICAGO - DOMINICK') %>%
  select(-RETAILER) %>% 
  mutate(log.volume = log(VOLUME), log.price = log(PRICE), adstock = adstockTransform(DISP)) %>%
  select(-VOLUME, -DISP, -PRICE)

# run model
adjusted_model = lm(log.volume ~ adstock + log.price, data = retail_data)
summary(adjusted_model)


# simple model for comparison - without transformations for same retailer
retail_data_test = cheese %>% 
  filter(RETAILER == 'CHICAGO - DOMINICK') %>%
  select(-RETAILER)

simple_model = lm(VOLUME ~ DISP + PRICE, data = retail_data_test)
summary(simple_model) # DISP is not significant! Interesting
