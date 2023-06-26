drop table if exists countries_by_games;
create table countries_by_game AS
select
	games,
    count(distinct region) AS no_countries
from noc
join athletic_events ae using (noc)
group by games
order by games;

    
    