
#####################################
#  Linear Regression 
######################################


#install.packages("Hmisc",dependencies = TRUE) 
library("Hmisc")



Fit  <- lm (mydata$Sepal.Length ~ mydata$Petal.Length)

summary(Fit)


plot(mydata$Sepal.Length ~ mydata$Petal.Length,
     col = "blue",
     main = "mydata$Sepal.Length &  mydata$Petal.Length Regression",
     cex = 1.3,
     pch = 16,
     xlab = "Sepal.Length",
     ylab = "Sepal.Width",
     xlim = c(3,8),
     ylim=c(3,8)
    )

abline(lm(mydata$Sepal.Length ~ mydata$Petal.Length), col="red", lwd=3, lty=1)

text(6, 5, paste("Y =", 
                 round(Fit$coefficients[1],3), 
                 "+" , 
                 round(Fit$coefficients[2],3),
                 "* X", "\nR-squared:", 
                 summary(Fit)$adj.r.squared), 
     cex = 1.5,
     col="red")
