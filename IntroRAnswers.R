
####### Intro to R Course by Nordmo #########

##################### 1) Basic Functionality

# Add 1 and 4
1 + 4

# Multiply 4 and 12
4 * 12

#Divide two numbers
5 / 2

#Make a string/character vector called hello with the string "hello world"
hello <- "hello world"

#Print the hello vector
hello
#or
print(hello)

# Take the square root of 50
sqrt(50)

# Take the log10 of 50
log10(50)

# Take the log of 100
log(100)

# Assign a vector with one number in it
firstvector <- 5

# Display the vector
firstvector

# Remove vector
rm(firstvector)

# Make a vector with three numbers[hint... concatenate]:
second <- c(5,6,11)

# Write code that displays this vector in the Viewer 
View(second)

# Take the log10 of each number in the vector
log10(second)

# Find the mean of this vector
mean(second)

# Find the standard deviation of this vector
sd(second)

# Make av vector with five values and one NA value

third <- c(1,2,3,2,4,NA)

# Take the mean and sd from this vector
mean(third,na.rm = T)
sd(third,na.rm = T)

# Delete both vectors
rm(second,third)

# Make a sequence with numbers from 1 to 50 with a built-inn function, and assign it to a vector
numbers <- 1:50

# Make a sequence  with numbers from 0 to 100, by 2's, and assign it to a vector
twos <- seq(0,100,2)
 
# Sample five random values from this vector with replace = T
sample(twos,5,replace = T)


# Install the package "tidyverse"
install.packages("tidyverse")


# Load the package tidyverse
library(tidyverse)

############################ 2) Functions and basic datamanipulation

# Make a function thats adds two numbers and call it something
something <- function(i,e){
  i + e
}

# Add two numbers using your fancy number adder
something(4,4)

# Make the same function but put in some default values 
something <- function(i = 5,e = 5){
  i + e
}

# Make a function that inputs centimeter measurements and outputs inches
# x cm / 2.54 = inches

incher <- function(y){
  y / 2.54
}

# Repeat the function but add a rounding feature, to one number after desimal
# https://www.dummies.com/programming/r/how-to-round-off-numbers-in-r/
incher <- function(y){
  round(y / 2.54,digits = 1)
}

# Generate 100 random values, with a mean of 0 and an sd of 1, and assign it to a vector
# Values should be normally distributed
# Hint: Spreadsheet or http://www.cookbook-r.com/Numbers/Generating_random_numbers/
x <- rnorm(100,mean = 0,sd = 1)

# Do it again and assign it to another vector
y <- rnorm(100,mean = 0,sd = 1)

# Do a t.test using the two vectors
t.test(x,y)

# Assign the t.test to an object and then locate the p.value
tmodel <- t.test(x,y)

tmodel$p.value
#or
tmodel[[3]]

# Do a linear regression with x predicting y and assign it to an object
linmodel <- lm(y ~ x)

# Use the summary() function to assess the model
summary(linmodel)

# Locate the predicted/fitted values from the model
linmodel$fitted.values

# Locate the coeffictients from the model
linmodel$coefficients


#Load the "Iris" dataset
data(iris)


# View iris dataset
View(iris)

# Look at just the top part of the dataset
head(iris)

# Look at just the bottom of the dataset
tail(iris)

#Look at just the first column in the data
iris[,1]

#Look at just the first row in the data
iris[1,]

# Look at the first row in the first column (cell)
iris[1,1]

# Assign a new value, 2, to this cell
iris[1,1] <- 2

# Look at it again to check that it was changed
iris[1,1]

# Use the $ sign to look at the first column
iris$Sepal.Length

# Add all the numbers in the first column (Sepal.Length) to the numbers in the second column (Sepal.Width)
iris$Sepal.Length + iris$Sepal.Width

# Do the same but add this new column to the iris dataset with name Sepal.Total
iris$Sepal.Total <- iris$Sepal.Length + iris$Sepal.Width

# Remove Sepal.Total from Iris dataset
iris$Sepal.Total <- NULL

# Make a vector with four numbers in it and make sure that the vector is integer
numtest <- as.integer(c(2,4,2,6))

# Convert these values into "numeric"
numtest <- as.numeric(numtest)

# Convert these values into "character"
numtest <- as.character(numtest)

# Convert these values back into integer
numtest <- as.integer(numtest)

##### 3) Data visualization with ggplot2

# Load ggplot either using library(tidyverse) or library(ggplot2)
library(tidyverse)

# Load "iris" dataset 
data("iris")


# View the dataset
View(iris)



# Make a simple point plot of Petal.Length on x and Petal.Width on y
ggplot(iris,aes(Petal.Length,Petal.Width)) + 
  geom_point()


# Change X axis label to "Width" and "Length"
ggplot(iris,aes(Petal.Length,Petal.Width)) + 
  geom_point() + 
  labs(x = "Length", y = "Width")

# Change the Y scale to 0 - 4
ggplot(iris,aes(Petal.Length,Petal.Width)) + 
  geom_point() + 
  ylim(0,4) +
  labs(x = "Length", y = "Width")

