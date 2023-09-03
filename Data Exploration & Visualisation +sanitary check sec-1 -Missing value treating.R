library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  


##### Import & Clean
job_change<- read.csv("D:/data_set/job_change.csv")
#View(job_change)

##### Check Summary Statistics
summary(job_change)

##### Check Missing Values
sum(is.na(job_change))

# Check for missing values in each column
missing_counts <- colSums(is.na(job_change))

# Display the count of missing values for each column
print(missing_counts)

# Categorical 
categorical_columns <- c("gender", "relevent_experience", "enrolled_university",
                         "education_level", "major_discipline", "company_size",
                         "company_type", "last_new_job")

missing_values_categorical <- sapply(job_change[categorical_columns], function(col) sum(col == ""))
print(missing_values_categorical)


##### Numerical
# Treat - training_hours
# Calculate the median of the "training_hours" column
median_training_hours <- median(job_change$training_hours, na.rm = TRUE)

# Replace missing values in "training_hours" with the median
job_change$training_hours[is.na(job_change$training_hours)] <- median_training_hours

# Check Treating - training_hours
sum(is.na(job_change$training_hours))

# Check
# Check for missing values in each column
missing_counts <- colSums(is.na(job_change))

# Display the count of missing values for each column
print(missing_counts)

#------------------------------------------

# Treat - city_development_index
#Calculate the median of the "training_hours" column
median_city_development_index <- median(job_change$city_development_index, na.rm = TRUE)

# Replace missing values in "training_hours" with the median
job_change$city_development_index[is.na(job_change$city_development_index)] <- median_city_development_index

# Check Treating - city_development_index
sum(is.na(job_change$city_development_index))
summary(job_change$city_development_index)

# Check
# Check for missing values in each column
missing_counts <- colSums(is.na(job_change))

# Display the count of missing values for each column
print(missing_counts)
#----------------------------------------------------------

##### Categorical

# Treat - major_discipline
#Replace missing value in "Major_discipline" with "Missing"
job_change$major_discipline[job_change$major_discipline == ""] <- "Missing"

# Check
sum(is.na(job_change$major_discipline))
summary(job_change$major_discipline)


# Bar Plot to Check


# Treat - education_level
