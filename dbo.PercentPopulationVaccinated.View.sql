USE [master]
GO
/****** Object:  View [dbo].[PercentPopulationVaccinated]    Script Date: 28/08/2024 15:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PercentPopulationVaccinated] AS
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vac.new_vaccinations,
SUM(convert(int,vac.new_vaccinations)) OVER(PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS rolling_people_vaccinated
--(rolling_people_vaccinated/population)*100 
FROM ProjectTrial..CovidDeaths deaths
JOIN ProjectTrial..CovidVaccinations vac
ON deaths.location = vac.location
AND deaths.date = vac.date
WHERE deaths.continent IS NOT NULL
--ORDER BY 2,3
GO
