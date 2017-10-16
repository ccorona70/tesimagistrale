from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

conf =SparkConf().setMaster("spark://spark-master:7077").setAppName("ontine1-oracle").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:oracle:thin:esse3/esse3@//spark-db:1521/orcl.unica.it",dbtable="ONTIME", fetchSize=10000, partitionColumn="YEAR" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ONTIME")


q1 = sqlContext.sql("select min(YEAR), max(YEAR) as max_YEAR, CARRIER, count(*) as CNT, sum(if(ARRDELAYMINUTES>30, 1, 0)) as flights_delayed, round(sum(if(ARRDELAYMINUTES>30, 1, 0))/count(*),2) as rate FROM ONTIME WHERE DAYOFWEEK not in (6,7) and ORIGINSTATE not in ('AK', 'HI', 'PR', 'VI') and DESTSTATE not in ('AK', 'HI', 'PR', 'VI') GROUP by CARRIER HAVING CNT > 100000 and max_YEAR > '2010' ORDER by rate DESC, CNT desc LIMIT  10")

start =time.time()

q1.show()

print(time.time()-start)
