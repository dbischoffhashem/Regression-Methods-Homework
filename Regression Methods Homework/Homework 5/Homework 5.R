library(faraway)
B17<- read.csv(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 5/B17.csv",header = TRUE)
#a) generate a basic scatter plot matrix
pdf(file="C:/Users/Dimab/OneDrive/Desktop/Regression Methods Homework/Homework 5/HW5_graphs.pdf")
plot(B17)

#b) generate correlation matrix
cor_matrix <- cor(B17)
cor_matrix

#c) obtain least squares prediction equation
lmod1 <- lm(Satisfaction ~ Age + Severity + SurgicalMedical + Anxiety, data = B17)
summary(lmod1)
# Satisfaction = 140.1689 + -1.1428(Age) + -0.4699(Severity) + 2.2259(SurgicalMedical) + 1.2673(Anxiety) 

#d) compute VIFs
vif(lmod1)
#VIF for Age = 1.939128
#VIF for Severity = 1.441055
#VIF for SurgicalMedical = 1.072782 
#VIF for Anxiety = 1.689768 

#e) interpret the Beta estimate of Anxiety in the model
#Every one unit increase in Anxiety while all other regressors are held constant results in a
#1.2673 increase in satisfaction (y).

#f) perform a partial F-test for Anxiety
lmod2 <- lm(Satisfaction ~ Anxiety, data = B17)
anova(lmod1,lmod2)
#the p-value is 2.707e-06, which is less than 0.05, so we can reject the null hypothesis and conclude
#that anxiety is significant.

# Close the PDF device
dev.off()