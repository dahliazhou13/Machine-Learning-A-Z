# Decision Tree Regression
# Polynomial Regression
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

#install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit,SplitRatio = 0.8)#true if chosen to be training
# training_set = subset(dataset,split == TRUE)
# test_set = subset(dataset,split == FALSE)

# Fitting the Regression model to the dataset
library(rpart)
regressor = rpart(formula = Salary ~ ., 
                  data = dataset,
                  control = rpart.control(minsplit =1))


# Predicting a new result 
y_pred = predict(regressor,newdata = data.frame(Level=6.5) )

# Visualizing the Regression Model esults
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor,newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Regression Model esults (Better Resolution)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor,newdata = data.frame(Level=x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')