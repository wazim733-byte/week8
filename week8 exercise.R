# ==============================================================================
# WEEK 8: STUDENT DATASET ANALYSIS
# ==============================================================================

# --- Setup Sample Data (For demonstration purposes) ---
# Replace this with your actual dataset loading if necessary:
# student_data <- read.csv("path_to_your_file.csv")

student_data <- data.frame(
  student_name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank"),
  course_work_mark = c(75, 88, 62, 95, 45, 80),
  final_exam_mark = c(85, 78, 92, 60, 82, 110) # 110 included as a deliberate outlier
)

# ==============================================================================
# 1. Details of students whose final_exam_mark is greater than 80%
# ==============================================================================
high_scorers <- subset(student_data, final_exam_mark > 80)
print("--- 1. Students with Final Exam Mark > 80% ---")
print(high_scorers)

# ==============================================================================
# 2. Arrange the dataset in ascending order based on course_work_mark
# ==============================================================================
ordered_data <- student_data[order(student_data$course_work_mark), ]
print("--- 2. Dataset Ordered by Course Work Mark (Ascending) ---")
print(ordered_data)

# ==============================================================================
# 3. Display only the student name and final_exam_mark attributes
# ==============================================================================
selected_attributes <- student_data[, c("student_name", "final_exam_mark")]
print("--- 3. Student Names and Final Exam Marks Only ---")
print(selected_attributes)

# ==============================================================================
# 4. Specify the number of rows and columns in the dataset
# ==============================================================================
dimensions <- dim(student_data)
print("--- 4. Dataset Dimensions ---")
cat("Rows (Students):", dimensions[1], "\n")
cat("Columns (Attributes):", dimensions[2], "\n")

# ==============================================================================
# 5. Dataset Details Explanation and Execution
# ==============================================================================
# Explanation: To obtain comprehensive details about a dataset's structure, 
# data types, and basic descriptive statistics in R, we use str() and summary().
print("--- 5. Dataset Structure and Summary Details ---")
print("Structure of the dataset:")
str(student_data)
print("Statistical summary of the dataset:")
summary(student_data)

# ==============================================================================
# 6. Outlier Identification and Detection
# ==============================================================================
# Explanation: Outliers can be detected statistically using the Interquartile Range (IQR) 
# criterion (values outside 1.5 * IQR from the quartiles) or visually using a boxplot.

print("--- 6. Outlier Detection (Final Exam Mark Example) ---")

# Method A: Visual Detection using a Boxplot
# This will generate a plot highlighting any points outside the whiskers.
boxplot(student_data$final_exam_mark, 
        main="Boxplot of Final Exam Marks", 
        ylab="Marks", 
        col="lightblue")

# Method B: Statistical Detection using IQR
Q1 <- quantile(student_data$final_exam_mark, 0.25)
Q3 <- quantile(student_data$final_exam_mark, 0.75)
IQR_val <- IQR(student_data$final_exam_mark)

lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

outliers <- student_data[student_data$final_exam_mark < lower_bound | student_data$final_exam_mark > upper_bound, ]
print("Identified Outliers:")
print(outliers)