#Exercise 1: Ridge Regression 

#Load Libraries 
library(glmnet) 
library(caret) 
library(car) 

mtcars_expanded=read.csv("C:/Users/Anusara/Downloads/Cars Data.csv") 
print(mtcars_expanded)

# Split into train/test 
set.seed(42) 
train_idx <- createDataPartition(mtcars_expanded$mpg, p = 0.7, list = FALSE) 
train <- mtcars_expanded[train_idx, ] 
test  <- mtcars_expanded[-train_idx, ] 
mlr_fit <- lm(mpg ~ ., data = train) 
summary(mlr_fit) 

# Train performance 
train_pred_mlr <- predict(mlr_fit, train) 
train_rmse_mlr <- sqrt(mean((train$mpg - train_pred_mlr)^2)) 

# Test performance 
test_pred_mlr <- predict(mlr_fit, test) 
test_rmse_mlr <- sqrt(mean((test$mpg - test_pred_mlr)^2)) 
cat("MLR Train RMSE:", train_rmse_mlr, "\n") 
cat("MLR Test RMSE:", test_rmse_mlr, "\n") 

#Ridge 
x_train <- as.matrix(train[, setdiff(names(train), "mpg")])
y_train <- train$mpg 
x_test  <- as.matrix(test[, setdiff(names(test), "mpg")])
y_test  <- test$mpg 

#Cross-validate to find best lambda
cv_ridge <- cv.glmnet(x_train, y_train, alpha = 0) 
best_lambda <- cv_ridge$lambda.min 
ridge_fit <- glmnet(x_train, y_train, alpha = 0, lambda = best_lambda)

# Train performance 
train_pred_ridge <- predict(ridge_fit, x_train) 
train_rmse_ridge <- sqrt(mean((y_train - train_pred_ridge)^2)) 

# Test performance 
test_pred_ridge <- predict(ridge_fit, x_test) 
test_rmse_ridge <- sqrt(mean((y_test - test_pred_ridge)^2)) 
cat("Ridge Train RMSE:", train_rmse_ridge, "\n")
cat("Ridge Test RMSE:", test_rmse_ridge, "\n") 

#Exercise 2: Lasso Regression 
#fit lasso 
x_train <- as.matrix(train[, setdiff(names(train), "mpg")]) 
y_train <- train$mpg
x_test  <- as.matrix(test[, setdiff(names(test), "mpg")]) 
y_test  <- test$mpg

# alpha = 1 => Lasso (as opposed to alpha = 0 for ridge) 
lasso_fit <- glmnet(x_train, y_train, alpha = 1) 
plot(lasso_fit, xvar = "lambda", label = TRUE)
cv_lasso <- cv.glmnet(x_train, y_train, alpha = 1) 
plot(cv_lasso) 
best_lambda_lasso <- cv_lasso$lambda.min 
cat("Optimal lambda (lasso):", best_lambda_lasso, "\n") 
lasso_final <- glmnet(x_train, y_train, alpha = 1, lambda = best_lambda_lasso) 

#Evaluate Lasso 
train_pred_lasso <- predict(lasso_final, x_train) 
test_pred_lasso  <- predict(lasso_final, x_test) 
train_rmse_lasso <- sqrt(mean((y_train - train_pred_lasso)^2)) 
test_rmse_lasso  <- sqrt(mean((y_test - test_pred_lasso)^2)) 
cat("Lasso Train RMSE:", train_rmse_lasso, "\n") 
cat("Lasso Test RMSE:", test_rmse_lasso, "\n") 

# Extract lasso coefficients at optimal lambda (feature selection) 
lasso_coefs <- coef(cv_lasso, s = "lambda.min") 
lasso_coefs 

# Extract lasso coefficients at optimal lambda 
lasso_coefs <- coef(cv_lasso, s = "lambda.min") 
lasso_coefs

# Convert to a clean data frame 
coef_df <- data.frame( 
  Variable = rownames(lasso_coefs), 
  Coefficient = as.vector(lasso_coefs) 
)

# Features that were KEPT (non-zero coefficient) 
selected_features <- coef_df[coef_df$Coefficient != 0 & coef_df$Variable != "(Intercept)", ] 
print(selected_features) 

# Features that were DROPPED (coefficient shrunk to exactly zero) 
dropped_features <- coef_df[coef_df$Coefficient == 0, ] 
print(dropped_features) 
final_feature_list <- selected_features$Variable 
print(final_feature_list) 
cat("Final model uses", length(final_feature_list), "out of", ncol(x_train), "original predictors\n") 
