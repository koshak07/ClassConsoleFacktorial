--#3
select distinct Developers.Name as NameDev, Count(ProjectId) as CountProj
from Developers join ProjectDeveloper
on Developers.Id = ProjectDeveloper.DeveloperId  
GROUP BY Developers.Name HAVING Count(ProjectId)>=2