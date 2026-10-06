CREATE DATABASE hr_analytics;
USE hr_analytics;
CREATE TABLE employees (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
-- Phase 1 -Data Quality
-- How many employees are in the dataset?
SELECT 
    COUNT(*) AS total_employees
FROM
    employees;

--   Are there duplicate employees?
SELECT 
    EmployeeNumber, COUNT(*) employee_count
FROM
    employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- check for missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(Age) AS age_present,
    COUNT(Attrition) AS attrition_present,
    COUNT(EmployeeNumber) AS employee_number_present
FROM employees;

-- What are the possible Attrition values?
SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Attrition;-- yes-employee left,no-employee stayed

-- phase-2 Overall Attrition
-- What is the overall employee attrition rate?
/*Attrition Rate =
Employees who left
------------------ × 100
Total employees*/
SELECT 
    ROUND(SUM(CASE
                WHEN Attrition = 'yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees;

-- Which department has the highest attrition rate?
SELECT 
    Department,
    COUNT(*) AS total_employee,
    SUM(CASE
        WHEN Attrition = 'yes' THEN 1
        ELSE 0
    END) AS employee_left,
    ROUND(SUM(CASE
                WHEN Attrition = 'yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS attrition_rate
FROM
    employees
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Which job roles have the highest attrition rate?
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Does overtime affect employee attrition?
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;

SELECT
    MIN(MonthlyIncome) AS minimum_income,
    MAX(MonthlyIncome) AS maximum_income,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM employees;

-- Does monthly income affect employee attrition?
SELECT
    CASE
        WHEN MonthlyIncome <= 7000 THEN 'Low Income'
        WHEN MonthlyIncome <= 13000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_left,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY income_group
ORDER BY attrition_rate DESC;

-- Does the number of years an employee has worked at the company affect attrition?
SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS experience_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY experience_group
ORDER BY attrition_rate DESC;

-- Does job satisfaction affect employee attrition?
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Does work-life balance affect employee attrition?
SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Does business travel affect employee attrition?
SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;

-- Does age affect employee attrition?
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;

-- Does job involvement affect employee attrition?
SELECT
    JobInvolvement,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobInvolvement
ORDER BY JobInvolvement;

-- Which employee groups are at the highest risk of attrition?
SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    YearsAtCompany,
    (
        CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END
        +
        CASE WHEN MonthlyIncome <= 7000 THEN 1 ELSE 0 END
        +
        CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END
        +
        CASE WHEN YearsAtCompany <= 2 THEN 1 ELSE 0 END
    ) AS risk_score
FROM employees
WHERE Attrition = 'No'
ORDER BY risk_score DESC;