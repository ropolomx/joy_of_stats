rm(list=ls())

library("data.table")
library("readxl")
library("leaps")
library("Matrix")
library("glmnet")
library("FactoMineR")

EXP_Data <- read_xlsx("C:/Users/MaramiMilaniM/R_Prog/workshop/Data/EXP_Data_1.xlsx",col_names=TRUE)

INDEPENDENTS <- EXP_Data[,c(2:11)]
DEPENDENT    <- EXP_Data[,12]   # DMD_6
View(EXP_Data)
####   LASSO 

colour_name= c(1:8,"darkblue","violet")
plot(glmnet(x=as.matrix(INDEPENDENTS) ,y=as.matrix(DEPENDENT),standardize=TRUE),col=colour_name,label=TRUE,main="",xvar = "lambda", xlab="Log(Lambda) ",lwd=2,ylim=c(0.05,-0.4),xlim=c(-10,2))
legend(-10,-0.4, cex=.9, title="",names(INDEPENDENTS), text.col=colour_name,lwd=0,horiz=FALSE, col=colour_name,fill=colour_name)

# finding less Mean Squared Error

plot(cv.glmnet(x=as.matrix(INDEPENDENTS) ,y=as.matrix(DEPENDENT),standardize=TRUE))

# which predictors
# selecting predictors that coefficients > |0.0|
round(coef(cv.glmnet(x=as.matrix(INDEPENDENTS) ,y=as.matrix(DEPENDENT),standardize=TRUE),s="lambda.min"),3)


# best Linear Multiple Regression Model

fit <- lm(EXP_Data$DMD_6 ~ EXP_Data$P_2 + EXP_Data$P_1 +  EXP_Data$UNP_1 +  EXP_Data$UNP_2 )
summary(fit)

Error_est <- round(sqrt((sum(EXP_Data$DMD_6 - predict(fit))**2)/dim(DEPENDENT)[1]),3)

# for more information about LASSO : https://www.rdocumentation.org/packages/glmnet/versions/2.0-12/topics/glmnet

#### leaps
leapSet <- leaps(x=as.matrix(INDEPENDENTS) ,y=as.matrix(DEPENDENT), nbest = 1, method = "adjr2") 
leapSet$which
leapSet$adjr2
max(leapSet$adjr2)
names(INDEPENDENTS)

summary(lm(EXP_Data$DMD_6 ~ EXP_Data$P_2 + EXP_Data$P_1 +  EXP_Data$UNP_2 +  EXP_Data$UNP_1 ))
# for more information about leaps: https://www.rdocumentation.org/packages/leaps/versions/3.0/topics/leaps

####    regsubsets
regsubsetsObj <- regsubsets(x=as.matrix(INDEPENDENTS) ,y=as.matrix(DEPENDENT), nvmax=11)
plot(regsubsetsObj, scale = "adjr2",main="DMD 6")  # regsubsets plot based on Adjusted R-squared 
abline(h=10,col="red") ; abline(v=c(4,5,9,10),col="blue")

fit <- lm(EXP_Data$DMD_6 ~ EXP_Data$P_2 + EXP_Data$P_1 +  EXP_Data$UNP_2 +  EXP_Data$UNP_1 )
summary(fit)

# for more information about regsubsets : https://www.rdocumentation.org/packages/leaps/versions/2.1-1/topics/regsubsets



####   FactoMineR

regMod <- RegBest(y=as.matrix(DEPENDENT), x = as.matrix(INDEPENDENTS), nbest = 1,method=c("adjr2"))
regMod$best  # best model

# for more information about RegBest   : https://cran.r-project.org/web/packages/FactoMineR/FactoMineR.pdf


###################   Practice    
# Please find best predictors and modele between Independents and DMD_48 as dependent:




matplot(y= EXP_Data$DMD_6,x=cbind(EXP_Data$P_2,EXP_Data$P_1,EXP_Data$UNP_1 ,  EXP_Data$UNP_2), pch = 15:18,xlab = "INDEPENDENTS", ylab = "DEPENDENT")
legend("topright", inset=0.01, legend=names(plot_mat[2:5]), col=c(1:5),pch=15:18,bg= ("white"), horiz=F)

abline(lm(EXP_Data$DMD_6 ~  EXP_Data$P_2 + EXP_Data$P_1 +  EXP_Data$UNP_1 +  EXP_Data$UNP_2 ), col="red", lwd=3, lty=1)
text(200,23, paste("Y =", round(fit$coefficients[1],3), "+" ,
                  round(fit$coefficients[2],3),"P-1","+" ,
                  round(fit$coefficients[3],3),"P-2","+" ,
                  round(fit$coefficients[4],3),"UNP-1","+" ,
                  round(fit$coefficients[5],3),"UNP-2"),
     cex = 0.8,col="darkblue")
# for more information: https://www.rdocumentation.org/packages/fda/versions/2.4.7/topics/matplot  
     