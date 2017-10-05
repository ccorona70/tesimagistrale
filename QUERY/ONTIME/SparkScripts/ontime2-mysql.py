from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

#conf =SparkConf().setMaster("local").setAppName("Query2").set("spark.executor.memory","2G").set("spark.driver.memory","4G").set("spark.sql.inMemoryColumnarStorage.compressed","true").set("spark.sql.inMemoryColumnarStorage.batchSize","100000").set("spark.sql.shuffle.partitions","200").set("spark.python.worker.memory","2g")

conf =SparkConf().setMaster("spark://master:7077").setAppName("Ontime_mysql_q2").set("spark.executor.memory","4G").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="ontime", fetchSize=10000, partitionColumn="Year" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ontime")
#tab1.cache()

q1 = sqlContext.sql("select DayOfWeek, count(*) from ontime group by DayOfWeek")

start =time.time()

q1.show()


print(time.time()-start)
