select distinct r.name, ri.date_year 
from release r left join release_info ri on r.id=ri.release
where r.id in (
select release from medium where format in 
(select id from medium_format where name='12" Vinyl'))
and ri.area in (select id from area where name='United Kingdom')
and r.artist_credit in (select artist_credit_name.artist_credit from artist_credit_name 
left join artist on artist_credit_name.artist=artist.id 
where artist.name='The Beatles')
order by ri.date_year, r.name
;
