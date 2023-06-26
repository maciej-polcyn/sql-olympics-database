with medals as (
select
	sport,
    region,
    count(medal) as total_medals
from athletic_events ae
join noc using(noc)
group by sport, region
order by sport
)
select 
	sport,
    region,
    total_medals
from medals m
group by sport, region
having total_medals = (
	select max(total_medals)
    from medals
    where sport = m.sport)



