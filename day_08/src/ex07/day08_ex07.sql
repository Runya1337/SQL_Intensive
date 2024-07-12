-- Session #1
begin;

update pizzeria set rating = 0.7 where id = 3;
update pizzeria set rating = 4.5 where id = 4;
commit;
select * from pizzeria where id = 3 or id = 4;

-- Session #2
begin;

update pizzeria set rating = 5 where id = 4;
update pizzeria set rating = 0.5 where id = 3;
commit;
select * from pizzeria where id = 3 or id = 4;