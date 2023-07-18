CREATE PROCEDURE GetDevelopersInProjectChain
 @ProjectID INT
AS
BEGIN
    -- Создаем временную таблицу для хранения результатов
    CREATE TABLE #DeveloperList
    (
        DeveloperID INT,
        DeveloperName VARCHAR(255)
    );
    
    -- Рекурсивно выбираем всех разработчиков, вовлеченных в цепочку проектов
    WITH ProjectCTE AS
    (
        SELECT
            ID,
            ParentID
        FROM
            Projects
        WHERE
            ID = @ProjectID
            
        UNION ALL
        
        SELECT
            p.ID,
            p.ParentID
        FROM
            Projects p
        INNER JOIN
            ProjectCTE cte ON p.ParentID = cte.ID
    )
    INSERT INTO #DeveloperList (DeveloperID, DeveloperName)
    SELECT
        d.ID,
        d.Name
    FROM
        ProjectCTE cte
    INNER JOIN
        ProjectDeveloper pd ON cte.ID = pd.ProjectID
    INNER JOIN
        Developers d ON pd.DeveloperID = d.ID;
    
    -- Выводим результат
    SELECT
        DeveloperID,
        DeveloperName
    FROM
        #DeveloperList;
    
    -- Удаляем временную таблицу
    DROP TABLE #DeveloperList;
END;