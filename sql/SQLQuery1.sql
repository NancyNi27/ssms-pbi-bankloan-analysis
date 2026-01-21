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