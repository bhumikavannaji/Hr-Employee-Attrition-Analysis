# HR Employee Attrition Analysis

## 📌 Project Overview

Employee attrition is a major challenge for organizations because high employee turnover can increase recruitment costs, reduce productivity, and affect overall business performance.

This project analyzes employee attrition using **MySQL and Power BI** to identify patterns and employee groups associated with higher attrition.

The project covers the complete data analytics workflow, including:

- Data cleaning and preparation
- SQL-based data validation and analysis
- Attrition analysis
- KPI development
- Interactive Power BI dashboard
- Business insights
- HR recommendations

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Analyze overall employee attrition
- Calculate the employee attrition rate
- Identify attrition patterns across departments
- Analyze attrition by gender
- Understand the relationship between overtime and attrition
- Analyze attrition based on business travel frequency
- Examine attrition across job roles and job satisfaction levels
- Understand attrition patterns based on total working years
- Provide data-driven recommendations for HR decision-making

---

## 📊 Dataset

The project uses the **IBM HR Analytics Employee Attrition & Performance dataset**.

The dataset contains employee-level information such as:

- Age
- Attrition
- Business Travel
- Department
- Distance From Home
- Education
- Gender
- Job Level
- Job Role
- Job Satisfaction
- Monthly Income
- OverTime
- Total Working Years
- Years at Company
- Years in Current Role
- Years Since Last Promotion
- Years With Current Manager
- Work-Life Balance
- And other employee-related attributes

---

## 🧹 Data Cleaning

The raw employee dataset was imported into **MySQL** for data preparation and analysis.

Data cleaning and validation included:

- Checking total employee records
- Checking duplicate Employee Numbers
- Validating employee identifiers
- Reviewing categorical values
- Checking attrition categories
- Cleaning and preparing the dataset for analysis
- Correcting data inconsistencies, including standardizing **Bangalore to Bengaluru**

The cleaned data was then used for SQL analysis and Power BI visualization.

---

## 🗄️ SQL Analysis

MySQL was used to validate the dataset and perform employee attrition analysis.

Key SQL analysis included:

- Total employee count
- Duplicate employee check
- Attrition count
- Active employee count
- Attrition rate
- Department-wise attrition
- Attrition by gender
- Attrition by overtime
- Attrition by business travel
- Employee count by department
- Attrition by job role and job satisfaction

Example attrition rate calculation:

```sql
SELECT 
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) 
    AS Attrition_Rate
FROM employees;
```

---

## 📈 Power BI Dashboard

An interactive **HR Analytics Dashboard** was created using Microsoft Power BI.

### KPI Cards

- **Total Employees:** 1,470
- **Active Employees:** 1,233
- **Attrition Count:** 237
- **Attrition Rate:** 16.12%
- **Average Age:** 36.92
- **Average Working Years:** 7.01

### Dashboard Visualizations

- Employee Attrition by Department
- Attrition Count by Job Role & Job Satisfaction
- Attrition by Gender
- Attrition Rate by Business Travel
- Attrition Trend by Total Working Years
- Employee Count by Department
- Attrition Rate by Overtime
- Department slicer for interactive filtering

---

## 🔍 Key Findings

### 1. Overall Attrition

The organization has:

- **1,470 total employees**
- **237 employees who left**
- **1,233 active employees**
- **16.12% overall attrition rate**

This indicates that employee retention is an important area for HR management.

---

### 2. Attrition by Department

Among employees who left:

| Department | Attrition Count | Share of Attrition |
|---|---:|---:|
| Research & Development | 133 | 56% |
| Sales | 92 | 39% |
| Human Resources | 12 | 5% |

Research & Development has the highest number of employee exits, followed by Sales.

> Note: These percentages represent each department's share of the 237 attrition cases, not the department-specific attrition rate.

---

### 3. Attrition and Overtime

Employees working overtime show substantially higher attrition.

| OverTime | Attrition Rate |
|---|---:|
| Yes | 30.53% |
| No | 10.44% |

