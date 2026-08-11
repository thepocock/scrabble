/*Create sample table*/
IF OBJECT_ID('tempdb..#Text', 'U') IS NOT NULL
    DROP TABLE #Test;
     
CREATE TABLE #Test
    (
      ID INT IDENTITY(1, 1) ,
      Words VARCHAR(255)
    );
     
/*Populate the table with sample data*/
INSERT INTO #Test
SELECT *
FROM BP.words;


WITH    base
          AS ( SELECT   L.[char] ,
                        T.ID ,
                        T.Words
               FROM     #Test T
                        CROSS APPLY ( SELECT    SUBSTRING(T.Words, 1 + Number, 1) [char]
                                      FROM      master..spt_values
                                      WHERE     Number < DATALENGTH(T.Words)
                                                AND type = 'P'
                                    ) L
             )
    SELECT  DISTINCT
            b1.Words ,
            REPLACE(( SELECT    '' + [char]
                      FROM      base b2
                      WHERE     b1.Phrase = b2.Phrase
                      ORDER BY  [char]
                        FOR
                          XML PATH('')
                    ), '&#x20;', ' ') AS Alpha
   INTO BP.Words_Alpha
    FROM    base AS b1;