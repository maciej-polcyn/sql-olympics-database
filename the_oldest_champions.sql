with champions as(
select 
	full_name, 
    age,
    sport,
    team,
    games
from athletic_events
where lower(medal) = 'gold'
)
select *
from champions
where age = (
	select max(age) from champions
	);
