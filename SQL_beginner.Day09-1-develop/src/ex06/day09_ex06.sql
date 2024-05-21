create or replace function fnc_person_visits_and_eats_on_date(pperson varchar='Dmitriy',pprice int=500, pdate date='2022-01-08')
returns table (
        pizzeria_name varchar
) as $$
        (select distinct pz.name from person_visits pv
            join person p on p.id=pv.person_id
            join pizzeria pz on pz.id=pv.pizzeria_id
            join menu m on m.pizzeria_id=pz.id
        where p.name = pperson and pv.visit_date = pdate and m.price < pprice)
$$ language sql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');