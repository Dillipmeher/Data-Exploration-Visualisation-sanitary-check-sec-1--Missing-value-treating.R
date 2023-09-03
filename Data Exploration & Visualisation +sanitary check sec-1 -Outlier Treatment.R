library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  
library(corrplot)

##### Import & Clean
Employee_Attrition_Outlier_Treatment<- read.csv("D:/data_set/Employee_Attrition.csv")
#View(Employee_Attrition_Outlier_Treatment)

##### Outlier
### Check 
# Create a box plot after treating outliers


### Box Plot - MonthlyIncome
monthly_income_box_plot <- ggplot(Employee_Attrition_Outlier_Treatment, aes(x = "", y = MonthlyIncome)) +
  geom_boxplot(fill = "steelblue", color = "black") +
  labs(title = "Monthly Income Distribution",
       x = "",
       y = "Monthly Income") +
  theme_minimal()

print(monthly_income_box_plot)

### Treat
# Create a box plot after treating the Outlier

#Calculate the lower and upper bounds using the IQR method:
Q1 <- quantile(data$MonthlyIncome, 0.25)
Q3 <- quantile(data$MonthlyIncome, 0.75)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

#Remove outliers from the "MonthlyIncome" column:
data_filtered <- data %>% filter(MonthlyIncome >= lower_bound & MonthlyIncome <= upper_bound)

write.csv(data_filtered, "Employee_Attrition_Cleaned.csv", row.names = FALSE)

# Create a box plot after treating Outlier
boxplot <- ggplot(data_filtered, aes(x = 1, y = MonthlyIncome)) +
  geom_boxplot(fill = "Green", color = "black") +
  labs(x = "", y = "Monthly Income") +
  theme_minimal()

# Display the box plot
print(boxplot)




