from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

#conf =SparkConf().setMaster("local").setAppName("Query2").set("spark.executor.memory","2G").set("spark.driver.memory","4G").set("spark.sql.inMemoryColumnarStorage.compressed","true").set("spark.sql.inMemoryColumnarStorage.batchSize","100000").set("spark.sql.shuffle.partitions","200").set("spark.python.worker.memory","2g")

#conf =SparkConf().setMaster("spark://192.167.155.71:7077").setAppName("Ontime_oracle_q1").set("spark.executor.memory","2G").set("spark.driver.memory","4G")

conf =SparkConf().setMaster("spark://master:7077").setAppName("Ontime_oracle_q1").set("spark.executor.memory","4G").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:oracle:thin:esse3/esse3@//192.160.156.94:1521/orcl.unica.it",dbtable="ONTIME", fetchSize=10000, partitionColumn="YEAR" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ONTIME")


q1 = sqlContext.sql("select DAYOFWEEK, count(*) from ONTIME group by DAYOFWEEK")

start =time.time()

q1.show()

print(time.time()-start)
