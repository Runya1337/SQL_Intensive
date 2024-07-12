create or replace function fnc_fibonacci(pstop integer default 10)
returns table (fibonacci_number bigint) as
$$
declare
    prev bigint := 0;
    curr bigint := 1;
begin
    if pstop >= 1 then
        fibonacci_number := prev;
        return next;
    end if;

    if pstop >= 2 then
        fibonacci_number := curr;
        return next;
    end if;

    while curr + prev < pstop loop
        fibonacci_number := curr + prev;
        prev := curr;
        curr := fibonacci_number;
        return next;
    end loop;
end;
$$ language 'plpgsql';

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();