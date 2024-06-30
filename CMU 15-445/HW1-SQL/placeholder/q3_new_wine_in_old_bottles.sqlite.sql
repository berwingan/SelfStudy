select release.name as release_name, 
artist_credit.name as artist_name,
release_info.date_year as release_year
from release 
left join artist_credit 
on release.artist_credit=artist_credit.id
left join release_info
on release.id=release_info.release
where release.id in (
select release from medium where format in 
(select id from medium_format where name='Cassette')
)
order by release_info.date_year desc,
release_info.date_month desc,
release_info.date_day DESC
limit 10;