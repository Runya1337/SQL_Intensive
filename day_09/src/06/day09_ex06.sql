create
or replace function fnc_person_visits_and_eats_on_date(
    pperson text default 'Dmitriy',
    pprice numeric default 500,
    pdate text default '2022-01-08'
) returns table(pizzeria_name varchar) as $$ begin return query
select
    distinct pizzeria.name as pizzeria_name
from
    person_visits
    join person on person_visits.person_id = person.id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
    join menu on pizzeria.id = menu.pizzeria_id
where
    person.name = pperson
    and menu.price < pprice
    and person_visits.visit_date = pdate:: date;

end;

$$ language 'plpgsql';

select
    *
from
    fnc_person_visits_and_eats_on_date(pprice:= 800);

select
    *
from
    fnc_person_visits_and_eats_on_date(pperson:= 'Anna', pprice:= 1300, pdate:= '2022-01-01');