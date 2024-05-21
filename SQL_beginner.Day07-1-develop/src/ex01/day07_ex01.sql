select p.name, COUNT(*) as count_of_visits
from person_visits pv
join person p on pv.person_id = p.id
group by pv.person_id, p.name
order by count_of_visits desc, p.name asc
limit 4;