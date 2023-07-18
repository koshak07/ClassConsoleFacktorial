
--#2
select distinct Developers.Name as NameDev, Projects.Name as NameProject
from Developers inner join ProjectDeveloper 
on Developers.Id = ProjectDeveloper.DeveloperId 
inner join Projects on ProjectDeveloper.ProjectId = Projects.Id and  Projects.Id NOT IN (SELECT DISTINCT ParentID FROM Projects WHERE ParentID IS NOT NULL);
