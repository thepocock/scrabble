DECLARE @Vowels TABLE (
	Letters varchar(1))
INSERT INTO @Vowels
VALUES
('A'), ('E'), ('I'), ('O'), ('U'), ('Y')

DECLARE @Consonants TABLE (
	Letters varchar(1))
INSERT INTO @Consonants
VALUES
('B'), ('C'), ('D'), ('F'), ('G'), ('H'), ('J'), ('K'), ('L'), ('M'), ('N'), ('P'), ('Q')
, ('R'), ('S'), ('T'), ('V'), ('W'), ('X'), ('Z');

WITH DataSet AS (
	SELECT Words, SUM(VowelCount) AS VowelSum, SUM(ConsonantCount) AS ConsonantSum
	from (
		select x.*, CASE WHEN Y.Letters IS NOT NULL THEN 1 ELSE 0 END AS VowelCount, CASE WHEN Z.Letters IS NOT NULL THEN 1 ELSE 0 END AS ConsonantCount
		from bp.words_letters X
		left join @Vowels Y
			on x.letters = y.letters
		left join @Consonants Z
			on x.letters = z.letters
		where isscrabble = 1 --and words = 'bluecap'
	) x
	GROUP BY Words
),

OrderedSet AS (

	SELECT *
		, RANK() OVER(ORDER BY VowelSum DESC) AS RN1
		, RANK() OVER(ORDER BY ConsonantSum DESC) AS RN2
	FROM DataSet

)

SELECT *
FROM OrderedSet
WHERE RN1 = 1 OR RN2 = 1
