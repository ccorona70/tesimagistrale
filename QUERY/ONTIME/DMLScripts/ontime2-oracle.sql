set serveroutput on

variable n number

exec :n := dbms_utility.get_time;

select dayofweek, count(*) from ontime group by dayofweek;


exec dbms_output.put_line(((dbms_utility.get_time - :n)/100) );