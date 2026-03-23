---Data extraction using SQL
CREATE TABLE EcommerceAnalytics_dat (
    Administrative INT,
    Administrative_Duration FLOAT,
    Informational INT,
    Informational_Duration FLOAT,
    ProductRelated INT,
    ProductRelated_Duration FLOAT,
    BounceRates FLOAT,
    ExitRates FLOAT,
    PageValues FLOAT,
    SpecialDay FLOAT,
    Month VARCHAR(10),
    OperatingSystems INT,
    Browser INT,
    VisitorType VARCHAR(30),
    Weekend VARCHAR(10),
    Revenue BIT
);
--Loading data using bulk insert
BULK INSERT EcommerceAnalytics_dat
FROM 'C:\\SQLData\\online_shopping.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
---Overview Page
--Viewing data
SELECT * FROM EcommerceAnalytics_dat;

-- Count total visitors
SELECT COUNT(*) AS Total_Visitors
FROM EcommerceAnalytics_dat;

--Calculating the conversion rate
SELECT COUNT(CASE WHEN Revenue = 1 THEN 1 END) * 100.0/ COUNT(*) AS Revenue_Rate 
FROM EcommerceAnalytics_dat;

---- Which months gives the most purchases?
SELECT  Month,SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) AS Purchases
FROM EcommerceAnalytics_dat
GROUP BY Month
ORDER BY Purchases DESC;

--Do people mostly complete the transaction on Weekends or Weekdays?
SELECT 
  Weekend,
  SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Revenue_Rate
FROM EcommerceAnalytics_dat
GROUP BY Weekend;

---Buyers vs Non-Buyers

SELECT CASE when Revenue = 1 THEN 'Buyer' ELSE 'Non-Buyer' END AS Buyer_or_NonBuyer,
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EcommerceAnalytics_dat) AS Percentage
FROM EcommerceAnalytics_dat
GROUP BY Revenue

---Visitor Behaviour 

---Who buys more between the different types of website  visitors?
SELECT VisitorType,SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY VisitorType;

---Does viewing more products increase the likelihood of buying?
SELECT CASE 
        WHEN ProductRelated <= 10 THEN 'Low Views'
        WHEN ProductRelated <= 30 THEN 'Medium Views'
        ELSE 'High Views'
    END AS Product_Engagement,
    SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY 
    CASE 
        WHEN ProductRelated <= 10 THEN 'Low Views'
        WHEN ProductRelated <= 30 THEN 'Medium Views'
        ELSE 'High Views'
    END;

---Device Performance

---Avg Page Value vs Buyers or Non Buyers

SELECT 
CASE WHEN Revenue = 1 THEN 'Buyer' ELSE 'Non-Buyer' END AS BuyerorNonBuyer,
AVG(PageValues) AS Avg_Page_Value
FROM EcommerceAnalytics_dat
GROUP BY CASE WHEN Revenue = 1 THEN 'Buyer' ELSE 'Non-Buyer' END;

 ---Time Spent on Site

SELECT  AVG(ProductRelated_Duration) AS Avg_Time_Buyers
FROM EcommerceAnalytics_dat
WHERE Revenue = 1;

SELECT  AVG(ProductRelated_Duration) AS Avg_Time_NonBuyers
FROM EcommerceAnalytics_dat
WHERE Revenue = 0;

--- Which browsers and operating systems have the highest conversion rates?
SELECT  Browser, SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY Browser
ORDER BY Conversion_Rate DESC;

SELECT OperatingSystems,SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY OperatingSystems;


---Product & Behavioural Analytics

---Special Day Effect
SELECT SpecialDay,
SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY SpecialDay
ORDER BY SpecialDay;

---Exit Rate Buckets
SELECT CASE 
    WHEN ExitRates <= 0.02 THEN 'Low Exit'
    WHEN ExitRates <= 0.04 THEN 'Medium Exit'
    ELSE 'High Exit'
END AS Exit_Bucket,
SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY 
CASE 
    WHEN ExitRates <= 0.02 THEN 'Low Exit'
    WHEN ExitRates <= 0.04 THEN 'Medium Exit'
    ELSE 'High Exit'
END;

-- Do visitors who read more Informational pages buy more?
SELECT 
    CASE 
        WHEN Informational = 0 THEN 'No Info Pages'
        WHEN Informational <= 5 THEN 'Low (1-5)'
        WHEN Informational <= 10 THEN 'Medium (6-10)'
        ELSE 'High (10+)'
    END AS Info_Engagement,
    COUNT(*) AS Total_Visitors,
    SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) AS Buyers,
    SUM(CASE WHEN Revenue = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Conversion_Rate
FROM EcommerceAnalytics_dat
GROUP BY 
    CASE 
        WHEN Informational = 0 THEN 'No Info Pages'
        WHEN Informational <= 5 THEN 'Low (1-5)'
        WHEN Informational <= 10 THEN 'Medium (6-10)'
        ELSE 'High (10+)'
    END
ORDER BY Conver
