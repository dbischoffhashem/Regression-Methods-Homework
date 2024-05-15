library(faraway)
library(lmtest)
library(epiDisplay)
data <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 8/p13_7modified.csv", header = TRUE)
#(a) Fit a logistic regression model to the data.
logistic = glm(y ~ x1 + x2 + x3 + x4, family=binomial(logit), data= data)
summary(logistic)
# y = -26.126980 - 0.002629x1 + 0.447578 - 0.036801 - 0.108837

#(b) Test H0: all Beta-parameters are 0 versus at least one Beta-parameter is not 0.
null_model = glm(y ~ 1,family=binomial(logit), data=data)
lrtest(null_model,logistic) 
#Reject the hull hypothesis. At least one beta parameter is not 0.

#(c) Plot the observed binary responses versus the fitted values.
pdf(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 8/HW8_graph.pdf")
plot(logistic$fitted.values,data$y)

#(d) Use the logistic.display function found in the epiDisplay library to show statistics for 
# each individual parameter from the logistic regression performed in part a.
logistic.display(logistic)

# Close the PDF device
dev.off()