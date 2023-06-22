#HPI comparison
library(lubridate)
library(ggplot2)
library(dplyr)

# change directory
setwd("C:/Users/thoma/Desktop/projects/data")

# Load the data from a CSV file
house_data <- read.csv("HPI_PO_monthly_histv3.csv")

house_data$Month <- gsub(" ", "", house_data$Month) # removing spaces 
house_data$Month <- as.Date(house_data$Month, format = "%Y-%m-%d") # Convert date column to proper date format

# Select the relevant columns for region, year, and HPI (replace with your own column names)
East_North_Central_.NSA <- house_data$East_North_Central_.NSA.
East_North_Central_.SA <- house_data$East_North_Central_.SA.
hpi_column <- "HPI"
year_column <- house_data$Month

# Data cleaning
house_data <- house_data %>%
  filter(!is.na(house_data$Month), !is.na(house_data$East_North_Central_.NSA.), !is.na(house_data$East_North_Central_.SA.))  # Remove rows with missing values in Date or Price columns


# Filter the data for the two regions
#filtered_data <- data %>%
#  filter(Region %in% c(region1, region2))

# Create a line graph comparing HPI between the two regions
ggplot(data = house_data, aes(x = Month, y = East_North_Central_.NSA.)) +
  geom_line() +
  labs(x = "Month", y = "House Price Index", title = "Comparison of HPI between Region 1 and Region 2") +
  scale_color_manual(values = c("East_North_Central_.NSA." = "blue", "East_North_Central_.SA." = "red"))

