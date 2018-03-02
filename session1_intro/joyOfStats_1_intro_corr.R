# Introduction to R and RStudio -------------------------------------------

# This is an introduction to the R statistical computing language

# Getting acquainted with the interface -----------------------------------

# Let's create our first project
# RStudio projects help you to get data, scripts, and output organized by
# working directly from one folder in your system

# If you want to know what a function does, you can press F1 in RStudio 
# or type '?<function name>'
# e.g.
?source
?library
?install.packages

# Simple operations -------------------------------------------------------

# Addition
2 + 2
# [1] 4

# Subtraction
3 - 2
# [1] 1

# Multiplication
7 * 7
# [1] 49

# Division
25 / 5
# [1] 5

# Order of operations applies (BEDMAS)
3.4 * 4.3 / 3.5 + 4
# [1] 8.177143
3.4 * 4.3 / 4 + 3.5
# [1] 7.155

# Exponents
2 ^ 3
# [1] 8

# Scientific notation: put the e letter before the exponent
1e3
# [1] 1000

# Boolean logic -----------------------------------------------------------

# There are only TRUE and FALSE values
TRUE
# [1] TRUE
FALSE
# [1] FALSE

# You can also use T and F
T
# [1] TRUE
F
# [1] FALSE

# You get these when evaluating statements
5 > 1
# [1] TRUE
7 < 2
# [1] FALSE

# AND operations (&)
TRUE & TRUE
# [1] TRUE
TRUE & FALSE
# [1] FALSE
TRUE & TRUE & FALSE
# [1] FALSE

# OR operations (|)
TRUE | FALSE
# [1] TRUE

# NOT operations (!)
!(TRUE & TRUE & FALSE)
# [1] TRUE

# Variables ---------------------------------------------------------------

# You have been printing things on the console. 
# What if we want to keep those values for later?
# This is what variables are for.

# Use the arrow <- to assign a value to a variable

x <- 7

# Return the value stored by the variable by typing its name
x
# [1] 7

# Use variables in other operations
x + 3
# [1] 10

# Modify variables
y <- 20
y <- y + 3
y
# [1] 23


# Vectors -----------------------------------------------------------------

# Vectors are the basic data structure in R

# This structure is useful for grouping values and variables

# Let's start with atomic vectors

# There are four common types of atomic vectors: 
# logical (boolean), integer, double (numeric), and character

# You can create a vector by using the c() function (combine)

new_vector <- c(29, 53, 87, 9, 100, 54, 91, 4)

new_vector

# [1]  29  53  87   9 100  54  91   4


# You can access individual elements by using their index
# In the R language, we start counting from 1
# This is different from other programming languages where you start from zero

new_vector[5]

# [1] 100

# Not sure how many elements are in a vector?
# You can use the length function to find out

length(new_vector)

# [1] 8

# Test for the presence of an element in a vector using %in%

87 %in% new_vector

# [1] TRUE

# A very nice thing about vectors is that you can apply the same operation 
# to each of its elements

new_vector + 4

# [1]  33  57  91  13 104  58  95   8

new_vector > 10

# [1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE

# You can generate a numeric vector by using a range of numbers

# [1]  1  2  3  4  5  6  7  8  9 10

# You can use the rep function to create a vector with repeated elements

rep(7, times=5)

# [1] 7 7 7 7 7

# You can apply this to numeric ranges 

rep(1:5, times = 3)

# [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5

# And now to each element of the numeric range

rep(1:5, each = 3)

# [1] 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5

# More complex patterns

# Vector of 1:5 repeated 5 times 
# with each element being repeated 2 times (each=2)
rep(1:5, 5, each=2)
#  [1] 1 1 2 2 3 3 4 4 5 5 1 1 2 2 3 3 4 4 5 5 1 1 2 2 3 3 4 4 5 5 1 1 2 2 3 3 4 4
# [39] 5 5 1 1 2 2 3 3 4 4 5 5

# Sort a vector
sort(rep(1:5, 5, each=2))
#  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4
# [39] 4 4 5 5 5 5 5 5 5 5 5 5

# Let's check what are the unique elements in the vector

repetition_vector <- rep(1:5, 5, each=2)

unique(repetition_vector)

# [1] 1 2 3 4 5

# Comparing sets of unique elements
# Let's create a second vector to compare with new_vector

new_vector2 <- c(59, 53, 87, 9, 100, 54, 97, 45)

# Use setdiff to obtain the difference between sets

setdiff(new_vector, new_vector2)

