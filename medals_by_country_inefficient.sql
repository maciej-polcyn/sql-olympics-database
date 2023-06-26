-- Countries that won the highest number of medals by event (simple but inefficient solution) 
with medals as (
select
	games,
    region,
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze
from athletic_events ae
join noc using(noc)
group by games, region
order by games
)
select 
	games,
	(select concat(region, ': ', gold) from medals where gold = 
	(select max(gold)
	from medals
	where games = m.games) limit 1) as gold,
	(select concat(region, ': ', silver) from medals where silver = 
	(select max(silver)
	from medals
	where games = m.games) limit 1) as silver,
	(select concat(region, ': ', bronze) from medals where bronze = 
	(select max(bronze)
	from medals
	where games = m.games) limit 1) as bronze
from medals m
group by games
order by games