import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
data = pd.read_csv('SampleSuperstore.csv')

# Display basic information
print(data.info())
print(data.describe())

# Data Cleaning (if necessary)
# For example, removing duplicates
data.drop_duplicates(inplace=True)

# 1. Bar Graph: Sales by Category
plt.figure(figsize=(10, 6))
sns.barplot(x='Category', y='Sales', data=data, estimator=sum)
plt.title('Total Sales by Category')
plt.xlabel('Category')
plt.ylabel('Total Sales')
plt.show()

# Justification: A bar graph is effective for comparing quantities across categories.
# Insights: This graph shows which product categories generate the most sales.

# 2. Bar Graph: Sales by Region
plt.figure(figsize=(10, 6))
sns.barplot(x='Region', y='Sales', data=data, estimator=sum)
plt.title('Total Sales by Region')
plt.xlabel('Region')
plt.ylabel('Total Sales')
plt.show()

# Justification: A bar graph is effective for comparing quantities across regions.
# Insights: This graph shows which regions generate the most sales.

# 3. Box-Whisker Plot: Profit by Category
plt.figure(figsize=(10, 6))
sns.boxplot(x='Category', y='Profit', data=data)
plt.title('Profit by Category')
plt.xlabel('Category')
plt.ylabel('Profit')
plt.show()

# Justification: A box-whisker plot shows the distribution and outliers of a variable.
# Insights: This graph compares the profitability of different categories and identifies any outliers.

# 4. Pie Chart: Sales by Region
sales_by_region = data.groupby('Region')['Sales'].sum().reset_index()
plt.figure(figsize=(10, 6))
plt.pie(sales_by_region['Sales'], labels=sales_by_region['Region'], autopct='%1.1f%%', startangle=140)
plt.title('Sales by Region')
plt.show()

# Justification: A pie chart is effective for showing proportions.
# Insights: This graph shows the contribution of each region to total sales, highlighting the most and least profitable regions.

# 5. Scatter Plot: Discount vs Profit
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Discount', y='Profit', data=data)
plt.title('Discount vs Profit')
plt.xlabel('Discount')
plt.ylabel('Profit')
plt.show()

# Justification: A scatter plot shows the relationship between two variables.
# Insights: This graph reveals how discounts impact profit, helping to identify optimal discount levels.

# 6. Histogram: Distribution of Sales
plt.figure(figsize=(10, 6))
sns.histplot(data['Sales'], bins=30, kde=True)
plt.title('Distribution of Sales')
plt.xlabel('Sales')
plt.ylabel('Frequency')
plt.show()

# Justification: A histogram is useful for understanding the distribution of a single variable.
# Insights: This graph reveals the frequency of different sales amounts, highlighting common sales ranges.


# Heatmap: Correlation Matrix
plt.figure(figsize=(10, 6))
correlation_matrix = data.corr(numeric_only=True)  # Calculate correlation matrix
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt='.2f')
plt.title('Correlation Heatmap')
plt.show()

# Justification: A heatmap is effective for visualizing correlations between numerical variables.
# Insights: This graph shows the relationships between variables like Sales, Profit, Discount, and Quantity.
# For example, a strong positive correlation between Sales and Profit indicates that higher sales lead to higher profits.


# Violin Plot
plt.figure(figsize=(10, 6))
sns.violinplot(x='Region', y='Profit', data=data)
plt.title('Profit Distribution by Region')
plt.xlabel('Region')
plt.ylabel('Profit')
plt.show()