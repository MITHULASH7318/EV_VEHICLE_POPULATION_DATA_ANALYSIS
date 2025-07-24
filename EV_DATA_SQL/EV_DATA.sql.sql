create database if not exists EV_Dashboard ;
USE EV_Dashboard;

select*from clean_ev_data
limit 15;

show databases;
#checks the vehicles count make in order;

select Make,count(*)AS Total_Vehicles
from clean_ev_data
group by MAKE
Order by Total_Vehicles DESC;
#checks the City count make in order;

select City,count(*)as EV_Count
From clean_ev_data
group by City
order by EV_Count DESC
LIMIT 10;

#Vehicles Registered in a Specific  Postal Code

SELECT Make, Model, COUNT(*) AS Count
FROM clean_ev_data
WHERE `Postal Code` = 98122
GROUP BY Make, Model
ORDER BY Count DESC;

#Vehicle Count by Legislative District

SELECT `Legislative District`, COUNT(*) AS Total
FROM clean_ev_data
GROUP BY `Legislative District`
ORDER BY Total DESC;

#Highest Base MSRP Vehicles

SELECT Make, Model, `Base MSRP`
FROM clean_ev_data
ORDER BY `Base MSRP` DESC
LIMIT 20;

#Missing ZIP Codes

SELECT COUNT(*) AS Missing_Zips
FROM clean_ev_data
WHERE `Postal Code` IS NULL OR `Postal Code` = '';
#Count of Unique Cities and Counties
SELECT COUNT(DISTINCT City) AS Unique_Cities,
       COUNT(DISTINCT County) AS Unique_Counties
FROM clean_ev_data;

# Range Distribution

SELECT 
  CASE 
    WHEN `Electric Range` < 100 THEN 'Below 100'
    WHEN `Electric Range` BETWEEN 100 AND 200 THEN '100-200'
    WHEN `Electric Range` BETWEEN 201 AND 300 THEN '201-300'
    ELSE 'Above 300'
  END AS Range_Group,
  COUNT(*) AS Count
FROM clean_ev_data
GROUP BY Range_Group;

#Average Base MSRP by Make

SELECT Make, ROUND(AVG(`Base MSRP`), 2) AS Avg_Price
FROM clean_ev_data
WHERE `Base MSRP` > 0
GROUP BY Make
ORDER BY Avg_Price ASC
LIMIT 10;





