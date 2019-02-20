# Simple manually specified addstock
# Credit: https://github.com/AnalyticsArtist/BlogFiles/blob/master/Advertising%20Adstock%20Transformation.R

adstock_rate = 0.50

# Create Data
advertising = c(117.913, 120.112, 125.828, 115.354, 177.090, 141.647, 137.892,   0.000,   0.000,   0.000,   0.000, 
                0.000,   0.000,   0.000,   0.000,   0.000,   0.000, 158.511, 109.385,  91.084,  79.253, 102.706, 
                78.494, 135.114, 114.549,  87.337, 107.829, 125.020,  82.956,  60.813,  83.149,   0.000,   0.000, 
                0.000,   0.000,   0.000,   0.000, 129.515, 105.486, 111.494, 107.099,   0.000,   0.000,   0.000, 
                0.000,   0.000,   0.000,   0.000,   0.000,   0.000,   0.000,   0.000)

# Calculate Advertising Adstock
# Credit: http://stackoverflow.com/questions/14372880/simple-examples-of-filter-function-recursive-option-specifically
adstocked_advertising = filter(x=advertising, filter=adstock_rate, method="recursive")

# Graph Data
plot(seq(1,length(advertising)), advertising, type="h", 
     xlab="Time (Usually in Weeks)", ylab="Advertising", 
     ylim=c(0, max(c(advertising, adstocked_advertising))), 
     frame.plot=FALSE)
lines(adstocked_advertising)