create
or replace function fnc_trg_person_delete_audit() returns trigger as $$ begin
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
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );

return OLD;

end;

$$ language 'plpgsql';

create trigger trg_person_delete_audit after delete on person for each row execute procedure fnc_trg_person_delete_audit();

DELETE FROM
    person
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