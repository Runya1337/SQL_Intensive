create
or replace function fnc_trg_person_update_audit() returns trigger as $$ begin
insert into
    person_audit (
        created,
        type_event,
        row_id,
        name,
        age,
        gender,
        address
    )
values
    (
        current_date,
        'U',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );

return NEW;

end;

$$ language 'plpgsql';

create trigger trg_person_update_audit after
update
    on person for each row execute procedure fnc_trg_person_update_audit();

UPDATE
    person
SET
    name = 'Bulat'
WHERE
    id = 10;

UPDATE
    person
SET
    name = 'Damir'
WHERE
    id = 10;

select
    *
from
    person;

select
    *
from
    person_audit;