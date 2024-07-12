create table
    person_audit (
        created timestamp
        with
            time zone default current_timestamp not null,
            type_event char(1) default 'I' not null check(type_event in ('I', 'U', 'D')),
            row_id bigint not null,
            name varchar,
            age integer,
            gender varchar,
            address varchar
    );

create
or replace function fnc_trg_person_insert_audit() returns trigger as $$ begin
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
        'I',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );

return NEW;

end;

$$ language 'plpgsql';

create trigger trg_person_insert_audit after insert on person for each row execute procedure fnc_trg_person_insert_audit();

INSERT INTO
    person(id, name, age, gender, address)
VALUES
    (10, 'Damir', 22, 'male', 'Irkutsk');

select
    *
from
    person;

select
    *
from
    person_audit;