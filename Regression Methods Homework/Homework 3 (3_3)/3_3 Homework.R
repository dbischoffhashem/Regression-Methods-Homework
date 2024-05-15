football.data <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 3 (3_3)/B1.csv",header = TRUE)
football.data

#(a) a. Find a 95% CI on β7. 
lmod <- lm(y ~ x2 + x7 + x8, data = football.data)
confint(lmod)
# The 95% confidence interval for β7 is (0.011855322, 0.376065098)

#(b) Find a 95% CI on the mean number of games won by a team when x2 = 2300, x7 = 56.0, and x8 = 2100.
predict(lmod, data.frame(x2=2300,x7=56,x8=2100), interval = "confidence", level = 0.95)
#The 95% confidence interval  on the mean number of games won by a team when x2 = 2300, 
#x7 = 56.0, and x8 = 2100 is (6.436203, 7.996645)

#(c) Compute a prediction interval on the number of games won using the same X settings 
#that are given in part b.
predict(lmod, data.frame(x2=2300,x7=56,x8=2100), interval = "prediction", level = 0.95)
#The 95% prediction interval is (3.609523, 10.82332)

#(d) For each part a-c, write an one sentence interpretation of the Confidence Interval
#/Prediction Interval.

#a.We are 95 percent confident that the true value of β7 falls between 0.0119 and 0.376. 

#b.We are 95 percent confident that the mean number of games won falls between 6.436 and 
#7.997 when the passing yards equal 2300, the percent rushing yards equal 56, and the
#Opponents’ rushing yards equal 2100.

#c.We are 95% confident that the next new observation of the number of games a team won 
#will fall between 3.610 and 10.823.