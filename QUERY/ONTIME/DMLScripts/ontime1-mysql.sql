select min(year), max(year) as max_year, Carrier, count(*) as cnt,
sum(if(ArrDelayMinutes>30, 1, 0)) as flights_delayed, 
round(sum(if(ArrDelayMinutes>30, 1, 0))/count(*),2) as rate 
FROM ontime 
WHERE 
DayOfWeek not in (6,7) 
and OriginState not in ('AK', 'HI', 'PR', 'VI') 
and DestState not in ('AK', 'HI', 'PR', 'VI') 
GROUP by carrier HAVING cnt > 100000 and max_year > 2010 
ORDER by rate DESC, cnt desc 
LIMIT 10;