library(faraway)
library(olsrr)
ridge_data <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 7/ridge_data.csv",header = TRUE)
lmod <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x8 + x9 + x10, data = ridge_data)

#(a) using forward stepwise selection. Specify your chosen model.
k <- ols_step_forward_p(lmod, details=TRUE)
k
# y = 7.179 - 0.044x1 + 3.077x4

#(b) using backward stepwise elimination selection. Specify your chosen model.
k <- ols_step_backward_p(lmod,details=TRUE)
# y = 4.590 + 2.597x5 + 0.218x8 - 0.009x10

#(c) using bi-directional stepwise selection. Specify your chosen model.
k <- ols_step_both_p(lmod,details=TRUE)
# y = 33.490 - 0.047

#(d) perform all possible regressions using variables x1, x2, x3, x4 , x5, x8. Choose your own best model 
#among all possible regressions using a metric you choose and explain your choice in a sentence or two.
lmod2 <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x8, data = ridge_data)
k <- ols_step_all_possible(lmod2,sbc=TRUE)
k
# x1, x4
lmod3 <- lm(y ~ x1 + x4, data = ridge_data)
summary(lmod3)
# y = 7.179421 - 0.044479x1 + 3.077228x4
# I chose the model with the highest adjusted R^2 value because this metric measures how well the
# data is explained by the model while accounting for the addition of regressors.
