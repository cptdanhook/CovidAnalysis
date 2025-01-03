USE [master]
GO
/****** Object:  View [dbo].[GlobalFigures]    Script Date: 28/08/2024 15:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GlobalFigures] AS
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, SUM(cast(new_deaths AS int))/ SUM(new_cases)*100 AS death_perc
FROM ProjectTrial..CovidDeaths
--WHERE location LIKE '%United Kingdom%'
WHERE continent IS NOT NULL
--GROUP BY date
--ORDER BY 1,2;
GO
