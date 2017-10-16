from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

conf =SparkConf().setMaster("spark://spark-master:7077").setAppName("ontime1-postgresql").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:postgresql://spark-db:5432/esse3?user=esse3&password=esse3",dbtable="ontime", fetchSize=10000, partitionColumn="year" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ontime")

q1 = sqlContext.sql("select min(year), max(year) as max_year, carrier, count(*) as cnt, sum(case when arrdelayminutes>30 then 1 else 0 end) as flights_delayed, round(sum(case when arrdelayminutes>30 then 1 else 0 end)/count(*),2) as rate FROM ontime WHERE dayofweek not in (6,7) and originstate not in ('AK', 'HI', 'PR', 'VI') and deststate not in ('AK', 'HI', 'PR', 'VI') GROUP by carrier HAVING count(*) > 100000 and max(year) > '2010' ORDER by rate DESC, cnt desc limit 10")

start =time.time()

q1.show()


print(time.time()-start)
