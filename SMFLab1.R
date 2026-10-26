#Part 01 : Fundamentals
#1.Printing and Comments
#Printing a number
print(200)

#printing a string
print("Dog")

#. Mathematical OPerations
print(1+2)
print(2*3)
print(4/2)
print(4^2)
print(4**2)
print(5%%2)
print(5%/%2)

#3. Relational Operations
print(20>10)
print(30<20)
print(50>=30)
print(10==10)
print(10!=10)

#4. Logical Opeations

print((20>10) && (30<=50))
print((20<10)||(20==20))
print(!(10==10))

#5. Variables
x= 10
y = 20

z = x+y

print(ls())

#remove variable x
rm(x)
print(ls())

#remove all variables
rm(list= ls())
print(ls())

#6 Mathematical Function
print(sum(10, 20)) 
print(abs(-20)) 
print(sqrt(25)) 
print(log(10))
print(exp(5)) 
print(round(3.245)) 
print(round(10.35, 1))

#7 Primitiva Data Types
num = 1.23 
int = 12L
char = "Cat"
log = TRUE 
comp = 23 + 3i

print(class(num)) 
print(class(int))
print(class(char))
print(class(log))
print(class(comp))

#8 Casting Data Types

x = 12 
y = as.character(x) 
print(y) 
print(class(y)) 

x = "12" 
y = as.numeric(x) 
print(y) 
print(class(y)) 

x = TRUE 
y = as.numeric(x) 
print(y) 
print(class(y))

#9 User Input
name = readline(prompt = "Enter your name: ") 
age = readline(prompt = "Enter your age: ") 
print(name)
print(age) 

age = as.numeric(age) 
print(age) 

#Part 02: Compund Data Structures
numeric_vector = c(12, 22, 23, 34, 35)
numeric_vector
character_vector = c("Dog", "Cat", "Rat") 
character_vector
mixed_vector = c(12, "Man", 23)
mixed_vector
sequence_vector = seq(10, 50, by = 5) 
sequence_vector
repeated_vector = rep("Dog", 5)
repeated_vector

#Indexing and Slicing
vector = c(23, 33, 34, 32, 45, 50, 65) 
element = vector[1] 
element 
slice = vector[1:3]
slice
boolean_masked = vector[vector > 40] 
boolean_masked

#Element-Wise Operations
vector1 = c(2, 3, 4) 
vector2 = c(3, 4, 5) 
sum_vector = vector1 + vector2 
sum_vector 
comparison = vector1 > 2 
comparison

#Summary Functions 
vector = c(2, 3, 4, 5) 
print(sum(vector)) 
print(mean(vector)) 
print(sd(vector)) 
print(range(vector)) 

#Other Vector Functions
vector = c(20, 10, 20, 30)
appended_vector = append(vector, 40) 
appended_vector 
sorted_vector = sort(vector) 
sorted_vector 
unique_values = unique(vector) 
unique_values 
sampled_values = sample(vector, 2) 
sampled_values

#Matrices
#1
matrix1 = matrix(1:6, nrow = 3, ncol = 2) 
matrix1
matrix2 = matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE) 
matrix2 

print(dim(matrix1)) 
print(summary(matrix1)) 

#Merging Matrices
matrix1 = matrix(1:4, nrow = 2)
matrix2 = matrix(5:8, nrow = 2) 
horizontal_merge = cbind(matrix1, matrix2) 
vertical_merge = rbind(matrix1, matrix2) 
matrix1
matrix2
horizontal_merge
vertical_merge

#Matrix Indexing and Operations 
matrix1 = matrix(1:9, nrow = 3) 
print(matrix1[1, ]) 
matrix1
print(matrix1[, 2])
print(matrix1[1:2, 2:3]) 

matrix1 = matrix(c(1, 2, 3, 4), nrow = 2) 
matrix2 = matrix(c(5, 6, 7, 8), nrow = 2) 
matrix_addition = matrix1 + matrix2
matrix_addition
matrix_subtraction = matrix1 - matrix2 
matrix_subtraction
matrix_multiplication = matrix1 * matrix2
matrix_multiplication
matrix_dot_product = matrix1 %*% matrix2
matrix_dot_product
matrix_transpose = t(matrix1)
matrix_transpose
print(matrix_addition)
print(matrix_transpose) 


#Advanced Matrix Operations 
matrix3 = matrix(c(4, 7, 2, 6), nrow = 2) 
det_value = det(matrix3) 
inverse_matrix = solve(matrix3) 
print(det_value) 
print(inverse_matrix) 

diag_elements = diag(matrix3) 
print(diag_elements) 

#Factors
#Unirdered Factors
gender = factor(c("Male", "Female", "Male"))
print(gender) 
#Ordered Factors
levels = factor(c("Low", "Medium", "High"), levels = c("Low", "Medium", "High"), ordered = TRUE) 
print(levels) 

#4. Lists
my_list = list( 
  vector = c(1, 2, 3), 
  matrix = matrix(1:4, nrow = 2), 
  char = "Hello" 
) 

print(my_list)

#5
name = c("Kane", "Jane", "David") 
age = c(23, 33, 34)
marks = c(89, 78, 88) 
df = data.frame(name, age, marks)
print(df) 
# Accessing columns 
print(df["name"]) 
print(df$name) 

# Indexing and slicing 
print(df[1, 1]) 
print(df[1:2, ])

