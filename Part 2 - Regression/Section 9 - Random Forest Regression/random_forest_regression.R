# Random Forest Regression
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

#install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit,SplitRatio = 0.8)#true if chosen to be training
# training_set = subset(dataset,split == TRUE)
# test_set = subset(dataset,split == FALSE)

# Fitting the Regression model to the dataset
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], 
                         y = dataset$Salary,
                         ntree = 500)

# Predicting a new result 
y_pred = predict(regressor,newdata = data.frame(Level=6.5) )


library(ggplot2)

# Visualizing the Regression Model esults (Better Resolution)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor,newdata = data.frame(Level=x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')