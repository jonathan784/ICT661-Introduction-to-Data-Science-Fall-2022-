# Jonathan Jimenez
#Project 1 08/29/2022

die <- 1:6

die * die

die + 1:4

die %*% die

#Rounding/Factorial/mean/
round(3.1415)
factorial(3)
mean(1:6)
mean(die)
round(mean(die))
round(3.1415, digits = 2)

#Rolling Die
sample(x = die, size = 1)
sample(die, size = 1)
sample(die, size = 2, replace = TRUE)


#How to see args
args(round)


#RUN Main
#dice <- sample(die, size = 2, replace = TRUE)
#`dice

#Roll Function
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}
roll()


#Roll Bones
roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

roll2()

#Extract functions - RStudio comes with a tool that can help you build functions. To use it, highlight the lines of code in your R script that you want to turn into a function. Then click Code > Extract
---------------------------------------------------------------------------------------------------------------
  
  
  #PART 3
  #Rolling die in my favor
  
install.packages("ggplot2")
library("ggplot2")

#QPLOT

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
## -1.0 -0.8 -0.6 -0.4 -0.2  0.0  0.2  0.4  0.6  0.8  1.0

y <- x^3
y
## -1.000 -0.512 -0.216 -0.064 -0.008  0.000  0.008
##  0.064  0.216  0.512  1.000

qplot(x, y)

x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)




#Rolls Replicated
rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)



#SKEWING RESULTS
roll3 <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE,  prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}
roll3()

#SKEWING AND REPLICATING
rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)