# [1] 29 91  4

setdiff(new_vector2, new_vector)

# [1] 59 97 45

# What if you are curious about the intersection of those sets (elements in common)

intersect(new_vector,new_vector2)

# [1]  53  87   9 100  54


# Matrices ----------------------------------------------------------------

# Typically you won't deal with atomic, one-dimensional vectors as often as 
# other data structures such as the matrix

# In R, matrices are two-dimensional vectors!

random_matrix <- matrix(data=rnorm(100), nrow=10, ncol=10)

# We can look at the first few lines of an object with head

head(random_matrix)

#            [,1]        [,2]       [,3]         [,4]        [,5]       [,6]        [,7]       [,8]
# [1,]  0.4896758  1.24007419 -0.5651654  0.915740038 -0.37954715 -0.2832122 -1.19266438  0.1331632
# [2,] -0.3027539  1.81729437 -1.6624630 -0.003011218 -0.54154617  0.7199738 -0.43332961  0.1550357
# [3,]  0.4346023  0.04941401 -0.4367367  0.171281532 -0.84465718 -0.3471709  0.01346195  0.4622826
# [4,] -0.5198246  0.09505714  0.1285956  0.511747785 -0.39407066  0.6023197 -0.90514463 -0.2239237
# [5,] -0.6709043 -0.48013469  2.0995517 -0.319253424 -0.07937916  0.1975055 -1.23011484 -1.1050788
# [6,] -0.3209905 -0.24706062 -0.4949833  1.560382765 -1.50965915 -0.6767812 -2.00183448  1.6774728
#             [,9]       [,10]
# [1,] -0.09579729  0.07420942
# [2,]  0.27591051  0.20040263
# [3,]  1.11336620  0.12007993
# [4,] -0.20249855  0.63441484
# [5,] -0.09324106 -0.69696529
# [6,] -2.16443823 -1.00024832


# We can check the dimensions of the matrix with dim

dim(random_matrix)

# [1] 10 10

# matrix(data=rnorm(100), nrow=10, ncol=10)

# We can also check the number of rows and number of columns 

nrow(random_matrix)

# [1] 10

ncol(random_matrix)

# [1] 10

# Summary statistics of the matrix

summary(random_matrix)

# V1                V2                 V3                 V4                 V5         
# Min.   :-0.6709   Min.   :-3.10620   Min.   :-1.66246   Min.   :-1.18557   Min.   :-1.5097  
# 1st Qu.:-0.3164   1st Qu.:-0.55351   1st Qu.:-0.54762   1st Qu.: 0.04056   1st Qu.:-0.5047  
# Median : 0.3379   Median :-0.34677   Median :-0.41434   Median : 0.67816   Median :-0.2295  
# Mean   : 0.1523   Mean   :-0.29725   Mean   :-0.16515   Mean   : 0.56255   Mean   : 0.0866  
# 3rd Qu.: 0.4759   3rd Qu.: 0.08365   3rd Qu.: 0.04592   3rd Qu.: 1.23110   3rd Qu.: 0.7531  
# Max.   : 1.1838   Max.   : 1.81729   Max.   : 2.09955   Max.   : 1.79336   Max.   : 2.0128  
# V6                V7                V8                 V9                V10          
# Min.   :-0.9407   Min.   :-2.0018   Min.   :-1.88463   Min.   :-2.16444   Min.   :-1.98015  
# 1st Qu.:-0.3312   1st Qu.:-1.1208   1st Qu.:-0.91687   1st Qu.:-0.09516   1st Qu.:-0.61797  
# Median : 0.0589   Median :-0.4347   Median :-0.04538   Median : 0.11158   Median : 0.07409  
# Mean   : 0.4331   Mean   :-0.4069   Mean   :-0.14336   Mean   : 0.05415   Mean   :-0.24072  
# 3rd Qu.: 0.6906   3rd Qu.: 0.4477   3rd Qu.: 0.38547   3rd Qu.: 0.53722   3rd Qu.: 0.18032  
# Max.   : 2.5926   Max.   : 0.8099   Max.   : 1.67747   Max.   : 1.11337   Max.   : 0.63441  


# Statistics are give for each column. We need to convert the matrix as vector to 
# calculate the summary statistcs for the entire matrix

summary(as.vector(random_matrix))

#     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# -3.106199 -0.501194 -0.025136  0.003527  0.607822  2.592593 

# Slicing matrices by row

# One row

random_matrix[1,]

