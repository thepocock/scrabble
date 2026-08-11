
select max(len(words)), max(len(alpha))
from BP.Words_Alpha;



ALTER TABLE BP.Words_Alpha ALTER COLUMN Words varchar(64) NOT NULL
ALTER TABLE BP.Words_Alpha ALTER COLUMN Alpha varchar(64) NOT NULL

alter table BP.Words_Alpha add primary key (Words)

create index IDX_01 ON BP.Words_Alpha(Alpha)