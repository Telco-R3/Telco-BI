# 🧩 Customer Churn Analysis Project
**Power BI | Data Analytics | Customer Insights**

---

## Project Overview

This project provides an in-depth analysis of **customer churn behavior** to identify the key drivers behind customer attrition and uncover actionable insights. The primary goal is to help the company **reduce the churn rate**, improve the customer experience, and increase revenue retention.

The analysis is powered by a robust **Data Pipeline** engineered using the **Medallion Architecture**, resulting in a highly optimized Star Schema. The final insights are presented through an interactive and comprehensive **Power BI Dashboard** containing five dedicated analytical pages.
Data was modeled into a Star Schema and visualized through an interactive Power BI Dashboard containing five analytical pages.

## Project Structure
```
Customer-Churn-Analysis/
│
├── data/
│   ├── data_set/          
│   │   │   └── Telco customer churn dataset.csv      # Source datasets used for analysis
│   ├── Data Warehouse Documentation/                 # Documentations about the data warehouse
│   ├── scripts/
│   │   ├── ddl/                           # Contains SQL scripts for data warehouse schema definition
│   │   │   └── DDL_Telecom_churn_whare_house.sql
│   │   │
│   │   ├── etl/                           # Contains transformation scripts after data modeling
│   │   │   └── the Same data After modeling.sql
│   │   │
│   │   ├── bronze/                        # Raw data layer
│   │   ├── silver/                        # Cleaned and transformed data
│   │   └── gold/                          # Final analytical data
|
├── Analysis/
│   ├── Telco_Churn_Dashboard.pbix         # Power BI dashboard files
│   ├── DAX & Questions.pdf                # DAX measures and analytical questions
│   ├── Business Scenario.pdf              # Business understanding and objectives
│   ├── Business Scenario.pdf              # Business understanding and objectives
│   └── recommendations.ppt                # Presentation for strategic recommendations
│
├── Presentation/
│   └── Final project presentation.pdf     # Final presentation slides reports
│
├── visuals/
│   ├── churn_analysis_page.png
│   ├── customer_demographics_page.png
│   ├── customer_segmentation_page.png 
│   ├── home_page.png
│   ├── overview_page.png 
│   ├── service_usage_page.png
|   ├── bg/
│   └── icons/
│
└── README.md
```

