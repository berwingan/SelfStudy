--artist_name, release_month ,  num_releases



select artist.name as ARTIST_NAME,
release_info.date_month as MONTH,
count(*) as NUM_RELEASE 
from release
left join release_info on release.id=release_info.RELEASE
left join artist_credit_name on release.artist_credit=artist_credit_name.artist_credit
left join artist on artist.id=artist_credit_name.artist
left join artist_type on artist.type=artist_type.id
where artist.name like 'Elvis%' 
and release_info.date_month is not NULL
and artist_type.name='Person'
group by artist.name, release_info.date_month
order by NUM_RELEASE desc, artist.name;

