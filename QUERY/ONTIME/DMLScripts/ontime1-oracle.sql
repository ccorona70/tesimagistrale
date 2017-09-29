set serveroutput on
variable n number
exec :n := dbms_utility.get_time;

select min(year), max(year) as max_year, Carrier, count(*) as cnt, 
sum(case when ArrDelayMinutes>30 then 1 else 0 end) as flights_delayed,
round(sum(case when ArrDelayMinutes>30 then 1 else 0 end)/count(*),2) as rate
FROM ontime 
WHERE DayOfWeek not in (6,7)
and OriginState not in ('AK', 'HI', 'PR', 'VI') 
and DestState not in ('AK', 'HI', 'PR', 'VI')
GROUP by carrier HAVING count(*) > 100000 and max(year) > 2010
ORDER by rate DESC, count(*) desc;\

exec dbms_output.put_line(((dbms_utility.get_time - :n)/100) );}