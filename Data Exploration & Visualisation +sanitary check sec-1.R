library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  
library(corrplot)

##### Import & Clean
Employee_Attrition<- read.csv("D:/data_set/Employee_Attrition.csv")
#View(Employee_Attrition)

# Attrition Plot
attrition_plot <- ggplot(Employee_Attrition, aes(x = factor(Attrition))) + geom_bar() +
  labs(title = "Attrition Bar Plot",
       x = "Attrition",
       y = "Count")
print(attrition_plot)

# Attrition By Department
# Create the bar plot
attrition_plot <- ggplot(attrition_percentage, aes(x = Department, y = AttritionRate, fill = Department)) +
  geom_bar(stat = "identity") +
  labs(title = "% Wise Attrition by Department", x = "Department", y = "% Attrition Rate") +
  theme_minimal() +  # Optional: Use a minimal theme
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability

# Show the plot
print(attrition_plot)

# Avg Salary by JobRole
average_salary_by_role<-ggplot(Employee_Attrition, aes(x = Jobrole, y = MonthlyIncome,fill=Jobrole)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Monthly Income by Job Role",
       x = "Job Role",
       y = "Average Monthly Income") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(average_salary_by_role)


# Calculate average salary by job role in Ascending order.
average_salary_by_role <- Employee_Attrition %>%
  group_by(Jobrole) %>%
  summarize(AverageMonthlyIncome = mean(MonthlyIncome)) %>%
  arrange(AverageMonthlyIncome)

# Reorder Jobrole based on average monthly income
average_salary_by_role$Jobrole <- factor(average_salary_by_role$Jobrole, levels = average_salary_by_role$Jobrole)

# Create the bar plot
plot <- ggplot(average_salary_by_role, aes(x = Jobrole, y = AverageMonthlyIncome, fill = Jobrole)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Monthly Income by Job Role",
       x = "Job Role",
       y = "Average Monthly Income") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(plot)

##### Numerical Plots
### Histogram - Age
# Create a histogram for Age
age_histogram <- ggplot(Employee_Attrition, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "black") +
  labs(title = "Age Distribution",
       x = "Age",
       y = "Frequency") +
  theme_minimal()

print(age_histogram)

### Histogram - MonthlyIncome
monthly_income_histogram <- ggplot(Employee_Attrition, aes(x = MonthlyIncome)) +
  geom_histogram(binwidth = 500, fill = "steelblue", color = "black") +
  labs(title = "Monthly Income Distribution",
       x = "Monthly Income",
       y = "Frequency") +
  theme_minimal()

print(monthly_income_histogram)

### Box Plot - Age
age_box_plot <- ggplot(Employee_Attrition, aes(x = "", y = Age)) +
  geom_boxplot(fill = "steelblue", color = "black") +
  labs(title = "Age Distribution",
       x = "",
       y = "Age") +
  theme_minimal()

print(age_box_plot)

### Box Plot - MonthlyIncome
monthly_income_box_plot <- ggplot(Employee_Attrition, aes(x = "", y = MonthlyIncome)) +
  geom_boxplot(fill = "steelblue", color = "black") +
  labs(title = "Monthly Income Distribution",
       x = "",
       y = "Monthly Income") +
  theme_minimal()

print(monthly_income_box_plot)

### Correlation Heat Map

# 1 Select numerical features for correlation analysis
numerical_features <- data[, c("Age","DailyRate","MonthlyRate")]

# 2 Calculate the correlation matrix
correlation_matrix <- cor(numerical_features)

# 3 Create a correlation heatmap using corrplot
corrplot(correlation_matrix, method = "color", tl.cex = 0.10)



# Another code to do it.

#Calculate the correlation matrix:
correlation_matrix <- cor(Employee_Attrition[, c("Age","DailyRate", "MonthlyIncome")])
#Create a correlation heatmap using corrplot
corrplot(correlation_matrix, method = "color", type = "upper", tl.cex = 0.7)









