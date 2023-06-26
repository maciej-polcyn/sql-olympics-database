-- Primitive but working solution
with g as (
	select region, count(*) as medals 
    from athletic_events
    join noc using(noc)
    where medal = 'gold'
    group by region),
s as (
	select region, count(*) as medals
    from athletic_events
    join noc using(noc)
    where medal = 'silver'
    group by region),
b as (
	select region, count(*) as medals
    from athletic_events
    join noc using(noc)
    where medal = 'bronze'
    group by region)
select 
	noc.region,
    g.medals as gold,
    s.medals as silver,
    b.medals as bronze,
    (select gold + silver + bronze) as total
from noc
join g using(region)
join s using(region)
join b using(region)
order by total desc;

-- Simplified solution
SELECT
    noc.region,
    COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
    COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
    COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze,
    COUNT(*) AS total
FROM
    athletic_events
    JOIN noc USING (noc)
WHERE
    medal IN ('gold', 'silver', 'bronze')
GROUP BY
    noc.region
ORDER BY
    total DESC