# [1]  0.48967575  1.24007419 -0.56516543  0.91574004 -0.37954715 -0.28321217 -1.19266438 0.13316324 -0.09579729  0.07420942

# Range of rows

random_matrix[1:3,]

#            [,1]       [,2]       [,3]         [,4]       [,5]       [,6]        [,7]      [,8]
# [1,]  0.4896758 1.24007419 -0.5651654  0.915740038 -0.3795472 -0.2832122 -1.19266438 0.1331632
# [2,] -0.3027539 1.81729437 -1.6624630 -0.003011218 -0.5415462  0.7199738 -0.43332961 0.1550357
# [3,]  0.4346023 0.04941401 -0.4367367  0.171281532 -0.8446572 -0.3471709  0.01346195 0.4622826
#             [,9]      [,10]
# [1,] -0.09579729 0.07420942
# [2,]  0.27591051 0.20040263
# [3,]  1.11336620 0.12007993

# Slicing matrices by column

# [1]  0.4896758 -0.3027539  0.4346023 -0.5198246 -0.6709043 -0.3209905  1.1838235  0.5535136 0.2870675  0.3887515

# Applying operations to the entire matrix

random_matrix * 100

#           [,1]        [,2]       [,3]         [,4]        [,5]       [,6]        [,7]       [,8]
# [1,]  48.96758  124.007419  -56.51654   91.5740038  -37.954715 -28.321217 -119.266438   13.31632
# [2,] -30.27539  181.729437 -166.24630   -0.3011218  -54.154617  71.997379  -43.332961   15.50357
# [3,]  43.46023    4.941401  -43.67367   17.1281532  -84.465718 -34.717086    1.346195   46.22826
# [4,] -51.98246    9.505714   12.85956   51.1747785  -39.407066  60.231974  -90.514463  -22.39237
# [5,] -67.09043  -48.013469  209.95517  -31.9253424   -7.937916  19.750550 -123.011484 -110.50788
# [6,] -32.09905  -24.706062  -49.49833  156.0382765 -150.965915 -67.678122 -200.183448  167.74728
# [7,] 118.38235 -131.649762  -20.21130   84.4567923  117.434610 254.597245   80.987886 -170.71777
# [8,]  55.35136  -44.648015  -84.85066  133.6224469  201.281162  -7.970288  -43.612850 -188.46262
# [9,]  28.70675  -57.796797  -39.19350 -118.5571464   79.228191 -94.068653   71.406636  141.14706
# [10,]  38.87515 -310.619925   72.22699  179.3364468   63.545551 259.259263   59.248476  -35.22548
#             [,9]       [,10]
# [1,]   -9.579729    7.420942
# [2,]   27.591051   20.040263
# [3,]  111.336620   12.007993
# [4,]  -20.249855   63.441484
# [5,]   -9.324106  -69.696529
# [6,] -216.443823 -100.024832
# [7,]   27.042891    7.397964
# [8,]   62.432783   54.807750
# [9,]   -4.726127  -38.097850
# [10,]   86.071225 -198.015302

# Transposing a matrix

t(random_matrix * 100)

#             [,1]         [,2]       [,3]       [,4]        [,5]       [,6]        [,7]
# [1,]   48.967575  -30.2753891  43.460231 -51.982461  -67.090432  -32.09905  118.382352
# [2,]  124.007419  181.7294366   4.941401   9.505714  -48.013469  -24.70606 -131.649762
# [3,]  -56.516543 -166.2462997 -43.673671  12.859556  209.955171  -49.49833  -20.211302
# [4,]   91.574004   -0.3011218  17.128153  51.174778  -31.925342  156.03828   84.456792
# [5,]  -37.954715  -54.1546170 -84.465718 -39.407066   -7.937916 -150.96591  117.434610
# [6,]  -28.321217   71.9973790 -34.717086  60.231974   19.750550  -67.67812  254.597245
# [7,] -119.266438  -43.3329612   1.346195 -90.514463 -123.011484 -200.18345   80.987886
# [8,]   13.316324   15.5035681  46.228260 -22.392365 -110.507881  167.74728 -170.717772
# [9,]   -9.579729   27.5910512 111.336620 -20.249855   -9.324106 -216.44382   27.042891
# [10,]    7.420942   20.0402633  12.007993  63.441484  -69.696529 -100.02483    7.397964
#             [,8]        [,9]      [,10]
# [1,]   55.351362   28.706752   38.87515
# [2,]  -44.648015  -57.796797 -310.61992
# [3,]  -84.850655  -39.193499   72.22699
# [4,]  133.622447 -118.557146  179.33645
# [5,]  201.281162   79.228191   63.54555
# [6,]   -7.970288  -94.068653  259.25926
# [7,]  -43.612850   71.406636   59.24848
# [8,] -188.462623  141.147058  -35.22548
# [9,]   62.432783   -4.726127   86.07122
# [10,]   54.807750  -38.097850 -198.01530


