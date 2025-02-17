--EPISODE 1
--STEP ONE
--Download dataset from https://ourworldindata.org/coronavirus

--STEP TWO
--Transform data in excel to simplify process for beginners
--Move population column
--Split the dataset downloaded into Covid Deaths and Covid Vaccinations excel files

--STEP THREE
--Import excel files saved into SSMS

--Evade the error below by saving the excel files with ssms excel versions
--The 'Microsoft.ACE.OLEDB.12.0' provider is not registered on the local machine. (System.Data)
--To evade change the workbook version to the ones supported

SELECT *
FROM
sqlportfolio.dbo.coviddeaths
ORDER BY 2,3

SELECT *
FROM
sqlportfolio.dbo.covidvac
ORDER BY 2,3 ASC



--EPISODE 3
--create table containing the following columns 
--Entity
--Day
--Total confirmed cases of COVID-19 per million people

--1ST STEP

SELECT 
country, date, total_cases_per_million
FROM
sqlportfolio.dbo.coviddeaths

--2ND STEP
--Rename column titles

SELECT
country AS Entity, date AS Day , total_cases_per_million AS Total_confirmed_cases_of_COVID_19_per_million_people
FROM
sqlportfolio.dbo.coviddeaths

--3RD STEP
-- convert datetime to date on Day column

SELECT 
date, CONVERT(Date, date) AS 'Day'
FROM
sqlportfolio.dbo.coviddeaths

UPDATE 
sqlportfolio.dbo.coviddeaths
SET
date = CONVERT(Date, date)

ALTER TABLE
sqlportfolio.dbo.coviddeaths
ADD
Day DATE

UPDATE
sqlportfolio.dbo.coviddeaths
SET
Day = CONVERT(Date, date)

SELECT
country AS Entity, Day , total_cases_per_million AS Total_confirmed_cases_of_COVID_19_per_million_people
FROM
sqlportfolio.dbo.coviddeaths

--4TH STEP
--order the columns as required
--remove NULL cells



SELECT
country AS Entity, [Day], 
total_cases_per_million AS Total_confirmed_cases_of_COVID_19_per_million_people
FROM
sqlportfolio.dbo.coviddeaths
WHERE total_cases_per_million IS NOT NULL
ORDER BY 1, date

--convert the day format to start with dd/mm/year

SELECT
country AS Entity, FORMAT(date, 'dd/MM/yyyy') AS Day, 
total_cases_per_million AS Total_confirmed_cases_of_COVID_19_per_million_people
FROM
sqlportfolio.dbo.coviddeaths
WHERE total_cases_per_million IS NOT NULL
ORDER BY 1, date

SELECT
FORMAT(date, 'dd/MM/yyyy')
FROM
sqlportfolio.dbo.coviddeaths