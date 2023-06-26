-- Sports played only once 
select
	sport,
    count(distinct games) AS no_events
from athletic_events
where season = 'Summer'
group by sport
having no_events = 
	(select count(distinct games)
	from athletic_events
    where season = 'Summer');

-- Sports played only once + when
with sports_once as(    
select
	sport,
    count(distinct games) AS no_events    
from athletic_events
group by sport
having no_events = 1)
 select distinct
	sport,
    no_events,
    games
from sports_once
join athletic_events using(sport)