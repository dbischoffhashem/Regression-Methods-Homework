reaction.data <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 4 (3_8)/B5.csv",header = TRUE)
lmod <- lm(y ~ x6 + x7, data = reaction.data)

#(a) Fit a multiple regression model relating CO2 product (y) to total solvent (x6) and hydrogen consumption (x7). 
summary(lmod)
#y =  2.526460 + 0.018522x6 + 2.185753x7

#(b) Test for significance of regression. Calculate R2 and RAdj 2. 
#The F-statistic is 27.95 with a p-value of 5.391e-07, indicating the model is significant
#R^2 = 0.6996 R^2 adjusted = 0.6746

#(c) Using t tests determine the contribution of x6 and x7 to the model. 
#x6 and x7 are both significant because they both have p-values of less than 0.05 (5.66e-07 
#for x6 and 0.0341 for x7)

#(d) Construct 95% CIs on β6 and β7. 
confint(lmod)
# CI on β6 = (0.01285196, 0.02419204), CI on β7 = (0.17820756, 4.19329833)

#(e) Refit the model using only x6 as the regressor. Test for significance of regression and calculate 
#R2 and RAdj 2 . Discuss your findings. Based on these statistics, are you satisfied with this model? 
lmod2 <- lm(y ~ x6, data = reaction.data)
summary(lmod2)
# y = 6.144181 + 0.019395x6  
#The model with only x6 is still significant with a p-value of 6.24e-07.
#R^2 = 0.6365, adjusted R^2 = 0.6219. 
# X6 is still significant, and the R^2 and adjusted R^2 are only slightly smaller than in the 
#model with x6 and x7, suggesting that the model with only x6 may be sufficient.

#(f) Construct a 95% CI on β6 using the model you fit in part e. Compare the length of this CI to the length
#of the CI in part d. Does this tell you anything important about the contribution of x7 to the model?
confint(lmod2)
# CI = (0.01335688, 0.02543261)
#The length of this CI is very close to the length of the CI with x7, indicating that the inclusion of x7 did
#not have a substantial impact on the precision of the estimate for β6. 

#(g) Compare the values of MSRes obtained for the two models you have fit (parts a and e). How did the MSRes change
#when you removed x7 from the model? Does this tell you anything important about the contribution of x7 to the model?
anova(lmod)
anova(lmod2)
#The MSE for the model with both regressors is 98.5 while the MSE when I removed x7 is 114.4, which is larger. 
#This information indicates that the model with x7 included better fit the data. 

