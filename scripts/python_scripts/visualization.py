import pandas as pd
import matplotlib.pyplot as plt
import os

# Define input and output folders relative to the script's location
script_dir = os.path.dirname(os.path.abspath(__file__))
input_folder = os.path.join(script_dir, '../../data/returned_data/')
output_folder = os.path.join(script_dir, '../../visualizations/')

# Load CSV files
df_sales_by_category = pd.read_csv(os.path.join(input_folder, 'amazon_sales_by_category.csv'))
df_daily_sales = pd.read_csv(os.path.join(input_folder, 'amazon_daily_sales_distribution.csv'))
df_weekly_sales = pd.read_csv(os.path.join(input_folder, 'amazon_weekly_sales_distribution.csv'))
df_customer_type = pd.read_csv(os.path.join(input_folder, 'total_sales_per_customer_type.csv'))
df_order_status = pd.read_csv(os.path.join(input_folder, 'order_status_distribution.csv'))
df_top_skus = pd.read_csv(os.path.join(input_folder, 'amazon_top_10_skus.csv'))
df_size_sales = pd.read_csv(os.path.join(input_folder, 'amazon_total_sales_per_product_size.csv'))
df_total_spending_per_order = pd.read_csv(os.path.join(input_folder, 'international_total_spending_per_order_distribution.csv'))
df_total_amount_per_order = pd.read_csv(os.path.join(input_folder, 'international_total_amount_per_order_distribution.csv'))

# Bar chart for Amazon Sales by Category
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))
ax1.bar(df_sales_by_category['product_category'], df_sales_by_category['total_sales'])
ax1.set_title('Amazon Sales by Category')
ax1.set_xlabel('Category')
ax1.set_ylabel('Total Sales')
ax1.tick_params(axis='x', rotation=90)

ax2.bar(df_size_sales['product_size'], df_size_sales['total_sales'])
ax2.set_title('Amazon Sales per Product Size')
ax2.set_xlabel('Size')
ax2.set_ylabel('Total Sales')
ax2.tick_params(axis='x', rotation=90)

plt.tight_layout()
plt.savefig(os.path.join(output_folder, 'amazon_sales_by_category_and_size.png'))
plt.show()

# Line chart for Amazon Daily Sales Distribution
fig, ax3 = plt.subplots(figsize=(12, 6))
ax3.plot(df_daily_sales['order_date'], df_daily_sales['total_sales'])
ax3.set_title('Amazon Daily Sales Distribution')
ax3.set_xlabel('Date')
ax3.set_ylabel('Total Sales')
ax3.tick_params(axis='x', rotation=45)

plt.tight_layout()
plt.savefig(os.path.join(output_folder, 'amazon_daily_sales_distribution.png'))
plt.show()

# Bar chart for Amazon Average Sales per Weekday and Top 10 SKUs by Quantity Sold
fig, (ax4, ax5) = plt.subplots(1, 2, figsize=(12, 6))
ax4.bar(df_weekly_sales['weekday_name'], df_weekly_sales['avg_sales'])
ax4.set_title('Amazon Sales Distribution by Weekday')
ax4.set_xlabel('Weekday')
ax4.set_ylabel('Average Sales')
ax4.tick_params(axis='x', rotation=90)

ax5.bar(df_top_skus['product_sku'], df_top_skus['total_quantity_sold'])
ax5.set_title('Top 10 SKUs by Quantity Sold')
ax5.set_xlabel('SKU')
ax5.set_ylabel('Total Quantity Sold')
ax5.tick_params(axis='x', rotation=90)

plt.tight_layout()
plt.savefig(os.path.join(output_folder, 'amazon_sales_distribution_weekday_and_top_skus.png'))
plt.show()

# Pie charts for Amazon Sales Distribution by Customer Type and Order Status Distribution
fig, (ax6, ax7) = plt.subplots(1, 2, figsize=(12, 6))
sizes = df_customer_type['total_sales']
labels = df_customer_type['customer_type']
ax6.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=140)
ax6.axis('equal')
ax6.set_title('Amazon Sales Distribution by Customer Type')

sizes = df_order_status['percentage_of_orders']
labels = df_order_status['order_status']
explode = [1.7 if i == 3 else 1.3 if i == 4 else 1 if i == 5 else 0.7 if i == 6 else 0 for i in range(len(sizes))]
ax7.pie(sizes, autopct='%1.1f%%', startangle=140, explode=explode)
ax7.legend(labels, loc='upper left', bbox_to_anchor=(1, 1))
ax7.axis('equal')
ax7.set_title('Amazon Order Status Distribution')

plt.tight_layout()
plt.savefig(os.path.join(output_folder, 'amazon_sales_distribution_customer_type_and_order_status.png'))
plt.show()

# Box plots for Total Spending per Order and Total Amount per Order
fig, (ax8, ax9) = plt.subplots(1, 2, figsize=(12, 6))
ax8.boxplot(df_total_spending_per_order['total_gross_amt'])
ax8.set_title('International Total Spending per Order')
ax8.set_ylabel('Total Spending')

ax9.boxplot(df_total_amount_per_order['total_amount'])
ax9.set_title('International Total Amount per Order')
ax9.set_ylabel('Total Amount')

plt.tight_layout()
plt.savefig(os.path.join(output_folder, 'total_spending_and_amount_per_order.png'))
plt.show()
