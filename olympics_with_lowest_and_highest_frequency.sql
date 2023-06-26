-- Number of countries in each championship as a new table 
DROP TABLE IF EXISTS countries_by_games;
CREATE TABLE countries_by_games AS
select 
	games, 
	count(distinct noc) AS no_countries
from athletic_events ae
where noc in
	(select noc
    from athletic_events
    where games = ae.games)
group by games;

-- Event with the lowest and highest frequency - solution with union
select 
	games,
    no_countries
from countries_by_games
where no_countries = (
	select min(no_countries)
    from countries_by_games)
union
select 
	games,
    no_countries
from countries_by_games
where no_countries = (
	(select max(no_countries)
    from countries_by_games));
    
-- Event with the lowest and highest frequency - solution with having condition
select 
	games,
    no_countries
from countries_by_games
having no_countries = (
	select min(no_countries)
    from countries_by_games)
	or
    no_countries = (
	select max(no_countries)
    from countries_by_games);

-- Event with the lowest and highest frequency - solution with join
SELECT
	games, 
    no_countries
FROM countries_by_games cbg
JOIN (
    SELECT 
		MIN(no_countries) AS min_countries, 
		MAX(no_countries) AS max_countries
    FROM countries_by_games
) ag
ON cbg.no_countries = ag.min_countries OR cbg.no_countries = ag.max_countries;

