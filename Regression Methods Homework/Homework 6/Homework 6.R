library(faraway)
library(olsrr)
library(car)
p3_1 <- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 6/B1.csv",header = TRUE)
lmod = lm(y ~ x2+x7+x8,data=p3_1)
#(a) Generate output using the summary and anova statements.
summary(lmod)
anova(lmod)

#(b) generate a Q-Q plot 
pdf(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 6/HW6_graphs.pdf")
qqnorm(residuals(lmod),ylab="Residuals",main="Q-Q plot")
qqline(residuals(lmod))

#c) Construct plots of the residuals versus each of the regressor variables. Do these plots imply 
#that the regressor is correctly specified and whether powers of X should be added to the model
#plot for x2
plot(p3_1$x2,residuals(lmod),xlab="x2",ylab="Residuals")
abline(h=0)

#plot for x7
plot(p3_1$x7,residuals(lmod),xlab="x7",ylab="Residuals")
abline(h=0)

#plot for x8
plot(p3_1$x8,residuals(lmod),xlab="x8",ylab="Residuals")
abline(h=0)

# Close the PDF device
dev.off()
