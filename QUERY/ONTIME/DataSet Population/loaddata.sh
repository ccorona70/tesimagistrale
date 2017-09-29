# SET GLOBAL sql_mode = ''
for y in {2007..2017}
do
for i in {1..12}
do
echo "$y - $i"
mysql ESSE3 -e "load data infile '/data/ONTIME/On_Time_On_Time_Performance_${y}_${i}.csv' into table ontime fields terminated by ',' OPTIONALLY ENCLOSED BY '\"' ignore 1 lines"
done
done