# Quick introduction to plotting
# Generate a boxplot of the matrix

boxplot(random_matrix)

# Histogram

hist(random_matrix)

# Data frames -------------------------------------------------------------

# Data frames are the most important data structures in R 
# They are the most common way to store data in R and the most common data structure 
# that biologists will need. 

# Technically speaking, dataframes are lists of vectors of the same length
# They can contain any data type, which is why you can have columns of characters,
# and other columns of numeric values, and columns of booleans, all in the same object


# R comes with a few data frames from installation (datasets package)

# #.g. New York Air Quality Measurements

head(airquality)

#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6

dim(airquality)

# [1] 153   6

# Another example: Iris Data (flower measurements)

head(iris)

#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa



# Exercise: correlation ---------------------------------------------------

# Let's go into more real world examples and let's apply the correlation 
# concepts learned last week.

# Use this to remove all objects from the R global environment if you need to
rm(list=ls())

# R can read CSV (comma-separated value) files natively

example_csv <- read.csv('EXP1.csv', header = TRUE)

# More often than not, you will need to read Excel files directly into R
# In order to do that, you will need to install a packages for reading Excel files

install.packages("readxl", dependencies = TRUE)

library(readxl)

# You can set a working directory on your computer if you wanted to switch to 
# a different folder. However, creating a project simplifies this.
# For example
# setwd("C:/workshop")

# Check what is the current working directory 
getwd()

# Reading data to R memory from Excel

EXP1_data <- read_xlsx("EXP1.xlsx", col_names = TRUE)

# Getting Information on a Dataset

View(EXP1_data)

names(EXP1_data)      #1 list the variables in EXP1_data

str(EXP1_data)        #2 list the structure of EXP1_data

dim(EXP1_data)        #3 dimensions of an object


# Correlation Test Between Two Variables
## A:
cor.test(EXP1_data$Temp,EXP1_data$Rain1,method = "pearson")
 
 #In the result above :
 # t is the t-test statistic value, df is the degrees of freedom
 # p-value is the significance level of the t-test 
 # conf.int is the confidence interval of the correlation coefficient at 95% 
 # correlation coefficient (Cor.coeff = 0.575641).

## B: 
install.packages("Hmisc",dependencies = TRUE)
library(Hmisc)

Cor_result <- rcorr(as.matrix(EXP1_data[4:7]))
 
               # Visualize your data using scatter plots
 str(Cor_result)
 
 ## A: 
 
install.packages("ggpubr", dependencies = TRUE)

library(ggpubr)

ggscatter(EXP1_data, x = "Temp", y = "Rain1", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "C", ylab = "ml")

 ## B:
install.packages("corrplot",dependencies = TRUE)
library(corrplot)

corrplot(Cor_result$r, type = "upper", order = "hclust", 
         tl.col = "darkviolet", tl.srt = 45)
     # tl.col (for text label color) and tl.srt (for text label string rotation) 
     # •Possible values for the argument type are : “upper”, “lower”, “full”

##  C:  cross on no significant coefficient 
corrplot(Cor_result$r, type="upper", order="hclust",tl.col = "darkviolet", tl.srt = 45, 
         p.mat = Cor_result$P, sig.level = 0.05, insig = "pch",method = "pie")


##  D: Use chart.Correlation(): Draw scatter plots
install.packages("PerformanceAnalytics",dependencies = TRUE)
library(PerformanceAnalytics)

chart.Correlation(EXP1_data[4:7], histogram=TRUE, pch=19)


#In the above plot:
#The distribution of each variable is shown on the diagonal.
#On the bottom of the diagonal : the bivariate scatter plots with a fitted line are displayed
#On the top of the diagonal : the value of the correlation plus the significance level as stars
#Each significance level is associated to a symbol : p-values(0, 0.001, 0.01, 0.05, 0.1, 1) <=> symbols(“***”, “**”, “*”, “.”, " “)

## E (homework): try to apply the steps you learned above to one of the datasets that come with R (e.g. aiquality)

# Also, try to apply the function pairs to generate a scatterplot matrix
