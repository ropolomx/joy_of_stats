#install.packages("Hmisc",dependencies = TRUE)


library("Hmisc")


mydata <- iris

str(mydata)


Fit  <- lm (mydata$Petal.Width ~ mydata$Petal.Length)

summary(Fit)


plot(mydata$Petal.Width,mydata$Petal.Length,col = "blue",main = "Petal.Width & Petal.Length Regression",cex = 1.3,pch = 16,xlab = "Petal.Length",ylab = "Petal.Width")

abline(lm(mydata$Petal.Length~mydata$Petal.Width), col="red", lwd=3, lty=1)

text(0.8, 6, "Y = -0.363 + 0.415 * X \n R-squared:  0.9266", cex = 1.5,col="red")