# 1.  Air Quality Analysis: Inbuilt dataset: airquality in R
# A. Filter the records for the month of July.
# B. Group the data by Month and calculate the average Ozone.
# C. Use a pipe operator to fetch records where Ozone > 50.

library(dplyr)

data("airquality")

# A. Filter records for July (Month = 7)
july_data <- airquality %>%
  filter(Month == 7)

print(july_data)

# B. Group by Month and calculate average Ozone
ozone_avg <- airquality %>%
  group_by(Month) %>%
  summarise(Avg_Ozone = mean(Ozone), na.rm = TRUE)

print(ozone_avg)

# C. Use pipe to fetch records with Ozone > 50
high_ozone <- airquality %>%
  filter(Ozone > 50)

print(high_ozone)





# 3. Car Performance Analysis: Inbuilt dataset: mtcars in R
# A. Compare the fuel efficiency (mpg) of automatic vs. manual transmission cars.
# B. Identify the relationship between horsepower (hp) and fuel consumption.

library(dplyr)
library(ggplot2)

# Add a readable label for transmission
mtcars$Transmission <- ifelse(mtcars$am == 0, "Automatic", "Manual")

# Calculate average mpg by transmission
avg_mpg <- mtcars %>%
  group_by(Transmission) %>%
  summarise(Average_MPG = mean(mpg))

print(avg_mpg)

# Bar plot for comparison
ggplot(avg_mpg, aes(x = Transmission, y = Average_MPG, fill = Transmission)) +
  geom_bar(stat = "identity") +
  labs(title = "Fuel Efficiency by Transmission Type",
       x = "Transmission Type",
       y = "Average MPG") +
  theme_minimal()


  # 5. Titanic Survival Analysis: Inbuilt Dataset: Titanic in R

# A. Compute the total number of passengers by gender and class.

# B. Calculate the percentage of passengers who survived, grouped by class.


library(titanic)
library(dplyr)

data <- titanic_train

# A. Total number of passengers by gender and class
passenger_counts <- data %>%
  group_by(Sex, Pclass) %>%
  summarise(Total_Passengers = n())

print(passenger_counts)

# B. Percentage of passengers who survived, grouped by class
survival_by_class <- data %>%
  group_by(Pclass) %>%
  summarise(Survival_Rate = mean(Survived) * 100)

print(survival_by_class)




# 7. Iris Flower Classification: Inbuilt Dataset : iris in R

# A. Calculate the average petal length and petal width for each species.
# B. Create a scatter plot of Sepal.Length vs Sepal.Width colored by species


library(dplyr)
library(ggplot2)

data("iris")

# A. Average Petal.Length and Petal.Width by Species
avg_petal <- iris %>%
  group_by(Species) %>%
  summarise(
    Avg_Petal_Length = mean(Petal.Length),
    Avg_Petal_Width = mean(Petal.Width)
  )

print(avg_petal)

B. Scatter plot of Sepal.Length vs Sepal.Width by Species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Sepal Dimensions by Species",
       x = "Sepal Length",
       y = "Sepal Width") +
  theme_minimal()


#  9. Distribution of Petal Length:  Inbuilt dataset: iris in R

# Use histograms and density plots to visualize petal length distribution.

library(ggplot2)

data("iris")

# Histogram of Petal Length
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Petal Length",
       x = "Petal Length",
       y = "Frequency") +
  theme_minimal()

# Density plot of Petal Length
ggplot(iris, aes(x = Petal.Length)) +
  geom_density(fill = "lightgreen", alpha = 0.6) +
  labs(title = "Density Plot of Petal Length",
       x = "Petal Length",
       y = "Density") +
  theme_minimal()


# 11. Dataset: mtcars (inbuilt in R)
# A.  Filter and show details of cars with horsepower (hp) greater than 150.
# B. Create a scatter plot showing the relationship between horsepower (hp) and fuel efficiency (mpg).

library(ggplot2)
library(dplyr)

# Load dataset
data("mtcars")


high_hp_cars <- mtcars %>% filter(hp > 150)

print(high_hp_cars)

