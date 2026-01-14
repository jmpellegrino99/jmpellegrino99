DROP TABLE IF EXISTS "checking";
CREATE TABLE IF NOT EXISTS "checking"(
	"cust_id" TEXT,
	"state" TEXT,
	"checking" REAL,
	"savings" REAL,
	"primacy" INTEGER
	);

DROP TABLE IF EXISTS "mortgage";
CREATE TABLE IF NOT EXISTS "mortgage"(
	"cust_id" TEXT,
	"term" INTEGER,
	"amount" REAL,
	"apy" REAL
	);

.mode csv
.import checking.csv checking
.import mortgage.csv mortgage

DELETE FROM checking WHERE rowid = 1;
DELETE FROM mortgage WHERE rowid = 1;

UPDATE checking SET savings = NULL where savings = "";


--Checking:
SELECT "How many rows are in checking?";
SELECT COUNT(*) FROM checking;

SELECT "Is checking unique at the level of cust_id?";
SELECT cust_id, COUNT(*) num FROM checking GROUP BY 1 HAVING num > 1;

SELECT "What is the sum of checking and savings balances in this table, resp.?";
SELECT sum(checking), sum(savings) FROM checking;

SELECT "For how many customers in this table is it the case that savings is NULL?";
SELECT count(*) from checking where savings is null;

SELECT "How many distinct states are represented in this table?";
SELECT DISTINCT state FROM checking;

SELECT "How often does each state appear?";
SELECT state, count(*) num FROM checking GROUP BY state ORDER BY 2 desc;

SELECT "Is checking balance affected by geography?";
SELECT state, ROUND(AVG(checking),2) avg_checking FROM checking GROUP BY 1 ORDER BY 2 desc;


--Mortgage:
SELECT "How many rows are in mortgage?";
SELECT COUNT(*) FROM mortgage;

SELECT "Is mortgage unique at the level of cust_id?";
SELECT cust_id, COUNT(*) num FROM mortgage GROUP BY 1 HAVING num > 1;

SELECT "How frequently does each term appear?";
SELECT term, COUNT(*) num FROM mortgage GROUP BY 1 ORDER BY num desc;

SELECT "Does average APY differ according to term?";
SELECT term, ROUND(AVG(apy),2) FROM mortgage GROUP BY 1 ORDER BY 1 asc;


--Joins:
SELECT "How many IDs that are in mortgage are also in checking?";
SELECT COUNT(*) FROM mortgage WHERE cust_id IN (SELECT cust_id FROM checking);

SELECT "Do different states have different APYs?";
SELECT
checking.state
, ROUND(AVG(mortgage.apy),2) avg_apy
FROM checking
INNER JOIN mortgage
	ON checking.cust_id = mortgage.cust_id
GROUP BY checking.state
ORDER BY 2 desc
;

SELECT "Does APY vary by primacy status?";
SELECT
checking.primacy
, ROUND(AVG(mortgage.apy),2) avg_apy
FROM checking
INNER JOIN mortgage
	ON checking.cust_id = mortgage.cust_id
GROUP BY checking.primacy
ORDER BY 2 desc
;