This suggests that workload and overtime may be important factors associated with employee turnover.

---

### 4. Attrition and Business Travel

Employees who travel frequently have the highest attrition rate.

| Business Travel | Attrition Rate |
|---|---:|
| Travel_Frequently | 24.91% |
| Travel_Rarely | 14.96% |
| Non-Travel | 8.00% |

This indicates that frequent business travel may be associated with increased employee attrition.

---

### 5. Attrition by Gender

Among the 237 employees who left:

- **Male:** 150 (63%)
- **Female:** 87 (37%)

Male employees account for a larger share of the observed attrition cases.

---

### 6. Attrition by Job Role and Job Satisfaction

The dashboard analyzes employee exits across different job roles and job satisfaction levels.

The analysis helps identify job roles and satisfaction levels where attrition is more concentrated and may require further HR attention.

---

## 💡 HR Recommendations

### 1. Review Overtime Policies

Employees working overtime have a much higher attrition rate.

Possible actions:

- Monitor excessive overtime
- Improve workload distribution
- Provide additional staffing when required
- Encourage better work-life balance

### 2. Focus on Frequent Travelers

Employees who travel frequently show the highest attrition rate.

Possible actions:

- Review travel schedules
- Provide better travel support
- Offer flexible working arrangements
- Monitor workload after frequent travel

### 3. Strengthen Retention Efforts

Research & Development and Sales account for the majority of attrition cases.

HR could further investigate:

- Compensation
- Career growth opportunities
- Workload
- Management practices
- Job satisfaction
- Employee engagement

### 4. Improve Career Development

Organizations can strengthen:

- Training opportunities
- Skill development
- Internal mobility
- Career progression
- Promotion opportunities

### 5. Monitor Employee Satisfaction

Regular monitoring of employee satisfaction can help identify potential retention risks and allow HR teams to take action earlier.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Data cleaning, validation and SQL analysis |
| **Power BI** | Interactive dashboard and data visualization |
| **DAX** | KPI and measure calculations |
| **CSV** | Data storage and preparation |
| **GitHub** | Project documentation and portfolio publishing |

---

## 📐 Key DAX Measure

### Attrition Rate %

```DAX
Attrition Rate % =
DIVIDE(
    [Attrition Count],
    [Total Employees],
    0
)
```

The measure was formatted as a percentage in Power BI.

---

## 📊 Dashboard Preview

![HR Analytics Dashboard](images/HR_Analytics_Dashboard.png)

---

## 📁 Project Structure

```text
Hr-Employee-Attrition-Analysis/
│
├── README.md
│
├── data/
│   └── employee_attrition_cleaned.csv
│
├── sql/
│   └── hr_attrition_analysis.sql
│
├── powerbi/
│   └── HR_Analytics_Dashboard.pbix
│
└── images/
    └── HR_Analytics_Dashboard.png
```

---

## 🚀 Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning & Validation
     ↓
MySQL Database
     ↓
SQL Analysis
     ↓
DAX Measures
     ↓
Power BI Dashboard
     ↓
Insights & Recommendations
```

---

## 📌 Business Impact

This analysis can help HR teams:

- Identify employee groups with higher attrition
- Understand potential factors associated with employee turnover
- Monitor overtime-related retention risks
- Identify departments requiring greater attention
- Improve employee engagement strategies
- Support data-driven workforce decisions

---

## 📚 Skills Demonstrated

This project demonstrates practical skills in:

- Data Cleaning
- Data Validation
- SQL
- MySQL
- Data Analysis
- DAX
- Power BI
- Data Visualization
- KPI Development
- Business Intelligence
- HR Analytics
- Business Insight Generation
- Data-Driven Recommendations

---

## 👩‍💻 About the Project

This project was created as a data analytics portfolio project to demonstrate the ability to transform employee data into meaningful business insights using **MySQL and Power BI**.

The project follows an end-to-end analytics workflow from data preparation and SQL analysis to dashboard development and business recommendations.
