library(faraway)
house.data <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 2 (3_7)/B4.csv",header = TRUE)

#(a) Fit a multiple regression model relating selling price to all nine regressors. 
pdf(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 2 (3_7)/3_7_graphs.pdf")
plot(house.data)
#y = 14.92765 + 1.92472x1 + 7.00053x2 + 0.14918x3 + 2.72281x4 + 2.00668x5 + -0.41012x6 + -1.40324x7 + -0.03715x8 + 1.55945x9


#(b) Test for significance of regression. What conclusions can you draw? 
lmod <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9, data = house.data)
summary(lmod)
#Since the p-value is 0.000185, which is less than 0.05, we can conclude that at least one of 
#the regressors is significant (has a nonzero β value).


#(c) Use t tests to assess the contribution of each regressor to the model. Discuss your findings. 
#None of the t-tests for the individual regressors have a p-value less than 0.05. This is likely 
#due to issues of multicollinearity. 

#(d) What is the contribution of lot size and living space to the model given that all of the other regressors are included? 

# remove x3 and x4
lmod_reduced <- lm(y ~ x1 + x2 + x5 + x6 + x7 + x8 + x9, data = house.data)
summary(lmod_reduced)

f_test <- anova(lmod, lmod_reduced)
print(f_test)

#The F-statistic is 0.3225 with a p-value of 0.7296, which is not significant at the 0.05 
#level. This test indicating there is not a significant difference between the regression
# model with x3 and x4 and the regression model without them.


#(e) Is multicollinearity a potential problem in this model?
vif(lmod)
#Yes, multicollinearity is a potential problem in this model because the VIF values for all 
#the regressors are greater than 1. In particular, regressors x1, x6, and x7 have VIF values 
#much higher than 1, indicating these variables significantly contribute to multicollinearity 
#issues in the model.

# Close the PDF device
dev.off()
