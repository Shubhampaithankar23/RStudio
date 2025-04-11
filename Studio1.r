import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Create the initial DataFrame
data = pd.DataFrame({
    'Customer': ['Alice', 'Bob', 'Charlie', 'Alice', np.nan],
    'Product': ['Laptop', 'Phone', 'Tablet', 'Laptop', 'Phone'],
    'Quantity': [1, 2, np.nan, 1, 2],
    'Price': [1000, 500, 300, 1000, 500]
})

# Display original data
print("Original Data:")
print(data)

# Handle missing values
data['Customer'].fillna('Guest', inplace=True)
data['Quantity'].fillna(data['Quantity'].median(), inplace=True)

# Remove duplicate rows
data.drop_duplicates(inplace=True)

# Add a new column "Total"
data['Total'] = data['Quantity'] * data['Price']

# Display updated data
print("\nUpdated Data:")
print(data)

# Visualization 1: Total Sales by Product
sns.barplot(data=data, x='Product', y='Total', estimator=sum)
plt.title("Total Sales by Product")
plt.ylabel("Total Sales")
plt.xlabel("Product")
plt.show()

# Visualization 2: Distribution of Quantity Purchased
sns.histplot(data['Quantity'], bins=5)
plt.title("Distribution of Quantity Purchased")
plt.xlabel("Quantity")
plt.ylabel("Frequency")
plt.show()
