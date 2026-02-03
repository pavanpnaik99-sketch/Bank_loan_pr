# Loan Data Analysis & Dashboard Project (SQL + Tableau)

## 📌 Project Overview
This project is an **end-to-end loan data analysis** using **SQL for data exploration and business logic** and **Tableau for visualization and insights**.

The goal is to:
- Analyze loan trends, risk indicators, and repayment behavior
- Identify patterns across time, geography, and borrower profiles
- Present insights through an interactive dashboard

This project is suitable for **Data Analyst / Business Analyst / SQL roles**.

---

## 🗂️ Dataset Description

The analysis is based on two relational tables:

### 1️⃣ finance1 (Loan & Borrower Details)
Contains loan application–level information:
- `id` (Primary Key)
- `loan_amnt`
- `issue_d`
- `grade`, `sub_grade`
- `loan_status`
- `verification_status`
- `home_ownership`
- `addr_state`

---

### 2️⃣ finance2 (Payment & Credit Behavior)
Contains repayment and revolving credit information:
- `id` (Foreign Key)
- `total_pymnt`
- `revol_bal`
- `last_pymnt_d`

Both tables are joined using `id`.

---

## 🔍 SQL Analysis

### 1️⃣ Year-wise Loan Statistics
**Metrics:**
- Total loans issued
- Total loan amount
- Average loan amount

**Purpose:**  
Identify growth trends and lending behavior over time.

---

### 2️⃣ Grade & Sub-grade wise Revolving Balance
**Logic:**  
Join `finance1` and `finance2` and aggregate revolving balance.

**Insight:**  
Higher revolving balances in lower grades may indicate elevated credit risk.

---

### 3️⃣ Verified vs Non-Verified Borrowers – Total Payments
**Output:**  
Total payment displayed in **millions (M)** for clarity.

**Insight:**  
Shows whether borrower verification correlates with repayment performance.

---

### 4️⃣ State-wise & Month-wise Loan Status
**Dimensions:**
- State
- Issue month
- Loan status

**Use Case:**  
Geographic and seasonal analysis of loan outcomes.

---

### 5️⃣ Home Ownership vs Repayment Activity
**Metric:**  
Count of last payment dates by home ownership type.

**Insight:**  
Evaluates whether asset ownership impacts repayment consistency.

---

## 📊 Advanced & Analytical SQL Queries

- Grade-wise loan count using `HAVING`
- Verification status distribution
- Fully Paid vs Charged Off loan comparison
- Loans issued in specific years
- Loan amount analysis using `IN`
- Loans above overall average (subquery)
- Grade-wise average loan using CTE
- Charged-off loans with above-average revolving balance
- Customer ranking within grades using `DENSE_RANK()`

---

## 🛠️ SQL Concepts Used
- Aggregations (`SUM`, `AVG`, `COUNT`)
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Grouping & filtering
- Date-based analysis

---

## 📈 Tableau Dashboard

### 📊 Dashboard File
- **File:** `bank_projec_dashboard.twbx`

### Dashboard Features
The Tableau dashboard visualizes:
- Year-wise loan trends
- Loan distribution by grade and sub-grade
- Verified vs non-verified payment comparison
- State-wise loan status breakdown
- Risk indicators based on loan status and revolving balance

### Purpose of Dashboard
- Convert SQL insights into **visual, decision-friendly format**
- Enable **quick comparison and trend identification**
- Support business stakeholders with **interactive analysis**

---

## 🔄 SQL → Tableau Workflow
1. Load raw loan data into SQL
2. Perform joins, aggregations, and risk analysis using SQL
3. Validate results and extract structured outputs
4. Build Tableau dashboard using cleaned & analyzed data
5. Present insights visually for business interpretation

---

## 🎯 Skills Demonstrated
- SQL data analysis & optimization thinking
- Financial & risk-based analysis
- Business-focused querying
- Tableau dashboard design
- End-to-end analytics workflow

---

## ✅ Conclusion
This project demonstrates a **complete analytics pipeline**:
- Raw data → SQL logic → business insights → visual storytelling

It reflects real-world data analyst work and is suitable for:
- Portfolio projects
- Interviews
- Case study discussions

## Dashboard Preview

![Dashboard](https://github.com/pavanpnaik99-sketch/Bank_loan_pr/blob/main/Bank_loan_Dashboard.png)