# Modifying data frames 
df$grade = ifelse(df$marks > 80, "A", "B") 
print(df) 

# Boolean masking 
filtered_df = df[df$marks > 80, ] 
print(filtered_df)

# Data frame functions 
print(head(df)) 
print(tail(df)) 
print(dim(df)) 
print(nrow(df)) 
print(ncol(df)) 
print(colnames(df)) 
print(rownames(df)) 
print(rowSums(df[, c("age", "marks")])) 
print(colSums(df[, c("age", "marks")])) 
print(rowMeans(df[, c("age", "marks")])) 
print(colMeans(df[, c("age", "marks")])) 
print(summary(df)) 
print(str(df)) 
# Changing to factors 
df$name = factor(df$name) 
print(str(df)) 
# Reading CSV files 
data = read.csv("C:/Users/Anusara/Downloads/SMLab1/data.csv") 
print(head(data)) 

# Adding new columns 
data$new_column = data$Marks * 2 
print(data)

data$Marks[data$Marks == 999] <- 9
print(data)

# Renaming columns 
colnames(data)[colnames(data) == "Marks"] = "Scores" 
print(colnames(data)) 

# Applying a function 
data$scaled_marks = scale(data$Scores) 
print(data) 

# Apply functions 
data$average_score = apply(data[, c("new_column", "Scores")], 1, mean) 
print(data) 

column_sums = sapply(data[, c("new_column", "Scores")], sum) 
print(column_sums) 

list_structure = lapply(data[, c("new_column", "Scores")], summary) 
print(list_structure) 

#Part 03: Flow Control Structures 

number = 5 
if(number > 0) { 
  print("Positive") 
} 

#2)
year = 2024 
if((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) { 
  print("Leap Year") 
} 

#3)
number = 25 
if(number >= 10 && number <= 50) { 
  print("Number is in the range") 
} 

#2. If-Else Statements 
#1
number = 8 
if(number %% 2 == 0) { 
  print("Even") 
} else { 
  print("Odd") 
} 
#2
a = 15 
b = 20 
if(a > b) { 
  print("a is larger") 
} else { 
  print("b is larger") 
} 

#3
username = "user" 
password = "pass123" 

input_user = readline(prompt = "Enter username: ") 
input_pass = readline(prompt = "Enter password: ") 

if(input_user == username && input_pass == password) { 
  print("Access Granted") 
} else { 
  print("Access Denied") 
} 

#3. If-Elseif-Else Statements 
#1
marks = 72 
if(marks >= 80) { 
  grade = "A" 
} else if(marks >= 65) { 
  grade = "B" 
} else if(marks >= 50) { 
  grade = "C" 
} else { 
  grade = "F" 
} 
print(grade)

#2
number = -7 
if(number > 0) { 
  print("Positive") 
} else if(number < 0) { 
  print("Negative") 
} else { 
  print("Zero") 
} 

#3
amount = 350 
if(amount >= 500) { 
  discount = 20 
} else if(amount >= 200) { 
  discount = 10 
} else { 
  discount = 5 
} 
print(paste("Discount:", discount, "%")) 

#4
#1
for(i in 1:10) { 
  print(i) 
} 

#2
number = 5 
factorial = 1 
for(i in 1:number) { 
  factorial = factorial * i 
} 
print(factorial) 

#3
numbers = c(2, 4, 6, 8, 10)
for(n in numbers) { 
  print(n^2) 
} 

#5
number = 1 
while(number <= 10) { 
  print(number * 3) 
  number = number + 1 
} 

number = -1 
while(number <= 0) { 
  number = as.numeric(readline(prompt = "Enter a positive number: ")) 
} 
print("Thank you!") 

#3
pin = 1234 
entered_pin = 0 
while(entered_pin != pin) { 
  entered_pin = as.numeric(readline(prompt = "Enter your PIN: ")) 
  if(entered_pin != pin) { 
    print("Incorrect PIN. Try again.") 
  } 
} 
print("Access Granted!") 

#Part 04:  Functions and Libraries in R 

#2
# Function definition 
hello_function = function() { 
  print("Hello, R!") 
} 

# Function call 
hello_function() 

#2
# Function definition 
multiply_numbers = function(a, b) { 
  return(a * b) 
} 
# Function call 
result = multiply_numbers(4, 5) 
print(result) 

#3
# Function definition 
calculate_square = function(x) { 
  return((x^2) + 10) 
} 

# Function call 
square_result = calculate_square(6) 
print(square_result)

#3
# Anonymous function 
print((function(x) x^3)(3)) 

#5
# Numeric vector 
values = c(5, 10, 15, 20) 

# Using sapply with an anonymous function 
result = sapply(values, function(x) x * 2) 
print(result)

#6
# Data frame 
data_frame = data.frame(A = c(2, 4, 6), B = c(3, 5, 7)) 

# Using apply with an anonymous function 
row_sums = apply(data_frame, 1, function(x) sum(x^2)) 
print(row_sums) 

#7
# Area function 
calculate_area = function(length, width) { 
  return(length * width) 
} 

# Perimeter function 
calculate_perimeter = function(length, width) { 
  area = calculate_area(length, width) 
  return(2 * (length + width)) 
} 

# Function call 
perimeter_result = calculate_perimeter(5, 3) 
print(perimeter_result) 