# Scatter plot
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "steelblue", size = 3) +
  labs(title = "Horsepower vs. Fuel Efficiency",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()



# 13. CO2 Emissions : Inbuilt dataset: CO2 in R

# A. Compare CO2 uptake between different treatment groups.
# B. Analyze which factors significantly affect CO2 levels.

library(dplyr)
library(ggplot2)

data("CO2")

# A. Average CO2 uptake by Treatment group
avg_uptake <- CO2 %>%
  group_by(Treatment) %>%
  summarise(Avg_Uptake = mean(uptake))

print(avg_uptake)

# B. Scatter plot: CO2 uptake vs. concentration, colored by Plant Type
ggplot(CO2, aes(x = conc, y = uptake, color = Type)) +
  geom_point(size = 3) +
  labs(title = "CO2 Uptake by Concentration and Plant Type",
       x = "CO2 Concentration (ppm)",
       y = "CO2 Uptake",
       color = "Plant Type") +
  theme_minimal()


# 15. A supermarket chain has collected sales data but has missing values and incorrect entries. The dataset is given below:

# sales_data <- data.frame(

#   Transaction_ID = c(101, 102, 103, 104),

#   Date = as.Date(c("2024-03-01", "2024-03-02", "2024-03-03", "2024-03-04")),

#   Product = c("Apples", "Bread", "Milk", "Cheese"),

#   Category = c("Fruits", "Bakery", "Dairy", "Dairy"),

#   Quantity = c(2, NA, -1, 1),

#   Price = c(1.5, 2.0, 3.0, 5.0),

#   Total_Sales = c(3.0, NA, -3.0, 5.0)

# )

# Write the code in R for below problems:

# Identify and handle missing values in Quantity and Total_Sales.
# Correct the incorrect Quantity values (negative values).
# Compute Total_Sales where missing.
# Summarize total sales per category.

sales_data <- data.frame(
  Transaction_ID = c(101, 102, 103, 104),
  Date = as.Date(c("2024-03-01", "2024-03-02", "2024-03-03", "2024-03-04")),
  Product = c("Apples", "Bread", "Milk", "Cheese"),
  Category = c("Fruits", "Bakery", "Dairy", "Dairy"),
  Quantity = c(2, NA, -1, 1),
  Price = c(1.5, 2.0, 3.0, 5.0),
  Total_Sales = c(3.0, NA, -3.0, 5.0)
)

# 1. Handle missing values in Quantity and Total_Sales
# Replace missing Quantity with the median 
sales_data$Quantity[is.na(sales_data$Quantity)] <- median(sales_data$Quantity, na.rm = TRUE)

# Replace missing Total_Sales with 0 
sales_data$Total_Sales[is.na(sales_data$Total_Sales)] <- 0

# 2. Correct negative Quantity values
sales_data$Quantity[sales_data$Quantity < 0] <- abs(sales_data$Quantity[sales_data$Quantity < 0])

# 3. Recompute Total_Sales where it's 0 or wrong
sales_data$Total_Sales <- sales_data$Quantity * sales_data$Price

# 4. Summarize total sales per category
library(dplyr)
category_summary <- sales_data %>%
  group_by(Category) %>%
  summarise(Total_Sales_Sum = sum(Total_Sales))

print(category_summary)



# Golden Question

# 2. Using any built-in dataset in R, perform the following tasks:

# Data Manipulation using dplyr:

# Select relevant columns for analysis.
# Filter the dataset based on a meaningful condition.
# Create a new derived column using existing data.
# Group the data and compute summary statistics.
# Arrange the dataset meaningfully (e.g., in ascending or descending order).
# Data Visualization using ggplot2:

# Create at least two visualizations to explore trends or distributions in the dataset
# Use appropriate aesthetics such as color, size, and facets.
# Add clear axis labels, a title, and a legend where necessary.



library(dplyr)
library(ggplot2)


head(mtcars)

#  Data Manipulation
manipulated_data <- mtcars %>%
  select(mpg, cyl, hp, gear) %>%
  filter(hp > 100) %>%
  mutate(Efficiency = mpg / cyl) %>%
  group_by(gear) %>%
  summarise(
    Avg_MPG = mean(mpg),
    Avg_HP = mean(hp),
    Count = n()
  ) %>%
  arrange(desc(Avg_MPG))

print(manipulated_data)

#  Scatter Plot - HP vs MPG
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(size = 3) +
  labs(
    title = "Horsepower vs MPG",
    x = "Horsepower (hp)",
    y = "Miles Per Gallon (mpg)",
    color = "Cylinders"
  ) +
  theme_minimal()

#  Boxplot - MPG by Gear
ggplot(mtcars, aes(x = factor(gear), y = mpg)) +
  geom_boxplot() +
  labs(
    title = "Distribution of MPG by Number of Gears",
    x = "Number of Gears",
    y = "Miles Per Gallon (mpg)"
  ) +
  theme_minimal(
