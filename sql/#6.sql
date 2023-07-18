

CREATE FUNCTION IsLeapYear()
RETURNS BIT
AS
BEGIN
    DECLARE @Year INT;
    SET @Year = YEAR(GETDATE());
    DECLARE @Result BIT;
    IF (@Year % 4 = 0 AND @Year % 100 <> 0) OR (@Year % 400 = 0)
        RETURN 1; -- LeapYear
    ELSE
        RETURN 0; -- No LeapYear
		return @Result
END