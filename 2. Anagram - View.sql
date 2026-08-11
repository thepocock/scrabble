
create view BP.vWords_Alpha as 

select Words, BP.udf_SortString(words) AS Alpha
from bp.words