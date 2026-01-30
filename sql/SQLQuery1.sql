USE BankLoanDB;
--calcuate 
--Loan Applications
--total loan applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan;
-- MTD loan applications
SELECT COUNT(id) AS Total_Applications_MTD FROM financial_loan
WHERE MONTH(issue_date) = 12;
--PMTD Loan applications(Previous Month to date)
SELECT COUNT(id) AS Total_Applications_PMTD FROM financial_loan
WHERE MONTH(issue_date) = 11;

--Funded Amount
-- Total Loan Applications
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
--MTD 
SELECT SUM(loan_amount) AS Total_funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12;
--PMTD
SELECT SUM(loan_amount) AS Total_funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 11;

--Amount Received
--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
--MTD
SELECT SUM(total_payment) AS Total_Amount_CollectedMTD FROM financial_loan
WHERE MONTH(issue_date) = 12;
--PMTD
SELECT SUM(total_payment) AS Total_Amount_CollectedMTD FROM financial_loan
WHERE MONTH(issue_date) = 11;

--Interest Rate
--Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_loan;
--MTD Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date)=12;
--PMTD
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date)=11;

--DTI(debt to income ratios)
--Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan;
--MTD
SELECT AVG(dti)*100 AS MTD_AVG_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12;
--PMTD
SELECT AVG(dti)*100 AS MTD_AVG_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11;

--Good loan issued
--Percentage of Good Loan
SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0)/COUNT(id) AS Good_Loan_Percentage
FROM financial_loan;
--Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
--Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received 
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

--Bad Loan Issued
--Bad Loan Percentage
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)/COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan
--Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'
--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_loan_funded_amount
FROM financial_loan
WHERE loan_status = 'Charged Off'
--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received 
from financial_loan
WHERE loan_status = 'Charged Off'

--Loan Status
SELECT loan_status,
	COUNT(id) AS Total_Amount_Received,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate *100) AS Interest_Rate,
	AVG(dti*100) AS DTI
FROM financial_loan
GROUP BY loan_status;
--MTD
SELECT loan_status,
	COUNT(id) AS Total_Amount_Received,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate *100) AS Interest_Rate,
	AVG(dti*100) AS DTI
FROM financial_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;

--OverView
--Monthly
SELECT 
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);

--State
SELECT 
	address_state AS State,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;

--TERM
SELECT 
	term AS Term,
	COUNT(id) AS Total_Loan_Applcations,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

--EMPLOYEE LENGTH
SELECT
	emp_length AS Employee_Length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;

--Purpose
SELECT purpose AS PURPOSE,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose;

--Home Ownership
SELECT home_ownership AS Home_Ownership,
	COUNT(id) AS Total_Loan_applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;