# Try adding a different themes and find something you like
ggplot(iris,aes(Petal.Length,Petal.Width)) + 
  geom_point() + 
  scale_y_continuous(limits = c(0,4)) +
  labs(x = "Length", y = "Width") + 
  theme_classic()


# Add a colour on each dot to its respective Species
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  theme_classic()


# Change "ticks"/"breaks" on x axis to display: 1,2,3,4,5,6,7
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  theme_classic()

# Change Y axis to display: 0,1,2,3
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  theme_classic()

# Try to remove the legend completely
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  theme_classic() + 
  theme(legend.position = "none")


# Remove the ellipse but add a linear regression model
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  stat_smooth(method = "lm",formula = y ~ poly(x,2)) +
  theme_classic() + 
  theme(legend.position = "none")

# Make the linear regression model fit through the entire data, not subdivided on Species
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  stat_smooth(method = "lm",inherit.aes = F, aes(Petal.Length,Petal.Width)) +
  theme_classic() + 
  theme(legend.position = "none")

# Same as before but make the regression line "slateblue" and remove standard error markings
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  stat_smooth(method = "lm",inherit.aes = F, 
              aes(Petal.Length,Petal.Width),se = F, color = "slateblue") +
  theme_classic() + 
  theme(legend.position = "none")

# Same as before but make a black loess regression across all observations
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  stat_smooth(method = "loess", inherit.aes = F, aes(Petal.Length,Petal.Width),se = F, color = "black") +
  theme_classic() + 
  theme(legend.position = "none")


# Same as before but create a cubic polynomial
#hint https://stackoverflow.com/questions/11949331/adding-a-3rd-order-polynomial-and-its-equation-to-a-ggplot-in-r
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species)) + 
  geom_point() + 
  labs(x = "Length", y = "Width") + 
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7)) +
  scale_y_continuous(breaks = c(0,1,2,3),
                     limits = c(0,3)) +
  stat_smooth(method = "lm",formula = y ~ poly(x,3), inherit.aes = F, aes(Petal.Length,Petal.Width),se = F, color = "black") +
  theme_classic() + 
  theme(legend.position = "none")


# Load the mtcars dataset
data(mtcars)

# Create a violinplot with x = as.factor(cyl),y = displ
ggplot(mtcars, aes(factor(cyl), disp)) +
  geom_violin()

# Add the rawdata as points
ggplot(mtcars, aes(factor(cyl), disp)) +
  geom_violin() + 
  geom_jitter(height = 0, width = 0.1)

# http://sape.inf.usi.ch/quick-reference/ggplot2/colour
# Make the violin edges dodgerblue1 and violin fill as tomato1, theme(classic), dots as magenta1
# Make the violins transparent 50 %
ggplot(mtcars, aes(factor(cyl), disp)) +
  geom_violin(color = "dodgerblue1",fill = "tomato1",alpha = .5) + 
  geom_jitter(height = 0, width = 0.1,color = "magenta1") + 
  theme_classic()

# Make the colors depend on aes cyl
ggplot(mtcars, aes(factor(cyl), disp,color = cyl)) +
  geom_violin() + 
  geom_jitter(height = 0, width = 0.1) + 
  theme_classic()

# Make the colors depend on aes as.factor(cyl)
ggplot(mtcars, aes(factor(cyl), disp,color = as.factor(cyl))) +
  geom_violin() + 
  geom_jitter(height = 0, width = 0.1) + 
  theme_classic()

# Replace the violins with traditional boxplots
ggplot(mtcars, aes(factor(cyl), disp,color = factor(cyl))) +
  geom_boxplot() + 
  geom_jitter(height = 0, width = 0.1) + 
  theme_classic()

# Make a regular point plot with x = disp, y = mpg, color = factor(cyl), but 
# facet_wrap the plot into am (automatic gear or not)
ggplot(mtcars,aes(disp,mpg,color = factor(cyl))) + 
  geom_point() +
  facet_wrap(~ am)

# Do the same but make the size of each point depend on horsepower (hp)
ggplot(mtcars,aes(disp,mpg,color = factor(cyl),size = hp)) + 
  geom_point() +
  facet_wrap(~ am) 

# Make a density plot with horsepower (hp) on x with color = automatic or not gear (am)
# Set the desity to 50 % transparent (alpha)
# Change the x axis to show values from 0 to 400
ggplot(mtcars,aes(hp,fill = factor(am))) +
  geom_density(alpha = .5) + 
  scale_x_continuous(limits = c(0,400)) +
  theme_bw()

# Load the ChickWeight dataset
data("ChickWeight")

# View it
View(ChickWeight)

# Make a simple linegraph using x = time, y = weight
ggplot(ChickWeight,aes(Time,weight)) +
  geom_line()

# What went wrong?

# Make a simple linegraph using x = time, y = weight, group = Chick
ggplot(ChickWeight,aes(Time,weight,group = Chick)) +
  geom_line()

# Give each chick a different colour on the line
ggplot(ChickWeight,aes(Time,weight,color = Chick)) +
  geom_line()

