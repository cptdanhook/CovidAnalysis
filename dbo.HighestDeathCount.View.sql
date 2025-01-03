USE [master]
GO
/****** Object:  View [dbo].[HighestDeathCount]    Script Date: 28/08/2024 15:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HighestDeathCount] AS
SELECT location, MAX(cast(total_deaths AS int)) AS Highest_death_count
FROM ProjectTrial..CovidDeaths
--WHERE location LIKE '%United Kingdom%'
WHERE continent IS NULL
GROUP BY location
--ORDER BY Highest_death_count DESC;
GO
