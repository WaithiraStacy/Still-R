# HeartDiseaseAnalysis.R

# Load necessary libraries
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(summarytools)

# Load the data
data <- read_csv('heart_disease_data.csv')

# Inspect the data
print(dfSummary(data))

# Data Cleaning (example: handling missing values)
data <- data %>% drop_na()

# Exploratory Data Analysis (EDA)
# Age distribution of patients
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Age Distribution of Patients", x = "Age", y = "Frequency")

# Gender distribution of patients
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Gender Distribution of Patients", x = "Gender", y = "Count")

# Chest pain type distribution
ggplot(data, aes(x = ChestPainType)) +
  geom_bar(fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Chest Pain Type Distribution", x = "Chest Pain Type", y = "Count")

# Correlation analysis between age and cholesterol
ggplot(data, aes(x = Age, y = Cholesterol)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Correlation between Age and Cholesterol", x = "Age", y = "Cholesterol")

# Advanced Analysis
# Correlation matrix for selected variables
cor_data <- data %>% select(Age, Cholesterol, RestingBP, MaxHR, Oldpeak)
correlation_matrix <- cor(cor_data)
print(correlation_matrix)

# Save correlation matrix
write.csv(correlation_matrix, 'correlation_matrix.csv')

# End of script
