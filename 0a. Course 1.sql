use Analytics_STG;

--Count all words
	--select count(*)
	--from bp.Words

--Count words that start with A: Two methods
	--select count(*)
	--from bp.words
	--where words like 'a%'
	--where left(words, 1) = 'a'

--Count all words based on the first letter
	--select left(words, 1), count(*)
	--from bp.Words
	--group by left(words, 1)
	--order by left(words, 1)

--Count all words based on the word length
	--select len(words), count(*)
	--from bp.Words
	--group by len(words)
	--order by len(words)

--How to determine what the 200th word in a list is
	--select *
	--from (select *, row_number() over(order by words asc) unicorn
	--		from bp.Words) X
	--where unicorn = 200

--For all words that start with a distinct letter (i.e. left(words, 1)) determine what the 200th word is
	--select *
	--from (select *, row_number() over(partition by left(words, 1) order by words asc) unicorn
	--		from bp.Words) X
	--where unicorn = 200
	--order by words

--How to find all the palindromes
	--select *
	--from bp.Words
	--where words = REVERSE(words)

--Beginning of anagrams
	--select *, dbo.udf_SortString(words) alpha
	--into #x
	--from bp.Words

	DECLARE @t table(col varchar(4000))
	INSERT INTO @t 
	SELECT Words
	FROM Bp.Words

	SELECT
	  Col, 
	  (
		SELECT
		  chr
		FROM
		  (SELECT TOP(LEN(Col)) 
			 SUBSTRING(Col,ROW_NUMBER() OVER(ORDER BY 1/0),1)
		   FROM sys.messages) A(Chr)
		   ORDER by chr
		   FOR XML PATH(''), type).value('.', 'varchar(max)'
		  ) SortedCol
	INTO #temp
	FROM @t


select top 1000 *
from #temp
where col in ('iceman', 'cinema')
