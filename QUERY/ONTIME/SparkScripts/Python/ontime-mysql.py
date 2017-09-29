from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

conf =SparkConf().setMaster("spark://master:7077").setAppName("Ontime_mysql_q1").set("spark.executor.memory","4G").set("spark.driver.memory","4G")

#conf =SparkConf().setMaster("local").setAppName(“ontime”).set("spark.executor.memory”,”4G").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:mysql://localhost:3306/ESSE3?user=esse3&password=esse3",dbtable="ontime", fetchSize=10000, partitionColumn="year" , lowerBound=2007, upperBound=2017, numPartitions=11).load()
tab1.registerTempTable("ontime")

start =time.time()

q1 = sqlContext.sql("select min(year), max(year) as max_year, Carrier, count(*) as cnt, sum(if(ArrDelayMinutes>30, 1, 0)) as flights_delayed, round(sum(if(ArrDelayMinutes>30, 1, 0))/count(*),2) as rate FROM ontime WHERE DayOfWeek not in (6,7) and OriginState not in ('AK', 'HI', 'PR', 'VI') and DestState not in ('AK', 'HI', 'PR', 'VI') GROUP by carrier HAVING cnt > 100000 and max_year > ‘2010’ ORDER by rate DESC, cnt desc LIMIT  10")

q1.show()


print(time.time()-start)
