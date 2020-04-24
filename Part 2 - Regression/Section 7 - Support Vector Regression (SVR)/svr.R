# Polynomial Regression
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

#install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit,SplitRatio = 0.8)#true if chosen to be training
# training_set = subset(dataset,split == TRUE)
# test_set = subset(dataset,split == FALSE)

# Fitting the SVR to the dataset
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~.,
                data = dataset,
                type = 'eps-regression')

# Predicting a new result 
y_pred = predict(regressor,data.frame(Level=6.5) )

# Visualizing the SVR esults
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor,newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Regression Model esults (Better Resolution)
x_grid = seq(min(dataset$Level),max(dataset$Level,0.1))
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor,newdata = data.frame(Level=x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')