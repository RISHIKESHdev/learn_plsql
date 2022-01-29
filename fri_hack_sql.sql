DROP TABLE Sales_Table;
DROP TABLE Exchange_Rate_Table;
CREATE TABLE Sales_Table(
salesDate DATE,
salesAmount INTEGER,
currency VARCHAR2(5));

CREATE TABLE Exchange_Rate_Table(
sourceCurrency VARCHAR2(5),
targetCurrency VARCHAR2(5),
exchangeRate DECIMAL(18,5),
effectiveStartDate DATE);

INSERT INTO Sales_Table VALUES 
(TO_DATE('01-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'),500,'INR');
INSERT INTO Sales_Table VALUES 
(TO_DATE('01-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'),100,'GBP');
INSERT INTO Sales_Table VALUES 
(TO_DATE('02-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'),1000,'INR');
INSERT INTO Sales_Table VALUES 
(TO_DATE('02-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'),150,'GBP');
INSERT INTO Sales_Table VALUES 
(TO_DATE('03-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'),1500,'INR');

INSERT INTO Exchange_Rate_Table VALUES 
('INR','USD',0.014,TO_DATE('31-DEC-15','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'));
INSERT INTO Exchange_Rate_Table VALUES 
('INR','USD',0.015,TO_DATE('02-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'));
INSERT INTO Exchange_Rate_Table VALUES 
('GBP','USD',1.32,TO_DATE('20-DEC-15','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'));
INSERT INTO Exchange_Rate_Table VALUES 
('GBP','USD',1.30,TO_DATE('01-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'));
INSERT INTO Exchange_Rate_Table VALUES 
('GBP','USD',1.35,TO_DATE('10-JAN-16','DD-MON-YY','NLS_DATE_LANGUAGE=AMERICAN'));

SELECT * FROM Sales_Table;
SELECT * FROM Exchange_Rate_Table;

SELECT salesdate,SUM(salesamount*exchangerate)AS ans FROM
exchange_rate_table 
,
(
 SELECT salesdate,salesamount,MAX(effectivestartdate) AS ESD 
 FROM(SELECT * FROM Sales_Table st JOIN exchange_rate_table et 
 ON(st.currency=et.sourceCurrency)
 WHERE(st.salesDate>=et.effectiveStartDate AND st.currency=et.sourceCurrency))
 GROUP BY salesdate,salesamount,currency,sourcecurrency,targetcurrency
)et 
WHERE(et.ESD=effectivestartdate)GROUP BY salesdate ORDER BY ans;

-- SELECT st.salesDate, SUM(st.salesAmount*et.exchangeRate) AS sat 
-- FROM Sales_Table st,exchange_rate_table et 
-- WHERE(st.salesDate>=et.effectiveStartDate AND st.currency=et.sourceCurrency) 
-- GROUP BY st.salesDate ORDER BY sat DESC;

-- SELECT salesdate,salesamount,currency,sourcecurrency,targetcurrency,MAX(effectivestartdate) AS ESD 
-- FROM(SELECT * FROM Sales_Table st JOIN exchange_rate_table et 
-- ON(st.currency=et.sourceCurrency)
-- WHERE(st.salesDate>=et.effectiveStartDate AND st.currency=et.sourceCurrency))
-- GROUP BY salesdate,salesamount,currency,sourcecurrency,targetcurrency;
