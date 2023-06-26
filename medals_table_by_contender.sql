select 
	full_name,
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze,
    count(*) as total
from athletic_events
where medal is not null
group by full_name
order by total desc