## Project Files
[Google Drive Folder](https://drive.google.com/drive/folders/1170s0DJj1R7SonS9M5dmE-gKqDE6HC62)
---

## 📊 Data Architecture
The project follows the **Medallion Architecture** — a layered data design pattern that improves data quality and scalability across the pipeline.

- **Bronze Layer:** Raw data directly ingested from the source system.  
- **Silver Layer:** Cleaned and transformed data used for analysis.  
- **Gold Layer:** Aggregated and business-ready data used in the Power BI dashboards.

![Data](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/data_architecturee.png)
![Data](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/data_model.drawio.png)
![Data](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/Data_flow_diagram.drawio.png)

---

## 📊 Data Architecture and Data Model Deep Dive

The project utilizes a dedicated Data Warehouse structured under the **Medallion Architecture** (Bronze, Silver, Gold layers) to ensure data quality, reliability, and governance throughout the entire analysis pipeline.

### Medallion Layers Overview

| Layer Name | Purpose and Role | Key Technologies/Actions |
| :--- | :--- | :--- |
| **Bronze Layer** | **Raw Data Ingestion:** Serves as the landing zone for the raw Telco dataset. Data is stored in its original format. | Initial data load. |
| **Silver Layer** | **Cleaning and Standardization:** This critical layer performed data cleansing, standardization, and feature engineering (e.g., handling nulls, type conversion). | SQL/Power Query (ETL/ELT). |
| **Gold Layer** | **Business-Ready Analysis:** The final, governed layer. Data is aggregated and structured into the **Star Schema** to support high-performance analytical queries in Power BI. | Star Schema Design (Fact and Dimension Tables). |

---

## 🛠️ Data Catalog for Gold Layer

The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. The model uses a **Star Schema** with the following components (as seen in the Power BI Model View):


### 1. `dim_customer` (Dimension Table)

**Purpose:** Stores static customer demographics and contact information.

| Column Name | Data Type (Power BI) | Description |
| :--- | :--- | :--- |
| `CustomerID` | Text | Unique identifier for the customer (Primary Key). |
| `CustomerKey` | Whole Number | Surrogate Key for linking to fact tables. |
| `Gender` | Text | The gender of the customer. |
| `SeniorCitizen` | Text | Indicates if the customer is a senior citizen (`Yes`, `No`). |
| `Partner` | Text | Indicates if the customer has a partner (`Yes`, `No`). |
| `Dependents` | Text | Indicates if the customer has dependents (`Yes`, `No`). |
| `City`, `State` | Text | Geographic location data for the customer. |


### 2. `dim_services` (Dimension Table)

**Purpose:** Provides a detailed breakdown of all core and value-added services subscribed to.

| Column Name | Data Type (Power BI) | Description |
| :--- | :--- | :--- |
| `ServiceKey` | Whole Number | Surrogate Key for linking to fact tables. |
| `DeviceProtection` | Text | Indicates Device Protection subscription status. |
| `InternetService` | Text | The type of internet service subscribed (`DSL`, `Fiber optic`, `No`). |
| `MultipleLines` | Text | Indicates if the customer has multiple phone lines. |
| `OnlineBackup`, `OnlineSecurity` | Text | Indicates subscription status for security services. |
| `PhoneService` | Text | Indicates if the customer has phone service. |
| `StreamingMovies`, `StreamingTV` | Text | Indicates subscription status for streaming services. |
| `TechSupport` | Text | Indicates subscription to Technical Support. |

### 3. `dim_contract`, `dim_payment`, `dim_churn` (Supporting Dimensions)

**Purpose:** These tables provide key attributes for filtering and segmenting the main facts.

| Table Name | Key Columns | Description |
| :--- | :--- | :--- |
| `dim_contract` | `ContractKey`, `ContractType` | Details about the duration and type of customer's contract. |
| `dim_payment` | `PaymentMethodKey`, `PaymentMethod` | Details the customer's payment channel. |
| `dim_churn` | `ChurnReasonKey`, `ChurnReason` | Categorizes the specific reason a customer decided to churn (if applicable). |

### 4. `fact_subscriptions` (Fact Table)

**Purpose:** Stores transactional metrics, customer behavior over time, and core churn metrics.

| Column Name | Data Type (Power BI) | Description |
| :--- | :--- | :--- |
| `FactKey` | Whole Number | Primary Key for the fact table. |
| `CustomerID` | Text | Links to `dim_customer`. |
| `ContractKey`, `PaymentMethodKey`, `ServiceKey` | Whole Number | Foreign Keys linking to respective dimension tables. |
| `TenureMonths` | Whole Number | The total number of months the customer has been with the company. |
| **`MonthlyCharges`** | Decimal Number | The total amount charged to the customer monthly. |
| **`TotalCharges`** | Decimal Number | The total amount charged to the customer over the entire tenure. |
| **`ChurnFlag`** | Text | The core Churn Metric: `Yes` (Churned) or `No` (Active/Retained). |
| **`CLTV`** | Decimal Number | Calculated Customer Lifetime Value (Calculated Column based on the CLTV measure). |
| **`ChurnScore`** | Decimal Number | Predictive score indicating the likelihood of churn. |
| **`Customer_Segment`** | Text | Derived segment (e.g., High Value, Low Value) based on CLTV and other factors. |

---



### Gold Layer Output: Star Schema Components

The final data model is built on the following key Fact and Dimension tables, created in the **Gold Layer**, with established **One-to-Many** relationships (as shown in the data model schema):

| Table Name (Schema Role) | Description | Primary Key / Foreign Key | Key Attributes (Examples) |
| :--- | :--- | :--- | :--- |
| `fact_subscriptions` (**Fact Table**) | Contains transactional metrics, customer behavior, and the core churn metrics. | **FKs:** Links to Dimension Tables. | Monthly Charges, Total Charges, TenureMonths, **ChurnFlag**. |
| `dim_customer` (**Dimension Table**) | Contains static customer demographics and contact information. | **PK:** CustomerID. | Partner, Dependents, SeniorCitizen, Gender. |
| `dim_services` (**Dimension Table**) | Details the various value-added and core services subscribed to by customers. | **PK:** ServiceKey. | InternetService, OnlineSecurity, TechSupport, Streaming TV. |

---

## 🔬 Data Dictionary: Key Field Analysis

This section details the analytical and technical role of the most critical fields, demonstrating how raw data translates into actionable analytical work:

| Field Name | Source Table | Data Type (Power BI) | Analytical Role & DAX Usage Example |
| :--- | :--- | :--- | :--- |
| **ChurnFlag** | `fact_subscriptions` | Text (yes/no) | Core Churn Metric. Used in `CALCULATE` functions to define filtered contexts for **Churn Rate %** and **Churned Customers**. |
| **Total Charges** | `fact_subscriptions` | Decimal Number | Basis for financial metrics, e.g., **Total Revenue** and **Churned Revenue**. *Technical Note: Required data cleaning in the Silver Layer to handle initial text/blank values for new customers.* |
| **TenureMonths** | `fact_subscriptions` | Whole Number | Time dimension. Crucial for calculating **Average Tenure** and used in the complex **Average CLTV** formula. |
| **OnlineSecurity** | `dim_services` | Text (Yes/No) | Key dimension for **Service Usage Analysis**. Used with `COUNTROWS(FILTER(...))` to calculate service adoption percentages (e.g., Online Security %). |

---

## 📊 Dashboard Pages Technical Deep Dive

The Power BI dashboard relies on the structured **Star Schema** data model and leverages complex **DAX measures** to deliver high-impact insights.

---

### 🏠 Home Page

The **Home Page** serves as the dashboard's main entry point and sets the visual tone for the entire report.  

![Home Page](https://github.com/Telco-R3/Telco-BI/blob/f07707c644c6be8c4a871ffcea43c4223b68db16/Customer-Churn-Analysis/Visuals/home_page.png)

--- 

### 📋 Overview Page

| Focus Area | Technical Implementation & Challenges |
| :--- | :--- |
| **KPI Calculations (DAX)** | Relied on measures like **Total Customers** (`DISTINCTCOUNT`) and **Active Customers** (using `CALCULATE` to apply `ChurnFlag = "no"` filter context). |
| **Time Series Prep** | **Tenure Bucketing:** Implemented a Calculated Column or M-Query step to categorize `TenureMonths` for structured time-based analysis. |


![Overview Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/overview_page.png)

---

### 📉 Churn Analysis Page

| Focus Area | Technical Implementation & Challenges |
| :--- | :--- |
| **Average CLTV (DAX)** | Implemented the most complex measure: **Average CLTV**. This required a row context transition using `AVERAGEX` over `CustomerID` combined with `CALCULATE` and `SUMX`. |
| **Churned Revenue (DAX)** | Used a specific filter context: `Churned Revenue = CALCULATE(SUM('fact_subscriptions'[Total Charges]), 'fact_subscriptions'[ChurnFlag] = "Yes")`. |
| **Sankey Diagram** | Utilized a **Custom Visual** for multi-dimensional path analysis of churn drivers (e.g., Contract $\rightarrow$ Payment Method). |


![Churn Analysis Page](https://github.com/Telco-R3/Telco-BI/blob/96087a8ba33179105fbc861be173310046050f67/Customer-Churn-Analysis/Visuals/ChurnAnalysis_Page)

---

### 👥 Customer Segmentation Page

| Focus Area | Technical Implementation & Challenges |
| :--- | :--- |
| **Segmentation Logic (DAX)** | **Customer segments** (High Value, Mid Value, Low Value) are classified using a **DAX Calculated Column** in `fact_subscriptions` based on thresholds applied to the CLTV metric. |
| **Percentage Metrics** | Segmentation percentages (e.g., High Value Customers %) rely on the pattern `DIVIDE(COUNTROWS(FILTER(...)), [Total Customers])`. |


![Customer Segmentation Page](https://github.com/Telco-R3/Telco-BI/blob/507da310821963bfd56f610181480f98737c8273/Customer-Churn-Analysis/Visuals/customer_segmentation_page)

---

### ⚙️ Service Usage Page

| Focus Area | Technical Implementation & Challenges |
| :--- | :--- |
| **Complex OR Logic (Streaming %)** | The measure **Streaming %** required using `VAR`, `DISTINCT`, and the **Logical OR (`||`)** operator within the filter function to account for both Streaming TV and Streaming Movies. |
| **Service Adoption Measures** | Metrics like **Online Security %** are calculated by filtering the `dim_services` table (`COUNTROWS(FILTER(...))`) and dividing by the total number of services (or customers). |


![Service Usage Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/Service_Usage_Page.png)


---

### 🌍 Customer Demographics Page

| Focus Area | Technical Implementation & Challenges |
| :--- | :--- |
| **Demographic Percentage Metrics** | Key metrics like **Dependents %** and **Senior Citizen %** were calculated using the `DIVIDE(COUNTROWS(FILTER(...)), [Total Customers])` pattern. |
| **Geospatial Visualization** | Required pre-processing in **Power Query** to ensure geographical data (e.g., City) was clean and compatible with the Power BI Map Visual. |


![Customer Demographics Page](https://github.com/Telco-R3/Telco-BI/blob/7dadb7ab704c69d1950c41bdcb71265483b1563c/Customer-Churn-Analysis/Visuals/customer_demographics_page.png)

---

## 🧠 Key Insights
- Fiber users have the **highest churn rate** due to pricing issues.  
- Customers with **monthly contracts** are more likely to churn.  
- Senior citizens and single users show **higher churn tendencies**.  
- Improved **technical support** could significantly reduce churn.  
- Incentivizing **contract upgrades** increases retention and lifetime value.

## 📊 Analytical KPIs Summary

This project’s DAX measures focus on analyzing customer churn, revenue loss, and behavioral patterns.

- **Retention Metrics:** `Churn Rate %`, `Active Customers`, `Average Tenure`
- **Revenue Metrics:** `MRR`, `Total Revenue`, `Churned Revenue`, `ARPU`
- **Customer Value Segmentation:** `Average CLTV`, `High/Low/Mid Value Customers %`
- **Demographics & Services:** `Partner %`, `Dependents %`, `Senior Citizen %`, `Internet Service %`, `Tech Support %`, `Streaming %`
- **Goal:** Provide actionable insights for **reducing churn** and **maximizing customer lifetime value**.
  
---

## 👩‍💻 Project Team

This project was developed as part of the **Digital Egypt Pioneers Initiative (DEPI)** under the **Data Analytics Track**,  
supervised by **Eng. Abdelrahman Ashour**.

| Name | Role | Contribution |
|------|------|---------------|
| **Esraa Soliman Mubarak** | Data Analyst | Dashboard development, data analysis, insights extraction, and report design |
| **Ahmed Anwer Fath** | Data Engineer | Data preparation, pipeline creation, and data warehouse design |
| **Tasneem Shaaban Attia** | Presenter | Project presentation, storytelling, and communication of findings |
| **Ibrahim Saeed Mohamed** | BI Developer | Dashboard implementation and Power BI visualizations |
| **Muhannad Mahfouz Muhammad** | UI Designer | Dashboard layout, color theme, and visual consistency |

---

## ⚙️ Tools & Technologies Used

The project was developed using the following tools and technologies:

| Category | Tool | Purpose |
|-----------|------|----------|
| **Data Processing & Modeling** | MS SQL Server | Data cleaning, transformation, and querying. Database schema and relationships|
| **BI & Visualization** | Power BI | Dashboard creation and data visualization |
| **Documentation** | Google Docs, PowerPoint | Diagrams, DAX explanation, and presentation |
| **Design** | Figma |Dashboard layout design and user interface prototyping |
| **Version Control** | Git & GitHub | Project hosting, versioning, and collaboration |

---

**Supervisor:** Eng. Abdelrahman Ashour  
**Program:** Digital Egypt Pioneers Initiative (DEPI) — *Data Analytics - Microsoft Power BI Specialest Track*
