drop function if exists fnc_persons_male();

drop function if exists fnc_persons_female();

create function fnc_persons(pgender text default 'female') returns setof person language sql as $$
select
    *
from
    person
where
    gender = pgender;

$$;

select
    *
from
    fnc_persons(pgender:= 'male');

select
    *
from
    fnc_persons();