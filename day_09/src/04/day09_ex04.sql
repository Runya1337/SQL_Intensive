create function fnc_persons_male() returns setof person language sql as $$
select
    *
from
    person
where
    gender = 'male';

$$;

create function fnc_persons_female() returns setof person language sql as $$
select
    *
from
    person
where
    gender = 'female';

$$;

SELECT
    *
FROM
    fnc_persons_male();

SELECT
    *
FROM
    fnc_persons_female();