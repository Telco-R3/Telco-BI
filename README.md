🧩 Customer Churn Analysis Project
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
│   ├── scripts/          ← Data WareHouse
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

![Data Architecture](data/docs/data_architecturee.png)


---

## 📊 Dashboard Pages Overview

### 🏠 Home Page
Provides an overview of key metrics and navigation to all dashboards.  
![Home Page](Visuals/home_page.png)

### 📋 Overview
Shows general KPIs like total customers, churn rate, revenue, and CLTV trends.  
![Overview Page](Telco-BI\Customer-Churn-Analysis\data\docs\data_architecturee.png)

### 📉 Churn Analysis
Visualizes churn distribution, key churn drivers, and churn trends across customer types.  
![Churn Analysis Page](Visuals/churn_analysis_page.png)

### 👥 Customer Segmentation
Groups customers into segments (High, Mid, Low Value) based on CLTV and behavior.  
![Customer Segmentation Page](Visuals/customer_segmentation_page.png)

### ⚙️ Service Usage
Analyzes service types, internet usage, and support correlations with churn rate.  
![Service Usage Page](Visuals/service_usage_page.png)

### 🌍 Customer Demographics
Shows customer distribution by gender, seniority, dependents, and geographic location.  
![Customer Demographics Page](Visuals/customer_demographics_page.png)

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

## 🧠 Key Insights
- Fiber users have the **highest churn rate** due to pricing issues.  
- Customers with **monthly contracts** are more likely to churn.  
- Senior citizens and single users show **higher churn tendencies**.  
- Improved **technical support** could significantly reduce churn.  
- Incentivizing **contract upgrades** increases retention and lifetime value.

---

✅ **Tip:**  
احرصي إن الصورة `data_architecture.png` تكون موجودة في فولدر  
`Visuals/` بنفس الاسم بالضبط علشان تظهر على GitHub.

---

هل تحبي أظبطلك نفس المحتوى ده في ملف `README.md` جاهز كود عشان تنسخيه مباشرة؟


| Dashboard Page | Preview |
|----------------|----------|
| 🏠 **Home** | ![Home](Visuals/home_page.png) |
| 📈 **Overview** | ![Overview](Visuals/overview_page.png) |
| 💔 **Churn Analysis** | ![Churn](Visuals/churn_analysis_page.png) |
| 👥 **Customer Segmentation** | ![Segmentation](Visuals/customer_segmentation_page.png) |
| 🌐 **Service Usage** | ![Service](Visuals/service_usage_page.png) |
| 🧑‍🤝‍🧑 **Customer Demographics** | ![Demographics](Visuals/customer_demographics_page.png) |


## 📊 Analytical KPIs Summary

This project’s DAX measures focus on analyzing customer churn, revenue loss, and behavioral patterns.

- **Retention Metrics:** `Churn Rate %`, `Active Customers`, `Average Tenure`
- **Revenue Metrics:** `MRR`, `Total Revenue`, `Churned Revenue`, `ARPU`
- **Customer Value Segmentation:** `Average CLTV`, `High/Low/Mid Value Customers %`
- **Demographics & Services:** `Partner %`, `Dependents %`, `Senior Citizen %`, `Internet Service %`, `Tech Support %`, `Streaming %`
- **Goal:** Provide actionable insights for **reducing churn** and **maximizing customer lifetime value**.







# Telco BI – Customer Churn & Retention Dashboard
Interactive Power BI dashboard analyzing telecom customer churn &amp; retention. Provides insights on behavior, contracts, tenure &amp; revenue to help reduce churn. Built as a graduation project for Microsoft Power BI Specialist Track under DEPI.

## Project Files
[Google Drive Folder](https://drive.google.com/drive/folders/1170s0DJj1R7SonS9M5dmE-gKqDE6HC62)

### Key Metrics
- **Churn Rate** – Percentage of customers leaving over time.  
- **ARPU (Average Revenue per User)** – Revenue trends by customer segments.  
- **Tenure & Contract Analysis** – Impact of subscription length and contract type on churn.  
- **Add-ons & Services Impact** – How extra services affect retention.  

### Features
- Multiple interactive pages (Overview, Drivers, and Actionable Insights).  
- DAX measures for advanced KPI calculations.  
- Visual storytelling to support business decision-making.  

### Tech Stack
- **Power BI** – Data modeling, DAX, dashboard design.  
- **Excel / CSV** – Data preprocessing and cleaning.  

---

## Team Members
- Esraa Soliman Mubarak  
- Tasneem Shaaban Attia 
- Ahmed Anwer Fath 
- Muhannad Mahfouz Muhammad
- Ibrahim Saeed Mohamed

---

## Program
This project was developed as a **Graduation Project for the Microsoft Power BI Specialist Track under the Digital Egypt Pioneers Initiative (DEPI)**.
