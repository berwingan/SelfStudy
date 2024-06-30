select artist.name as name,
count(artist_alias.id) as NUM_ALIAS ,
STRING_AGG(artist_alias.name,', ' order by artist_alias.name) as Aliases
from artist 
left join artist_alias on artist.id = artist_alias.artist
where artist.name like '%John'
and LOWER(artist_alias.name) not like '%john%'
and artist_alias.name is not null
group by artist.name
order by artist.name;
