--Scrabble Points

--1 Point - A, E, I, L, N, O, R, S, T and U.
--2 Points - D and G.
--3 Points - B, C, M and P.
--4 Points - F, H, V, W and Y.
--5 Points - K.
--8 Points - J and X.
--10 Points - Q and Z.

DECLARE @Scores TABLE (
	Letter varchar(1)
	, Points int)
INSERT INTO @Scores
VALUES
('A', 1), ('E', 1), ('I', 1), ('L', 1), ('N', 1), ('O', 1), ('R', 1), ('S', 1), ('T', 1), ('U', 1), ('D', 2), ('G', 2), ('B', 3)
, ('C', 3), ('M', 3), ('P', 3), ('F', 4), ('H', 4), ('V', 4), ('W', 4), ('Y', 4), ('K', 5), ('J', 8), ('X', 8), ('Q', 10), ('Z', 10)

SELECT *
FROM @Scores 

--DROP TABLE IF EXISTS #Scores
--CREATE TABLE #Scores  (
--	Letter varchar(1)
--	, Points int)
--INSERT INTO #Scores
--VALUES
--('A', 1), ('E', 1), ('I', 1), ('L', 1), ('N', 1), ('O', 1), ('R', 1), ('S', 1), ('T', 1), ('U', 1), ('D', 2), ('G', 2), ('B', 3)
--, ('C', 3), ('M', 3), ('P', 3), ('F', 4), ('H', 4), ('V', 4), ('W', 4), ('Y', 4), ('K', 5), ('J', 8), ('X', 8), ('Q', 10), ('Z', 10)

--SELECT *
--FROM #Scores

--DROP TABLE IF EXISTS ##Scores
--CREATE TABLE ##Scores  (
--	Letter varchar(1)
--	, Points int)
--INSERT INTO ##Scores
--VALUES
--('A', 1), ('E', 1), ('I', 1), ('L', 1), ('N', 1), ('O', 1), ('R', 1), ('S', 1), ('T', 1), ('U', 1), ('D', 2), ('G', 2), ('B', 3)
--, ('C', 3), ('M', 3), ('P', 3), ('F', 4), ('H', 4), ('V', 4), ('W', 4), ('Y', 4), ('K', 5), ('J', 8), ('X', 8), ('Q', 10), ('Z', 10)

--SELECT *
--FROM ##Scores 

--Scrabble Counts
SELECT 
	COUNT(*) AS OriginalCount
	, SUM(CASE WHEN Y.Words IS NULL THEN 0 ELSE 1 END) AS ScrabbleCount
FROM BP.Words_Alpha X
LEFT JOIN BP.Scrabble_Words Y
	ON X.Words = Y.Words

/*
	ALTER TABLE BP.Words_Alpha ADD isScrabble bit

	CREATE INDEX IDX_02 ON BP.Words_Alpha(isScrabble)

	UPDATE T
		SET T.isScrabble = 1
	FROM BP.Words_Alpha T
	INNER JOIN BP.Scrabble_Words U
		ON T.Words = U.Words

	UPDATE T
		SET T.isScrabble = 0
	FROM BP.Words_Alpha T
	LEFT JOIN BP.Scrabble_Words U
		ON T.Words = U.Words
	WHERE U.Words IS NULL

	--Example of a delete
	--DELETE T
	--FROM Bp.Words_Alpha T
	--WHERE isScrabble = 0
*/ 


--Quantity of letters in the Scrabble Bag

--DROP TABLE IF EXISTS ##ScrabbleBag
--CREATE TABLE ##ScrabbleBag  (
--	Letter varchar(1)
--	, Quantity int)
--INSERT INTO ##ScrabbleBag
--VALUES
--('A', 9)
--, ('B', 2)
--, ('C', 2)
--, ('D', 4)
--, ('E', 12)
--, ('F', 2)
--, ('G', 3)
--, ('H', 2)
--, ('I', 9)
--, ('J', 1)
--, ('K', 1)
--, ('L', 4)
--, ('M', 2)
--, ('N', 6)
--, ('O', 8)
--, ('P', 2)
--, ('Q', 1)
--, ('R', 6)
--, ('S', 4)
--, ('T', 6)
--, ('U', 4)
--, ('V', 2)
--, ('W', 2)
--, ('X', 1)
--, ('Y', 2)
--, ('Z', 1)