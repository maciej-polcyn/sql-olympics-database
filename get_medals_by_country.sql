DELIMITER $$
CREATE PROCEDURE get_medalists_by_country()
begin
with medals as (
select
	games,
    region,
    count(case when medal = 'gold' then 1 end) as gold,
    count(case when medal = 'silver' then 1 end) as silver,
    count(case when medal = 'bronze' then 1 end) as bronze,
	RANK() OVER (PARTITION BY games ORDER BY COUNT(CASE WHEN medal = 'gold' THEN 1 END) DESC) AS gold_rank,
	RANK() OVER (PARTITION BY games ORDER BY COUNT(CASE WHEN medal = 'silver' THEN 1 END) DESC) AS silver_rank,
	RANK() OVER (PARTITION BY games ORDER BY COUNT(CASE WHEN medal = 'bronze' THEN 1 END) DESC) AS bronze_rank
from athletic_events ae
join noc using(noc)
group by games, region
order by games
)
select 
	games,
    GROUP_CONCAT(CASE WHEN gold_rank = 1 THEN CONCAT(region, ': ', gold) END SEPARATOR ', ') AS gold,
    GROUP_CONCAT(CASE WHEN silver_rank = 1 THEN CONCAT(region, ': ', silver) END SEPARATOR ', ') AS silver,
    GROUP_CONCAT(CASE WHEN bronze_rank = 1 THEN CONCAT(region, ': ', bronze) END SEPARATOR ', ') AS bronze
from medals m
group by games
order by games;
end $$
DELIMITER ;