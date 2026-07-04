install.packages("dplyr")
library(dplyr)

library(dplyr)
library(readr)

student_data<- read.csv("C:/Users/farahida/OneDrive/Documents/student_data.csv")
Student_fail<- Student_fail<- student_data[student_data$final_exam_mark< 40,]
View(Student_fail)

Student_fail<- student_data %>% filter(final_exam_mark< 40)
View(Student_fail)

library(dplyr)
library(readr)
student_data<- read.csv("C:/Users/farahida/OneDrive/Documents/student_data.csv")
mydata<- arrange(filter(student_data,final_exam_mark>40%),final_exam_mark)
View(mydata)

mydata1<- student_data %>% filter(final_exam_mark > 40) %>%
  arrange(desc(final_exam_mark))
View(mydata1)

library(dplyr)
library(readr)
student_data<- read.csv(" C:/Users/OneDrive/Documents/student_data.csv ")
mydata2 <- student_data%>% select(student_id,coursework_mark, final_exam_mark)
View(mydata2)

mydata3<- student_data[ , c(‘student_id’, ‘coursework_mark’,
                             ‘final_exam_mark’ )]
View(mydata3)

glimpse(mydata2)
# print(mydata2)

library(dplyr)
library(readr)
student_data <- read.csv(" C:/Users/hamza/OneDrive/Documents/student_data.csv ")
mydata4 = student_data%>% mutate(Total_Mark=(coursework_mark +
                                               final_exam_mark/200*100))
View(mydata4)


#Desriptive analytics___________________________
data(iris)
head(iris)
tail(iris)
str(iris)

min(iris$Petal.Width)
max(iris$Petal.Width)
range(iris$Sepal.Length)
sd(iris$Sepal.Length)
summary(iris)

#quantile
A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)


#counting column and row
nrow(iris)
ncol(iris)
sum(is.na(iris$Sepal.Length))
hist(iris$Sepal.Length,
     main = "Histogram of Sepal Lenght",
     xlab = "Sepal Length",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")
first_q<-quantile(data,0.25) #this is 26
third_q<-quantile(data,0.75) #this is 31.75
inter_q<-quantile(data,0.5)

#Quartile
iqr<-IQR(data)
#lower extreme
lower_extreme<-first_q - 1.5 * iqr
upper_extreme<-third_q + 1.5 * iqr

#how to deal with outlier
# remove the outlier
data_new<-data
data_new <- data_new[!data_new<lower_extreme]
data_new <- data_new[!data_new>upper_extreme]
data_new

#replace the outlier
data_new <- data
avg <- round(mean(data_new)) #for the purpose of example we round up value
data_new[data_new<lower_extreme] <- avg
data_new[data_new>upper_extreme] <- avg
data_new

#replace with upper and lower value
data_new <- data
data_new[data_new<lower_extreme]
data_new[data_new>upper_extreme]
data_new