-- top 5 golden medalists
select
	full_name,
    count(medal) AS no_medals
from athletic_events
where medal = 'gold'
group by full_name
order by no_medals desc
limit 5;

-- top 5 medalists
select
	full_name,
    count(medal) AS no_medals
from athletic_events
where medal is not null
group by full_name
order by no_medals desc
limit 5;

-- top 5 countries
select
	region,
	count(medal) AS no_medals
from noc
join athletic_events using(noc)
where medal is not null
group by region
order by no_medals desc
limit 5;