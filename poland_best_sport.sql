-- Sport in which Poland won highest medals
select 
	sport,
    count(medal) as total_medals
from athletic_events
join noc using(noc)
where region = 'Poland'
group by sport
order by total_medals desc
limit 1;

-- Medals won by Poland in fencing by event
select 
	region,
    sport,
	games,
    count(medal) as total_medals
from athletic_events
join noc using(noc)
where region = 'Poland' and sport = 'Fencing'
group by region, sport, games
having total_medals > 0
order by total_medals desc