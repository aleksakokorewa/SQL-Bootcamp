create or replace function fnc_fibonacci(pstop int default 10)
returns table(num int) as $$
    with recursive cte_fibo(n1, n2) as (
        values (0, 1)
        union all
        select n2,
            n1 + n2
        from cte_fibo
        where n2 < pstop)
    select n1  from cte_fibo;
$$ language SQL;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
