/*

select top 100 *
from ##scores

select top 100 *
from bp.words_letters


*/ 

--update t
--	set t.points = u.points
--from bp.words_letters t
--inner join ##scores u
--	on t.letters = u.letter

/*
select words, isscrabble, sum(points) as Score
into #x
from bp.words_letters
--where isscrabble = 1 --and len(words) <= 7 and words not like '%z%'
group by words, isscrabble
order by Score desc
*/


select *
from #x
where words = 'xylophone'




