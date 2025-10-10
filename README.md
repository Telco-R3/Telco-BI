## 🧩 Customer Churn Analysis Project
Power BI | Data Analytics | Customer Insights

🚀 Project Overview:
This project analyzes customer churn behavior to identify key drivers behind customer attrition and uncover actionable insights to help the company reduce churn rate, improve customer experience, and increase revenue retention.

Data was modeled into a Star Schema and visualized through an interactive Power BI Dashboard containing six analytical pages.

## Project Structure
```
Customer-Churn-Analysis/
│
├── data/
│   ├── data_set/           # Source datasets used for analysis
│   ├── docs/               # Documentation for the data warehouse
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
├── reports/
│   ├── Telco_Churn_Dashboard.pbix
│   ├── Presentation.pptx
│   ├── Business Scenario.pdf
│
├── scripts/
│   ├── DAX_measures.txt
│   ├── data_preparation_notebook.ipynb
│
├── visuals/
|   ├── bg.zip
│   ├── churn_analysis_page.png
│   ├── customer_demographics_page.png
│   ├── customer_segmentation_page.png 
│   ├── home_page.png
│   ├── icons.zip
│   ├── overview_page.png 
│   ├── service_usage_page.png
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

![Data Architecture](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/data_architecturee.png)
![Data Architecture](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/data_model.drawio.png)
![Data Architecture](https://github.com/Telco-R3/Telco-BI/blob/3b772f1147c653d022d5a474399ddc36662c5bdd/Customer-Churn-Analysis/data/docs/Data_flow_diagram.drawio.png)
---

## 📊 Dashboard Pages Overview

### 🏠 Home Page

The **Home Page** serves as the dashboard's main entry point and sets the visual tone for the entire report.  

![Home Page](https://github.com/Telco-R3/Telco-BI/blob/f07707c644c6be8c4a871ffcea43c4223b68db16/Customer-Churn-Analysis/Visuals/home_page.png)
--- 
### 📋 Overview Page
This page provides a comprehensive summary of the company’s performance and customer churn metrics.  
It highlights key business indicators such as:
- **Total Customers:** 7,043  
- **Monthly Revenue:** $456K  
- **Active Customers:** 5,174  
- **Churned Customers:** 1,869 (representing a **27% churn rate**)  

Additional insights include:
- **Customer Distribution by Contract Type:** The majority of customers have **month-to-month contracts**, which show the highest churn rate.  
- **Customer Tenure Analysis:** Most churn occurs among customers with shorter tenures, especially within the first few months.  
- **Top 10 Cities by Churn:** Identifies the regions with the highest customer loss, providing geographic insights for targeted retention strategies.  

![Overview Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/overview_page.png)

---
### 📉 Churn Analysis

This page provides an in-depth overview of churn performance and its financial impact on the business.  
It focuses on identifying churn trends, revenue loss, and customer behavior.

**Key Highlights:**
- **Churned Customers:** 1,869  
- **Churned Revenue:** $3M  
- **Total Revenue:** $16M  
- **Average Tenure:** 32 months  
- **Customer Churn Rate:** 27%  

**Insights:**
- Most churned customers are on **Month-to-Month** contracts, indicating higher volatility compared to long-term customers.  
- Top churn reasons include poor service experience and competitor offers with better value or device quality.  
- A **Sankey diagram** visualizes churn flow across multiple dimensions such as **Contract Type**, **Payment Method**, **Gender**, and **City**, revealing which customer profiles are most prone to churn.

![Churn Analysis Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/churn_analysis_page.png)

---
### 👥 Customer Segmentation Page

This page segments customers based on their overall value and behavior to support targeted retention and marketing strategies.

**Key Highlights:**
- **High-Value Customers:** 18%  
- **Mid-Value Customers:** 28%  
- **Low-Value Customers:** 54%  
- **Highest Churn Rate:** Observed in the **Low-Value Segment (49%)**  
- **Revenue Contribution:** The **High-Value Segment** contributes the largest share of total revenue despite being the smallest group.

**Insights:**
- Visual comparisons between **Customer Count** and **Total Revenue** reveal imbalances that highlight opportunities for customer retention.  
- The **Churn Rate by Segment** chart identifies where to focus efforts to reduce attrition and increase profitability.  

![Customer Segmentation Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/customer_segmentation_page.png)
---
### ⚙️ Service Usage

This page focuses on analyzing **service usage patterns** and their correlation with customer churn.  
It presents key metrics such as:
- **Overall Churn Rate:** 27%  
- **Streaming Service Usage:** 75%  
- **Internet Service Adoption:** 99%  
- **Online Security Subscription:** 50%  
- **Tech Support Utilization:** 50%  

Detailed analysis shows that:
- Customers **without online security or tech support** have significantly higher churn rates.  
- **Fiber optic users** experience a higher churn rate (42%) compared to **DSL users** (19%).  
- There’s a strong relationship between **service engagement** and **customer retention**, indicating that value-added services reduce churn risk.  

![Service Usage Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/Service_Usage_Page.png)

---

### 🌍 Customer Demographics Page 

This section explores the demographic composition of telecom customers to understand their characteristics and how these influence churn.

**Key Metrics:**
- **Total Customers:** 7,043  
- **Average CLTV (Customer Lifetime Value):** $2,280  
- **Dependents:** 23%  
- **Customers with Partners:** 66%  
- **Senior Citizens:** 16%  

**Insights:**
- Gender distribution is nearly balanced (3.6K male vs. 3.5K female).  
- The majority of customers are **non-senior citizens** without dependents — suggesting a younger, more independent customer base.  
- Customers with partners make up two-thirds of the population, representing strong potential for bundled plans or family offers.

![Customer Demographics Page](https://github.com/Telco-R3/Telco-BI/blob/7dadb7ab704c69d1950c41bdcb71265483b1563c/Customer-Churn-Analysis/Visuals/customer_demographics_page.png)

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


## 🛠️ Tools & Technologies  

The project was developed using the following tools and technologies:

| Tool | Purpose |
|------|----------|
| **Microsoft SQL Server Management Studio (SSMS)** | Data extraction, cleaning, and transformation (ETL) |
| **Power BI** | Data modeling, DAX calculations, and dashboard visualization |
| **Figma** | Dashboard layout design and user interface prototyping |
| **Microsoft PowerPoint** | Presentation of findings and business recommendations |
| **Microsoft Word** | Documentation and business scenario report |

---

### 🧩 Team Members
- Esraa Soliman Mubarak  
- Ahmed Anwer Fath  
- Tasneem Shaaban Attia  
- Ibrahim Saeed Mohamed  
- Muhannad Mahfouz Muhammad  

**Supervisor:** Eng. Abdelrahman Ashour  
**Program:** Digital Egypt Pioneers Initiative (DEPI) — *Data Analytics Track*
