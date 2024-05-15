library(faraway)
data(meatspec,package="faraway")

#Use the R programs covered in the MultipleTesting module as a guide for HW10.
#Perform a multiple regression on all 100 predictors from the meatspec dataset in the 
#faraway package and extract the p-values for the coefficients of the 100 variables.
lmod <- lm(fat ~ ., data = meatspec)
p_values = summary(lmod)$coefficients[, 4]
p_values

#Use the p-values vector to list the variables with coefficients that are significantly
#different from 0 using the Benjamini-Hochberg procedure with an FDR of 0.2  
p_values_bh <- p.adjust(p_values, method = "fdr")
significant_vars_bh <- names(p_values_bh[p_values_bh < 0.2])
significant_vars_bh
