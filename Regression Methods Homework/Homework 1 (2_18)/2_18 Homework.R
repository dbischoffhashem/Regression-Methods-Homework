library(faraway)
prob2_18 <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 1 (2_18)/prob2_18.csv",header = TRUE)
print(prob2_18)
lmod <- lm(ret_impress ~ amount, prob2_18)

#(a) Fit the simple linear regression model to these data. 
pdf(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 1 (2_18)/prob2_18_graphs.pdf")
plot(ret_impress~amount,prob2_18)
abline(lmod)

summary(lmod)
# equation: y = 22.16269 + 0.36317x + e

#(b) Is there a significant relationship between the amount a company spends on advertising and retained impressions? Justify your answer statistically. 
anova(lmod)
#The p-value in the anova table is 0.001389, which is less than 0.05. Therefore, 
#there is strong evidence to reject the null hypothesis and conclude that there 
#is a significant relationship between the amount spent on advertisements and 
#the retained impressions.

#(c) Construct the 95% confidence and prediction bands for these data.
lmod <- lm(ret_impress ~ amount, data = prob2_18)

#get predicted y values using regression equation
newx <- seq(min(prob2_18$amount), max(prob2_18$amount), length.out=100)
preds <- predict(lmod, newdata = data.frame(amount=newx), interval = 'confidence')
preds2 <- predict(lmod, newdata = data.frame(amount=newx), interval = 'prediction')

#create plot of x vs. y
plot(ret_impress ~ amount, data = prob2_18)

#add fitted regression line
abline(lmod)

#add confidence and prediction bands
lines(newx, preds[ ,3], lty = 'dashed', col = 'blue')
lines(newx, preds[ ,2], lty = 'dashed', col = 'blue')

lines(newx, preds2[ ,3], lty = 'dashed', col = 'red')
lines(newx, preds2[ ,2], lty = 'dashed', col = 'red')

#(d) Give the 95% confidence and prediction intervals for the number of retained 
#impressions for MCI
new.dat = data.frame(amount = 26.9)

predict(lmod, newdata = new.dat, interval = 'confidence')
predict(lmod, newdata = new.dat, interval = 'prediction')

#confidence interval: (20.18314, 43.68102)
#prediction interval: (-18.64084, 82.50499)

# Close the PDF device
dev.off()

