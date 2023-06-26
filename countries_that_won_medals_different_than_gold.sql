select
    region, 
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze
from noc
join athletic_events using(noc)
group by games, region
having gold = 0 AND (silver > 0 OR bronze > 0) 
