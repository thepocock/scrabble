/* working solution that takes forever */
select *
from BP.words_alpha X
inner join BP.words_alpha Y
	on x.alpha = y.alpha
where x.words in ('tar', 'rat')


--efficient solution (takes more than 10 minutes)
select words, BP.udf_SortString(words) AS alpha_order
into BP.Words_Alpha
from bp.words

