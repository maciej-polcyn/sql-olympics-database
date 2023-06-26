select
	region,
    count(distinct games) AS no_events
from noc
join athletic_events ae using (noc)
group by region
having no_events = 
	(select count(distinct games)
	from athletic_events)