# Give each chick a different colour on the line, but hide the ugly legend
ggplot(ChickWeight,aes(Time,weight,color = Chick)) +
  geom_line() +
  theme(legend.position = "none")

# Do the same graph but now make the color = Diet and show legend
ggplot(ChickWeight,aes(Time,weight,group = Chick, color = Diet)) +
  geom_line()



# Tips:
# https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1
# http://sape.inf.usi.ch/quick-reference/ggplot2/colour
# http://r-graph-gallery.com/ggplot2-package.html
# google.com


##### 4) Data Wrangling with dplyr # Use Tidyverse notation on everething here ( %>% )

# Write the function below using tidyverser notation ( %>% )
sqrt(round(log(250),0))

250 %>% log() %>% round(digits = 0) %>% sqrt

# Load the ChickWeight dataset
data("ChickWeight")

# Use pipe notation to select the "weight" column
ChickWeight %>% select(weight)

# Select both "weight" and "Time" and assign the dataset to a new vector
Chick2 <- ChickWeight %>% select(weight,Time)

# Filter the ChickWeight dataset to only include Chicks with weight over 50
ChickWeight %>% filter(weight > 50)

# Filter the ChickWeight dataset to only include Chicks with weight 50 or more
ChickWeight %>% filter(weight >= 50)

# only include Chicks with weight over 50 and select weight and Time
ChickWeight %>% filter(weight > 50) %>% select(weight,Time)

# Filter the ChickWeight dataset to not include Chicks with Diet == 1 (hint: !)
ChickWeight %>% filter(!Diet == 1)

# Filter the ChickWeight dataset to only include diet that either 1 or 3 or 4 (hint: %in%)
ChickWeight %>% filter(Diet %in% c(1,3,4))


# Arrange the Chick dataset by weight, low to high
ChickWeight %>% arrange(weight)

# Arrange the Chick dataset by weight, high to low
ChickWeight %>% arrange(desc(weight))

# Get the mean weight from the entire column
ChickWeight %>% summarise(mean = mean(weight))

# Get the mean weight only Chicks in time 0
ChickWeight %>% filter(Time == 0) %>% summarise(mean = mean(weight))

# Get the mean weight grouped by time
ChickWeight %>% group_by(Time) %>% summarise(mean = mean(weight))

# Use the summarise function to get on dataframe of mean, median and standard deviation, grouped by time
ChickWeight %>% group_by(Time) %>% summarise(mean = mean(weight),
                                             median = median(weight),
                                             sd = sd(weight))

# Make a new column which contains the latest weight recorder for each Chick (hint: mutate() & last() )
ChickWeight %>% group_by(Chick) %>% mutate(last = last(weight))

ChickWeight <- ChickWeight %>% group_by(Chick) %>% mutate(last = last(weight))

# Make a new column with the mean weight of each Time
ChickWeight %>% group_by(Time) %>% mutate(mean = mean(weight))



############################################################
# Teacher examples: We will go through these together



# Make a function that inputs the number of simulation and t.test parameters 
# and outputs a histogram of p-values
p_value_dist <- function(sims = 100, samplesize = 40, difference = 0) {
  pvalues = 0
  for (i in 1:sims){
    x <- rnorm(samplesize/2, mean = 100,sd = 15)
    y <- rnorm(samplesize/2, mean = 100 + difference,sd = 15)
    z <- t.test(x,y)
    pvalues[i] <- z$p.value
  }
  hist(pvalues,breaks = 20)
  abline(v = 0.05,col = "red")
  mtext(paste(((sum(pvalues < .05)/length(pvalues))*100), "% significant with p < .05", sep = " "), side = 3, line=0)
}

p_value_dist(difference = 0)



# Tool for regression: ggeffects

# Say we wanted to show the interaction effect between Time & Diet from the chickweight dataset
# https://strengejacke.github.io/ggeffects/articles/randomeffects.html

library(ggeffects)

data("ChickWeight")

mod1 <- lm(weight ~ Time * Diet,data = ChickWeight)

margins <- ggpredict(mod1, terms = c("Time","Diet"))



plot(margins)


#or

ggplot(margins,aes(x,predicted,fill = group)) +
  geom_line(aes(color = group)) + 
  geom_ribbon(aes(ymin = conf.low,ymax = conf.high),alpha = .1) +
  geom_point(inherit.aes = F, data = ChickWeight,aes(Time,weight)) + 
  labs(x = "Time",y = "Predicted Value",subtitle = paste0("Adjusted R Squared = ",round(summary(mod1)$r.squared,digits = 2)))













# Spot the errors game!
numbers <- 1,4,6,7




ggplot(mtcars,mpg,hp) + 
  geom_point()




mtcars %>% select(hp) %>% filter(mpg >= 20)



4,25 + 3,56


ggplot(mtcars,aes(mpg,hp)) +
  geom_point(aes(color = "blue"))


isit5 <- function(x){
  return(x = 5)
}




mtcars %>% filter(mpg =< 20)



ggplot(mtcars,mpg,hp) +
  Geom_point()



for i in 1:5{
  print("hello")
}


ggplot(mtcars,mpg,hp) %>% 
  Geom_point()



