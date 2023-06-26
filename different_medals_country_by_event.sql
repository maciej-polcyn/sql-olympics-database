-- medals in every events by country
select
	games,
    region, 
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze
from noc
join athletic_events using(noc)
group by games, region
order by games;

-- medals won by each country in specific event
select
	games,
    region, 
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze
from noc
join athletic_events using(noc)
where games = '1896 Summer'
group by region