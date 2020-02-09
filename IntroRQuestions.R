


####### Intro to R Course by Nordmo #########

# No answers edition

##################### 1) Basic Functionality
# hints:  https://rstudio.com/wp-content/uploads/2016/05/base-r.pdf

# Add 1 and 4


# Multiply 4 and 12


#Divide two numbers


#Make a string/character vector called hello with the string "hello world"


#Print the hello vector


# Take the log of 100


# Assign a vector with one number in it


# Display the vector


# Remove vector


# Make a vector with three numbers[hint... concatenate]:


# Write code that displays this vector in the Viewer 


# Take the log of each number in the vector


# Find the mean of this vector


# Find the standard deviation of this vector


# Make av vector with five values and one NA value


# Take the mean and sd from this vector


# Delete both vectors


# Install the package "tidyverse"
install.packages("tidyverse")


# Load the package tidyverse
library(tidyverse)

############################ 2) Functions and basic datamanipulation

# Make a function thats adds two numbers and call it something
# template
something <- function(){

}


# Add two numbers using your number adder


# Make the same function but put in some default values 


# Make a function that inputs centimeter measurements and outputs inches
# x cm / 2.54 = inches



# Repeat the function but add a rounding feature, to one number after desimal
# https://www.dummies.com/programming/r/how-to-round-off-numbers-in-r/


# Generate 100 random values, with a mean of 0 and an sd of 1, and assign it to a vector
# Values should be normally distributed
# Hint: Base Spreadsheet or http://www.cookbook-r.com/Numbers/Generating_random_numbers/


# Do it again and assign it to another vector


# Do a t.test using the two vectors


# Assign the t.test to an object and then locate the p.value or confidence interval (hint: https://bookdown.org/ndphillips/YaRrr/t-test-t-test.html)


# Do a linear regression with x predicting y and assign it to an object (hint: https://www.datacamp.com/community/tutorials/linear-regression-R)


# Use the summary() function to assess the model


# Locate the predicted/fitted values from the model


# Locate the coeffictients from the model


#Load the "iris" dataset
data(iris)

# View iris dataset
View(iris)

# Look at just the top part of the dataset
head(iris)

# Look at just the bottom of the dataset
tail(iris)

#Look at just the first column in the data (See base R spreadsheet  https://rstudio.com/wp-content/uploads/2016/05/base-r.pdf)


#Look at just the first row in the data


# Look at the first row in the first column (cell)


# Assign a new value, 2, to this cell


# Look at it again to check that it was changed


# Use the $ sign to look at the first column


# Add all the numbers in the first column (Sepal.Length) to the numbers in the second column (Sepal.Width) 
# (hint: https://campus.datacamp.com/courses/introduction-to-r-for-finance/data-frames-3?ex=10)



# Make a vector with four numbers in it and make sure that the vector is integer


# Convert these values into "numeric"
# hint: as.numeric()


# Convert these values into "character"


# Convert these values back into integer


# Remove everything using: rm(list = ls())

##### 3) Data visualization with ggplot2

# Load ggplot either using library(tidyverse) or library(ggplot2)
library(tidyverse)

# Load "iris" dataset 
data(iris)


# View the dataset
View(iris)



# Make a simple point plot of Petal.Length on x and Petal.Width on y
# hint: http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html


# Change X axis label to "Width" and "Length"


# Change the Y scale to 0 - 4


# Try adding a different themes and find something you like



# Add a colour on each dot to its respective Species



# Change "ticks"/"breaks" on x axis to display: 1,2,3,4,5,6,7


# Change Y axis to display: 0,1,2,3


# Try to remove the legend completely


# Add a linear regression model


# Make the linear regression model fit through the entire data, not subdivided on Species


# Same as before but make the regression line "slateblue" and remove standard error markings


# Same as before but make a black loess regression across all observations



# Same as before but create a cubic polynomial
#hint https://stackoverflow.com/questions/11949331/adding-a-3rd-order-polynomial-and-its-equation-to-a-ggplot-in-r



# Load the mtcars dataset
data(mtcars)

# Create a violinplot with x = as.factor(cyl),y = displ


# Add the rawdata as points


# http://sape.inf.usi.ch/quick-reference/ggplot2/colour
# Make the violin edges dodgerblue1 and violin fill as tomato1, theme(classic), dots as magenta1
# Make the violins transparent 50 %


# Make the colors depend on aes cyl

# Make the colors depend on aes as.factor(cyl)

# Replace the violins with traditional boxplots


# Make a regular point plot with x = disp, y = mpg, color = factor(cyl), but 
# facet_wrap the plot into am (automatic gear or not)

# Do the same but make the size of each point depend on horsepower (hp)

# Make a density plot with horsepower (hp) on x with color = automatic or not gear (am)
# Set the desity to 50 % transparent (alpha)
# Change the x axis to show values from 0 to 400





# Load the ChickWeight dataset
data("ChickWeight")

# View it
View(ChickWeight)

# Make a simple linegraph using x = time, y = weight


# What went wrong?

# Make a simple linegraph using x = time, y = weight, group = Chick


# Give each chick a different colour on the line


# Give each chick a different colour on the line, but hide the ugly legend


# Do the same graph but now make the color = Diet and show legend



# Tips:
# https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html#1
# http://sape.inf.usi.ch/quick-reference/ggplot2/colour
# http://r-graph-gallery.com/ggplot2-package.html
# google.com


##### 4) Data Wrangling with dplyr # Use Tidyverse notation on everething here ( %>% )
# hint: https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

# Write the function below using tidyverser notation ( %>% )
sqrt(round(log(250),0))

250 %>% log() %>% round() %>% sqrt()

# Load the ChickWeight dataset
data("ChickWeight")

# Use pipe notation to select the "weight" column (hint: https://afit-r.github.io/dplyr)


# Select both "weight" and "Time" and assign the dataset to a new vector


# Filter the ChickWeight dataset to only include Chicks with weight over 50


# Filter the ChickWeight dataset to only include Chicks with weight 50 or more


# only include Chicks with weight over 50 and select weight and Time


# Filter the ChickWeight dataset to not include Chicks with Diet == 1 (hint: !)


# Arrange the Chick dataset by weight, low to high


# Arrange the Chick dataset by weight, high to low


# Get the mean weight from the entire column (hint: https://afit-r.github.io/dplyr)


# Get the mean weight only Chicks in time 0


# Get the mean weight grouped by time


# Use the summarise function to get on dataframe of mean, median and standard deviation, grouped by time



# Make a new column which contains the latest weight recorder for each Chick (hint: mutate() & last() )


# Make a new column with the mean weight of each Time




############################################################
# Teacher examples

iris %>% # the names of the new data frame and the data frame to be summarised
  group_by(Species) %>%   # the grouping variable
  summarise(mean_PL = mean(Petal.Length),  # calculates the mean of each group
            sd_PL = sd(Petal.Length), # calculates the standard deviation of each group
            n_PL = n(),  # calculates the sample size per group
            SE_PL = sd(Petal.Length)/sqrt(n())) %>%  # calculates the standard error of each group
  ggplot(., aes(Species, mean_PL)) + 
  geom_col() +  
  geom_errorbar(aes(ymin = mean_PL - sd_PL, ymax = mean_PL + sd_PL), width=0.2) + 
  labs(y="Petal length (cm) ± s.d.", x = "Species") + theme_classic()

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

