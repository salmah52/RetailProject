# Welcome to your new dbt project!

## Using the starter project

Try running the following commands:
- `dbt run`
- `dbt test`


## dbt - Data Transformation

### Overview

dbt (data build tool) simplifies the process of transforming data by allowing users to write SQL queries to transform raw data into meaningful insights. This project focuses on transforming and analyzing retail data sourced from the Online Retail dataset. It includes the creation of dimension and fact tables, schema checks, and tests to ensure data quality.



### Dataset

#### [Online Retail Dataset](https://www.kaggle.com/datasets/tunguz/online-retail)

##### Columns and Descriptions

- **InvoiceNo**: Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with the letter 'c', it indicates a cancellation.
- **StockCode**: Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product.
- **Description**: Product (item) name. Nominal.
- **Quantity**: The quantities of each product (item) per transaction. Numeric.
- **InvoiceDate**: Invoice Date and time. Numeric, the day and time when each transaction was generated.
- **UnitPrice**: Unit price. Numeric, product price per unit in sterling.
- **CustomerID**: Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer.
- **Country**: Country name. Nominal, the name of the country where each customer resides.

### Project Structure

#### Models

The `models` directory contains SQL files defining the transformation logic for dimension and fact tables.

- `dim_customer.sql`: Defines the `dim_customer` dimension table, extracting unique customers and their associated countries.
- `dim_date.sql`: Extracts date and time components from the `InvoiceDate` column.
- `dim_product.sql`: Defines the `dim_product` dimension table for retail products.
- `fct_invoices.sql`: Creates the fact table `fact_invoices` by joining relevant keys from dimension tables.
- Other SQL files for additional transformations.

#### Tests

The `tests` directory includes YAML files defining checks for data quality.The project includes tests to ensure the quality of the transformed data. Tests include schema checks, uniqueness checks, and null value checks.

- `dim_customer.yml`: Defines schema checks and tests for uniqueness and null values in the `dim_customer` table.
- Other YAML files for additional tests.

#### Documentation

SQL comments and YAML files provide documentation for each transformation step, making it easier for collaborators to understand the logic behind the transformations.

#### Metrics

dbt allows for the creation of metrics to measure the impact and effectiveness of your transformations.

## Setting Up the projects

1. Clone the repository: `git clone https://github.com/salmah52/dbtRetailProject.git`
2. Install dbt: `pip install dbt`
3. Configure dbt profile in `profiles.yml`.

## Running the Project

```bash
dbt run -m dim_customer
dbt test -m dim_customer

## Analysis
Feel free to explore the data using SQL queries and dbt. You can create additional analysis SQL files in the analysis directory to derive insights from the transformed data.
