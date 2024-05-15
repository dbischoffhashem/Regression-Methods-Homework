library(faraway)
data(meatspec,package="faraway")  

#Perform a multiple regression on all 100 predictors from the meatspec dataset in the 
#faraway package and extract the p-values for the coefficients of the 100 variables.
#use the commands below to extract the 100 p-values (excluding the intercept)
#Use lmod as the name of the regression object you create on all 100 variables
lmod <- lm(fat ~ ., data = meatspec)
p_values = summary(lmod)$coefficients[, 4]
p_values

#Use the p-values vector to list the variables with coefficients that are significantly
#different from 0 
#a) using NO FWER adjustment (use alpha=.05 for each test of hypothesis).
significant_vars <- names(p_values[p_values < .05])
significant_vars

#b) using the Bonferroni procedure to control the FWER alpha at 0.05.
p_values_bonferroni =  round(p.adjust(p_values,"bonferroni"), 5)
significant_vars_bonferroni = names(p_values_bonferroni[p_values_bonferroni < .05])
significant_vars_bonferroni

#c) using the Holm procedure to control the FWER alpha at 0.05.
p_values_holm =  round(p.adjust(p_values,"holm"), 5)
significant_vars_holm = names(p_values_holm[p_values_holm < .05])
significant_vars_holm
