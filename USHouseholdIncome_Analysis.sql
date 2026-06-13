SELECT * FROM ushouseholdincome;
SELECT * FROM ushouseholdincome_statistics;

#Dealing with Primary Column----------------------------
UPDATE ushouseholdincome
SET `Primary` = 'Place'
WHERE `Primary` = 'place'
;

#Exploratory Data Analysis

#Correlation between area of land and area of water with the state
#Largest land area by state
SELECT State_Name,
SUM(ALand) AS land,
SUM(AWater) AS water
FROM ushouseholdincome
GROUP BY State_Name
ORDER BY land DESC
;

#Largest water area by state
SELECT State_Name,
SUM(ALand) AS land,
SUM(AWater) AS water
FROM ushouseholdincome
GROUP BY State_Name
ORDER BY water DESC
;

#Joining both tables together
SELECT * 
FROM ushouseholdincome u
JOIN ushouseholdincome_statistics us
	ON u.id = us.id
ORDER BY row_id
;

SELECT * 
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
ORDER BY row_id
;


#Average mean and median by state
#Highest average mean by state
SELECT u.State_Name, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY avg_mean DESC
;

#Highest average median by state
SELECT u.State_Name, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY avg_median DESC
;

#Average Median and Mean income by Type
SELECT Type, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median,
COUNT(Type) AS type_count
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY Type
ORDER BY avg_mean DESC
;

SELECT Type, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median,
COUNT(Type) AS type_count
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY Type
ORDER BY avg_median DESC
;

#Average Mean and Median income by City
SELECT City, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY City
ORDER BY avg_median DESC
;

SELECT u.State_Name,
City, 
ROUND(AVG(Mean), 1) AS avg_mean, 
ROUND(AVG(Median), 1) AS avg_median
FROM ushouseholdincome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name, City
ORDER BY avg_mean DESC
;