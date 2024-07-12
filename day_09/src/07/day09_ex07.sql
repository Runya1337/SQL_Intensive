create or replace function func_minimum(arr numeric[])
returns numeric as
$$
declare
    min numeric := null;
    curr numeric;
begin
    foreach curr in array arr
    loop
        if min is null or curr < min then
            min := curr;
        end if;
    end loop;
    return min;
end;
$$ language 'plpgsql';

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);