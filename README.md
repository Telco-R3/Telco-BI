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
│   ├── data_set/              ← Raw Data
│   ├── docs/          ← Documentation
│   ├── scripts/          ← Data Warehouse
│
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
---
Teleco Customer Churn Analysis dashboards.
---
![Home Page](https://github.com/Telco-R3/Telco-BI/blob/f07707c644c6be8c4a871ffcea43c4223b68db16/Customer-Churn-Analysis/Visuals/home_page.png)

### 📋 Overview
---
Summarizes the company’s customer base and churn performance with high-level KPIs, churn rate trends, and financial impact.
---
![Overview Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/overview_page.png)

### 📉 Churn Analysis
---
Visualizes churn distribution, key churn drivers, and churn trends across customer types.
---
![Churn Analysis Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/churn_analysis_page.png)

### 👥 Customer Segmentation
---
Group customers into segments (High, Mid, Low Value) based on CLTV and behavior.
---
![Customer Segmentation Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/customer_segmentation_page.png)

### ⚙️ Service Usage
---
Analyzes service types, internet usage, and support correlations with churn rate.
---
![Service Usage Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/churn_analysis_page.png)

### 🌍 Customer Demographics
---
Shows customer distribution by gender, seniority, dependents, and geographic location.
---
![Customer Demographics Page](https://github.com/Telco-R3/Telco-BI/blob/0778fc94e7361e08e3c9e9904a5971c5de84db6a/Customer-Churn-Analysis/Visuals/customer_segmentation_page.png)

---

## 👩‍💻 Project Team

| Name | Role | Contribution |
|------|------|---------------|
| **Esraa Soliman Mubarak** | Data Analyst | Dashboard development, insights extraction, and report design |
| **Ahmed Anwer Fath** | Data Engineer | Data pipeline, data warehouse design, and data model preparation |
| **Tasneem Shaaban Attia** | Presenter | Presentation and storytelling |
| **Ibrahim Saeed Mohamed** | BI Developer | Dashboard implementation and data visualization |
| **Muhannad Mahfouz Muhammad** | UI Designer | Dashboard layout and visual design |

---

## Team Members
- Esraa Soliman Mubarak  
- Tasneem Shaaban Attia 
- Ahmed Anwer Fath 
- Muhannad Mahfouz Muhammad
- Ibrahim Saeed Mohamed
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

## Program
This project was developed as a **Graduation Project for the Microsoft Power BI Specialist Track under the Digital Egypt Pioneers Initiative (DEPI)**.
