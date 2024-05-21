select p.name, count(*) as count_of_visits
from person_visits pv
join person p on pv.person_id = p.id
group by p.name
having count(*) > 3;