select * from finance1;
select * from finance2;
#1 year wise loan amount stat
SELECT 
    YEAR(issue_d) AS loan_year,
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS avg_loan_amount
FROM
    finance1
GROUP BY YEAR(issue_d)
ORDER BY loan_year;    

#2
#Grade and sub grade wise revol_bal
SELECT 
    f1.grade, f1.sub_grade, SUM(f2.revol_bal) AS revol_bal
FROM
    finance1 f1
        JOIN
    finance2 f2 ON f1.id = f2.id
GROUP BY 1 , 2;

#3
#Total Payment for Verified Status Vs Total Payment for Non Verified Status
select * from finance1;
select * from finance2;

SELECT 
    f1.verification_status,
    CONCAT(ROUND(SUM(f2.total_pymnt) / 1000000, 2),
            'M') AS total_payment_million
FROM
    finance1 f1
        JOIN
    finance2 f2 ON f1.id = f2.id
GROUP BY f1.verification_status;


#4
#State wise and month wise loan status
select * from finance1;
select * from finance2;
select    
addr_state,
    MONTH(issue_d) AS loan_month,
    loan_status,
    COUNT(*) AS loan_count
FROM finance1
GROUP BY addr_state, MONTH(issue_d), loan_status
ORDER BY addr_state, loan_month;    

desc finance1;


#5
#Home ownership Vs last payment date stats
SELECT 
    f1.home_ownership, count(f2.last_pymnt_d) AS cnt
FROM
    finance1 f1
        JOIN
    finance2 f2 ON f1.id = f2.id
GROUP BY f1.home_ownership;


-- some extra query
#
SELECT 
    grade, COUNT(*) AS loan_count
FROM
    finance1
GROUP BY grade
HAVING COUNT(*) > 100;

#
SELECT 
    verification_status, COUNT(*) AS total_loans
FROM
    finance1
GROUP BY verification_status;

#Count fully paid vs charged off loans
SELECT 
    loan_status, COUNT(*) AS loan_count
FROM
    finance1
WHERE loan_status IN ('Fully Paid' , 'Charged Off')
GROUP BY loan_status;

#Find loans issued in  year
SELECT 
    id, issue_d
FROM
    finance1
WHERE
    issue_d LIKE '%2009%'
        OR issue_d LIKE '%2006%';

#Find total loan amount for those values
SELECT 
    SUM(loan_amnt) AS total_loan
FROM
    finance1
WHERE
    loan_amnt IN (5000 , 10000, 15000);

#
SELECT 
    AVG(loan_amnt) AS total_loan
FROM
    finance1
WHERE
    loan_amnt IN (5000 , 10000, 15000) ;


#Find customers whose loan amount is higher than the overall average loan amount.
SELECT 
    id, loan_amnt
FROM
    finance1
WHERE
    loan_amnt > (SELECT 
            AVG(loan_amnt)
        FROM
            finance1);

#Find grade-wise average loan amount and filter only grades whose average loan is above ₹15,000.
WITH grade_avg AS (
    SELECT
        grade,
        AVG(loan_amnt) AS avg_loan_amount
    FROM finance1
    GROUP BY grade
)
SELECT grade,avg_loan_amount
FROM grade_avg
WHERE avg_loan_amount > 15000;

#Find customers who defaulted loan_status = 'Charged Off' and had revolving balance above average.
WITH avg_revol AS (
    SELECT AVG(revol_bal) AS avg_revol_bal
    FROM finance2
)
SELECT
    f1.id,
    f1.loan_status,
    f2.revol_bal
FROM finance1 f1
JOIN finance2 f2
    ON f1.id = f2.id
WHERE f1.loan_status = 'Charged Off'
  AND f2.revol_bal >
      (SELECT  AVG(revol_bal) FROM finance2);

#Rank customers by total payment within each loan grade.
WITH payment_data AS (
    SELECT
        f1.id,
        f1.grade,
        f2.total_pymnt
    FROM finance1 f1
    JOIN finance2 f2
        ON f1.id = f2.id
)
SELECT
    id,
    grade,
    ROUND(total_pymnt, 2) AS total_pymnt,
    DENSE_RANK() OVER (PARTITION BY grade ORDER BY total_pymnt DESC) AS payment_rank
FROM payment_data;

