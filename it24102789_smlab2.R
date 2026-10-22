#Lab Sheet 02 

#1. One-Sample t-Test 

# Create vector to hold plant heights 
my_data = c(14, 14, 16, 13, 12, 17, 15, 14, 15, 13, 15, 14) 

# Perform one-sample t-test 
t.test(my_data, mu = 15) 

#2. Two-Sample t-Test 

# Create vectors for plant heights from two groups 
group1 = c(8, 8, 9, 9, 9, 11, 12, 13, 13, 14, 15, 19) 
group2 = c(11, 12, 13, 13, 14, 14, 14, 15, 16, 18, 18, 19) 

# Perform two-sample t-test 
t.test(group1, group2, var.equal = TRUE) 

#3. One-Sample z-Test 

# Load BSDA library 
install.packages("BSDA")
library(BSDA) 

# IQ levels for 20 patients 
data = c(88, 92, 94, 94, 96, 97, 97, 97, 99, 99, 105, 109, 109, 109, 110, 112,112, 113, 114, 115) 

# Perform one-sample z-test 
z.test(data, mu = 100, sigma.x = 15) 

#4. Two-Sample z-Test 

# IQ levels for individuals in two cities 
cityA = c(82, 84, 85, 89, 91, 91, 92, 94, 99, 99, 105, 109, 109, 109, 110, 112,112, 113, 114, 114)
cityB = c(90, 91, 91, 91, 95, 95, 99, 99, 108, 109, 109, 114, 115, 116, 117, 117,128, 129, 130, 133)

# Perform two-sample z-test 
z.test(x = cityA, y = cityB, mu = 0, sigma.x = 15, sigma.y = 15) 

#5. Variance Ratio Test (F-Test) 

# Plant heights from two groups 
group1 = c(5, 6, 6, 8, 10, 12, 12, 13, 14, 15, 15, 17, 18, 18, 19) 
group2 = c(9, 9, 10, 12, 12, 13, 14, 16, 16, 19, 22, 24, 26, 29, 29) 

# Perform variance ratio test 
var.test(group1, group2) 

#6. One-Proportion z-Test 

# Proportion of COVID-positive patients 
prop.test(x = 60, n = 100, p = 0.5, alternative = "greater") 

#7. Two-Proportions z-Test 

# Proportions of COVID-positive patients in two groups 
prop.test(x = c(60, 80), n = c(100, 200), alternative = "greater") 

#8. Analysis of Variance (ANOVA) 

# Load iris dataset 
data("iris") 
colnames(iris) = c("SL", "SW", "PL", "PW", "Specs") 
st_data = stack(iris[, 1:4]) 

# Perform ANOVA 
ano_tab = aov(values ~ ind, data = st_data) 
summary(ano_tab) 

#9. Levene’s Test 

# Load car library 
install.packages("car")
library(car) 

# Perform Levene's test 
leveneTest(values ~ ind, data = st_data) 

#10. Post-Hoc Analysis - Fisher’s LSD 

# Create data frame 
df = data.frame(technique = rep(c("tech1", "tech2", "tech3"), each = 10), score = c(72, 73, 73, 77, 82, 82, 83, 84, 85, 89,81, 82, 83, 83, 83, 84, 87, 90, 92, 93,77, 78, 79, 88, 89, 90, 91, 95, 95, 98)) 

# Fit one-way ANOVA 
model = aov(score ~ technique, data = df) 
summary(model) 

# Fisher's LSD 
install.packages("agricolae")
library(agricolae) 
results = LSD.test(model, "technique") 
print(results)

#11. Testing Normality 

# Generate random data from normal distribution 
data = rnorm(100) 
shapiro.test(data) 
hist(data, col = "steelblue") 

# Check normality for iris dataset 
#shapiro.test(iris$Sepal.Length) 

str(iris)
class(iris$Sepal.Length)

shapiro.test(iris$SL)

#hist(iris$Sepal.Length) 
hist(iris$SL) 

#12. Correlation Analysis 
# Data frame 
df = data.frame(hours = c(1, 1, 3, 2, 4, 3, 5, 6),prac_exams = c(4, 3, 3, 2, 3, 2, 1, 4),score = c(69, 74, 74, 70, 89, 85, 99, 90))

# Pearson correlation 
cor(df$hours, df$score) 
cor(df) 

# Correlation test 
x = c(2, 3, 3, 5, 6, 9, 14, 15, 19, 21, 22, 23) 
y = c(23, 24, 24, 23, 17, 28, 38, 34, 35, 39, 41, 43) 

# Scatterplot 
plot(x, y, pch = 16, col = "red") 
cor.test(x, y) 
