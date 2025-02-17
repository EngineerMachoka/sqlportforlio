
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

