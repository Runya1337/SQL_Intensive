drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_delete_audit();

delete from person_audit;

create or replace function fnc_trg_person_audit()
    returns trigger as
$$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit (
            created, type_event, row_id, name, age, gender, address
            )
        values(
            current_date, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address
            );
    elseif (TG_OP = 'UPDATE') then
        insert into person_audit (
            created, type_event, row_id, name, age, gender, address
            )
        values(
            current_date, 'U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address
            );
    elseif (TG_OP = 'DELETE') then
        insert into person_audit (
            created, type_event, row_id, name, age, gender, address
            )
        values(
            current_date, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address
            );
    end if;
    return NEW;
end;
$$
language 'plpgsql';

create trigger trg_person_audit
after insert or update or delete on person
for each row
execute procedure fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

select * from person;
select * from person_audit;