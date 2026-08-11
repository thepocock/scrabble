--Anagrams
select *
from bp.words_alpha
where alpha in (
	select alpha
	from BP.Words_Alpha X
	group by alpha
	having count(*) > 1
)
order by alpha

--Anagrams Ordered
select X.Words, X.Alpha, y.C AS WordCount, dense_rank() over(order by c desc, x.alpha) AS AnagramRank
from bp.words_alpha x
inner join (
	select alpha, count(*) as c
	from BP.Words_Alpha X
	group by alpha
	having count(*) > 1
) y
	on x.alpha = y.alpha
order by y.c desc, x.alpha asc