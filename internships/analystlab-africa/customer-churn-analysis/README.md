# Customer Churn Analysis Using Python

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-green)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-orange)
![Seaborn](https://img.shields.io/badge/Seaborn-Visualization-lightblue)
![Status](https://img.shields.io/badge/Project-Completed-success)

## 📌 Project Overview

Customer churn is an important business challenge for subscription-based companies because losing customers can reduce recurring revenue and increase customer acquisition costs.

This project analyses the **Telco Customer Churn dataset** using Python to identify customer segments associated with higher churn and develop data-driven recommendations for improving customer retention.

The project covers the analytical process from dataset inspection and cleaning to exploratory data analysis and business recommendations.

---

## 🎯 Business Problem

The company needs to understand which customer characteristics and behaviours are associated with churn.

Without identifying high-risk customer segments, management may find it difficult to develop targeted and effective retention strategies.

---

## ❓ Business Questions

The analysis answers the following questions:

1. What does the customer base look like?
2. Which segments have the highest churn?
3. Does contract type influence retention?
4. Does tenure affect loyalty?
5. Which services influence churn?
6. Which payment methods have higher churn?
7. What actions should management take?

---

## 📊 Dataset

The Telco Customer Churn dataset contains:

- **7,043 customer records**
- **21 variables**
- **Target variable:** Churn

The dataset includes information about:

- Customer demographics
- Tenure
- Contract type
- Internet service
- Online security
- Tech support
- Online backup
- Device protection
- Payment method
- Monthly charges
- Total charges
- Churn status

---

## 🛠️ Tools & Technologies

- **Python**
- **Pandas** – Data manipulation and analysis
- **NumPy** – Numerical operations
- **Matplotlib** – Data visualization
- **Seaborn** – Statistical visualization
- **Jupyter Notebook** – Analysis environment
- **GitHub** – Project documentation and version control

---

## 🔍 Data Preparation

The dataset was inspected and prepared before performing the analysis.

Key steps included:

- Inspecting the dataset structure
- Checking data types
- Checking missing values
- Checking duplicate records
- Converting `TotalCharges` to a numeric data type
- Handling invalid records
- Resetting the DataFrame index
- Validating numerical and categorical variables

---

## 📈 Exploratory Data Analysis

The analysis included the following visualisations:

### Customer Analysis

- Customer Tenure Distribution
- Monthly Charges Distribution
- Monthly Charges by Churn
- Correlation Heatmap

### Service Analysis

- Internet Service
- Online Security
- Tech Support
- Online Backup
- Device Protection

### Churn Analysis

- Churn by Tenure
- Churn by Contract
- Churn by Payment Method

---
## 💡 Key Findings

### 1. Contract Type

Month-to-Month customers recorded the highest churn rate at **42.7%**, compared with **11.3%** for One-Year contracts and **2.8%** for Two-Year contracts.

This indicates a strong association between contract duration and customer retention.

![Churn by Contract Type](screenshots/churn-by-contract.png)

---

### 2. Payment Method

Customers using **Electronic Check** recorded the highest churn rate among payment methods at **45.3%**.

Other payment methods had considerably lower churn rates:

- Bank transfer (automatic): **16.7%**
- Credit card (automatic): **15.2%**
- Mailed check: **19.1%**

![Churn by Payment Method](screenshots/churn-by-payment-method.png)

---

### 3. Internet Service

**Fiber Optic** customers recorded the highest churn rate among internet service categories at **41.9%**.

For comparison:

- DSL: **19.0%**
- No internet service: **7.4%**

This identifies Fiber Optic customers as an important segment for further investigation.

![Churn by Internet Service](screenshots/internet-service.png)

---

### 4. Value-Added Services

Customers without value-added services consistently recorded higher churn rates than customers who subscribed to them.

| Service | Without Service | With Service |
|---|---:|---:|
| Online Security | **41.8%** | **14.6%** |
| Tech Support | **41.6%** | **15.2%** |
| Online Backup | **39.9%** | **21.5%** |
| Device Protection | **39.1%** | **22.5%** |

![Churn by Online Security](screenshots/online-security.png)

![Churn by Tech Support](screenshots/tech-support.png)

![Churn by Online Backup](screenshots/online-backup.png)

![Churn by Device Protection](screenshots/device-protection.png)

These results show a consistent association between subscription to value-added services and lower churn.

The analysis does not establish that these services directly cause customers to stay.

---

### 5. Customer Tenure

**30.9% of customers have been with the company for less than 12 months**, making early-tenure customers an important segment for retention analysis.

Churn was more concentrated among customers with shorter tenures, while longer-tenured customers were more likely to remain with the company.

![Customer Tenure Distribution](screenshots/customer-tenure-distribution.png)

![Churn by Tenure](screenshots/churn-by-tenure.png)

---

## 📁 Project Structure

```text
```text
customer-churn-analysis/
│
├── README.md
│
├── dataset/
│   └── telco_customer_churn.csv
│
├── notebook/
│   └── customer_churn_analysis.ipynb
│
├── reports/
│   ├── business_understanding_report.pdf
│   └── dataset_inspection_report.pdf
│
├── presentation/
│   └── customer_churn_analysis.pptx
│
└── screenshots/
    ├── churn-by-contract.png
    ├── churn-by-payment-method.png
    ├── customer-tenure-distribution.png
    ├── monthly-charges-distribution.png
    ├── monthly-charges-by-churn.png
    ├── correlation-heatmap.png
    ├── internet-service.png
    ├── online-security.png
    ├── tech-support.png
    ├── online-backup.png
    ├── device-protection.png
    └── churn-by-tenure.png


---

## 👨‍💻 Author

**Hudu Yusuf Ibrahim**

**Data Analyst Intern | AnalystLab Africa**

Aspiring Data Analyst with experience in Python, SQL, Excel, Power BI, and Tableau, focused on transforming data into actionable business insights.

### 🔗 Connect With Me

- [GitHub](https://github.com/01Yusufh)
- [LinkedIn](https://www.linkedin.com/in/hudu-yusuf-ibrahim-ba06b5365)
