DECLARE @TargetIDs TABLE (ID INT);  -- Создаем временную таблицу для хранения целевых ID
INSERT INTO @TargetIDs (ID)
VALUES (1), (4);  -- Вставляем целевые ID

DECLARE @Results TABLE (ID INT, Name VARCHAR(255));  -- Создаем таблицу для хранения результатов

DECLARE @Stack TABLE (ID INT);  -- Создаем таблицу для хранения узлов в стеке
INSERT INTO @Stack (ID)
SELECT ID FROM Projects WHERE ID IN (SELECT ID FROM @TargetIDs);  -- Помещаем целевые ID в стек

WHILE EXISTS(SELECT 1 FROM @Stack)  -- Цикл Пока стек не пустой
BEGIN
    DECLARE @CurrentID INT;
    SELECT TOP 1 @CurrentID = ID FROM @Stack ORDER BY ID;  -- Извлекаем узел из стека
    
    DELETE FROM @Stack WHERE ID = @CurrentID;  -- Удаляем узел из стека
    
    INSERT INTO @Results (ID, Name)
    SELECT ID, Name FROM Projects WHERE ID = @CurrentID;  -- Добавляем узел в результат
    
    INSERT INTO @Stack (ID)
    SELECT ID FROM Projects WHERE ParentID = @CurrentID;  -- Добавляем дочерние узлы в стек
END

SELECT * FROM @Results;  -- Выводим результат

-------------------------------------------------------------------------
--WITH  ProjectHierarchy AS (
--  SELECT ID, Name, ParentID
--  FROM Projects
--  WHERE ID = 1 

--  UNION ALL

--  SELECT p.ID, p.Name, p.ParentID
--  FROM Projects p
--  INNER JOIN ProjectHierarchy ph ON p.ParentID = ph.ID
--)
--SELECT *
--FROM ProjectHierarchy
--ORDER BY ID;
