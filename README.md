# 📦 WideWorldImporters Data Warehouse Project

## 📘 Project Summary

This repository contains a comprehensive data warehousing and business intelligence (BI) solution. The project involves designing a star schema-based data warehouse using **Microsoft SQL Server**, developing an ETL pipeline with **SQL Server Integration Services (SSIS)**, building an OLAP cube using **SQL Server Analysis Services (SSAS)**, and visualizing insights through **Power BI**.

---

## 🎯 Project Objectives

- Integrate structured data from:
  - the **WideWorldImporters** transactional SQL database
  - external **CSV** file
- Design a **star schema** data warehouse optimized for analytical workloads
- Develop a complete **ETL process** using SSIS
- Handle data quality, data integration, and transformation
- Build a multidimensional **OLAP Cube** using SSAS for efficient querying
- Generate **interactive dashboards** and visual reports using Power BI and Excel

---

## 📂 Data Sources

| Source Type | Description |
|-------------|-------------|
| SQL Server  | WideWorldImporters transactional database |
| CSV File    | External Sales Person data |


These sources were ingested into a **staging database** before being transformed and loaded into the final dimensional model.

---

## 🛢️ Database Design

### 📍 Staging Area: `WideWorldImporters_Staging`

The staging database mirrors the raw data to perform cleansing, integration, and transformation independently of the source systems.

#### Tables in Staging:

- `stg_BuyingGroups`
- `stg_CustomerCategories`
- `stg_Customers`
- `stg_Countries`
- `stg_StateProvinces`
- `stg_Cities`
- `stg_SalesPeople`
- `stg_StockGroups`
- `stg_StockItemStockGroups`
- `stg_StockItems`
- `stg_Suppliers`
- `stg_Colors`
- `stg_PackageTypes`
- `stg_Invoices`
- `stg_InvoiceLines`

---

## 🧱 Data Warehouse Schema (Star Schema)

![image](https://github.com/user-attachments/assets/5468ebf4-183a-43a7-a25d-33c4b55469ed)


### ⭐ Fact Table

- `FactSales`: Combines invoice and line item data with foreign keys to all dimensions.

### 🧩 Dimension Tables

| Table         | Source/Notes |
|---------------|--------------|
| `DimCustomer` | Created using multiple staging tables: customers, categories, groups, countries, cities |
| `DimSalesperson` | Derived directly from the salesperson CSV data |
| `DimProduct` | Created by joining stock-related staging tables and suppliers |
| `DimDate` | Generated manually using SQL script (no source data contained date dimension)

---

## 🔁 ETL Process Using SSIS

The ETL pipeline consists of:

### 1. Extract
- Loaded data from SQL Server and CSV file into the staging area.

### 2. Transform
- **Views** were created for data integration and transformation:
  - Customer dimension uses two views: 
    - View 1: combines `stg_Countries`, `stg_StateProvinces`, `stg_Cities`
    - View 2: combines `stg_Customers`, `stg_CustomerCategories`, `stg_BuyingGroups`
  - Product dimension combines multiple product-related staging tables.
- **Data Cleansing:** handled NULLs (e.g., CountryType).
- **Slowly Changing Dimension (SCD):**
  - Applied on `DimCustomer`:
    - Historical Attributes: Continent, City, Region
    - Changing Attributes: Fax Number, Phone Number

### 3. Load
- Data was loaded into dimension tables first, followed by the `FactSales` table.
- Lookup transformations were used to retrieve surrogate keys from dimension tables.
- Calculated fields such as `CostAmount`, `ProfitAmount`, and `TotalPriceWithoutTax` were added via Derived Column transformation.

---

## 📊 SSAS OLAP Cube Design

### ✔️ Dimensions Created:

- **Customer Dimension**
- **Salesperson Dimension**
- **Product Dimension**
- **Date Dimension**

Each dimension includes a key column and descriptive attributes.

### 🧮 Fact Measure Group:

- `FactSales`: contains all measures used for multidimensional analysis.

### 🧰 Cube Processing Workflow:

1. Create SSAS Multidimensional project in Visual Studio
2. Define Data Source and Data Source View (DSV)
3. Add Dimensions and establish relationships
4. Create and deploy Cube
5. Process Cube to load data

---

## 🔍 OLAP Operations Demonstrated (via Excel)

| Operation  | Description |
|------------|-------------|
| Roll-up    | Aggregate data to a higher level (e.g., city to country) |
| Drill-down | Break down data from summary to detail |
| Slice      | Filter data on a single dimension |
| Dice       | Filter using two or more dimensions |
| Pivot      | Rotate data axes for analysis |

---

## 📈 Power BI Dashboards

1. **Matrix Visual Report**  
2. **Multi-Slicer Visuals**  
3. **Drill-Down Report**  
4. **Drill-Through Report**  
 

---

## 💻 Tools & Technologies

| Tool | Description |
|------|-------------|
| Microsoft SQL Server | Relational DBMS used for staging and warehouse |
| SQL Server Integration Services (SSIS) | ETL tool for data flow pipelines |
| SQL Server Analysis Services (SSAS) | OLAP engine to create multidimensional cubes |
| Microsoft Power BI | Visualization and reporting platform |
| Microsoft Excel | Used to demonstrate OLAP operations |

---

## 📬 Contact

For any academic inquiries or clarifications, please reach out via email or institutional platforms.

