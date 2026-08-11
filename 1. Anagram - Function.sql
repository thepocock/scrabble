CREATE FUNCTION BP.udf_SortString
(
    @string VARCHAR(1000)
)
RETURNS VARCHAR(1000)
AS
BEGIN
    DECLARE @len TINYINT
    DECLARE @i TINYINT
    DECLARE @currentchar CHAR(1)
    DECLARE @swapped BIT
    DECLARE @begin BIT
    DECLARE @nextchar CHAR(1)

    SET @begin = 1
    SET @len = LEN(@string)
    SET @i = 1

    WHILE @begin = 1 OR @swapped = 1
    BEGIN
        SET @swapped = 0
        SET @i = 1
        SET @begin = 0
        WHILE @i <= @len
        BEGIN
            SET @currentchar = SUBSTRING(@string, @i, 1)
            SET @nextchar = SUBSTRING(@string, @i + 1, 1)

            IF @currentchar > @nextchar AND (@nextchar > '')
            BEGIN
                SET @string = BP.udf_swap(@string, @i, @i + 1)
                SET @swapped = 1
            END

            SET @i = @i + 1
        END
    END

    RETURN(@string)
END;

CREATE FUNCTION BP.udf_Swap
(
    @fullstring VARCHAR(1000),
    @charlocation1 TINYINT,
    @charlocation2 TINYINT
)
RETURNS VARCHAR(1000)
AS
BEGIN
        DECLARE @returnval varchar(1000)
        DECLARE @begin VARCHAR(1000), @middle VARCHAR(1000), @end VARCHAR(1000)
        DECLARE @firstchar CHAR(1), @secondchar CHAR(1), @len INT
        SET @fullstring = LTRIM(RTRIM(@fullstring))
        SET @len = LEN(@fullstring)

    IF @charlocation1 > @len OR @charlocation2 > @len
        SET @returnval = @fullstring
        ELSE
        BEGIN
               SET @firstchar = SUBSTRING(@fullstring, @charlocation1, 1)
               SET @secondchar = SUBSTRING(@fullstring, @charlocation2, 1)
               SET @begin = LEFT(@fullstring, (@charlocation1-1))
               SET @middle = SUBSTRING(@fullstring, @charlocation1+1, (@charlocation2-@charlocation1)-1)
               SET @end = SUBSTRING(@fullstring, @charlocation2+1, @len)
               SET @returnval = @begin + @secondchar + @middle + @firstchar + @end
        END
    RETURN(@returnval)
END