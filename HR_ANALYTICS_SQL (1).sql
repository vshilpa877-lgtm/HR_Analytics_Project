SHOW DATABASES;

SELECT * FROM hr_2 
LIMIT 100;

SELECT COUNT(*) FROM HR_1;

USE hr_analytics;
DROP TABLE hr_1;

CREATE TABLE hr_1 (
Age INT,
Attrition VARCHAR(10),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department VARCHAR(50),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(50),
EmployeeCount INT,
EmployeeNumber INT,
EnvironmentSatisfaction INT,
Gender VARCHAR(10),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(50),
JobSatisfaction INT,
MaritalStatus VARCHAR(20)
);

SELECT * FROM hr_1 
LIMIT 100;

SELECT * FROM hr_2
LIMIT 100;

# KPI 1 - Average Attrition Rate for all Departments
SELECT  DEPARTMENT , ROUND(sum(case when Attrition = "yes" then 1 else 0 end)/count(EmployeeNumber)*100,2) as rate
FROM hr_1
group by department;

#KPI 2 — Average Hourly Rate of Male Research Scientist
select ROUND(avg(hourlyrate),2), gender , jobrole 
from hr_1
where jobrole = 'Research Scientist' and gender="male";

#KPI 3 — Attrition Rate Vs Monthly Income
select attrition,ROUND(avg(monthlyincome),2) as Monthly_inco
from hr_1
left join hr_2
on hr_2.`Employee ID`=hr_1.EmployeeNumber
group by Attrition;

# KPI 4 — Average Working Years for each Department
select department,ROUND(avg(totalworkingyears),2) as AVG_Work_Year
from hr_1
left join hr_2
on hr_2.`Employee ID`=hr_1.EmployeeNumber
group by Department; 

#KPI 5 — Job Role Vs Work Life Balance
select jobrole,ROUND(avg(worklifebalance),2) as avg_rate
from hr_1
left join hr_2
on hr_2.`Employee ID`= hr_1.EmployeeNumber
group by JobRole;

#KPI 6 — Attrition Rate Vs Years Since Last Promotion
select attrition , ROUND(avg(yearssincelastpromotion),2) as avg_rate
from hr_1
left join hr_2
on hr_2.`Employee ID`=hr_1.EmployeeNumber
group by Attrition;