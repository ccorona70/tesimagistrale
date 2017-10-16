from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

conf =SparkConf().setMaster("spark://spark-master:7077").setAppName("ontime2-mysql").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:mysql://spark-db:3306/ESSE3?user=esse3&password=esse3",dbtable="ontime", fetchSize=10000, partitionColumn="Year" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ontime")

q1 = sqlContext.sql("select DayOfWeek, count(*) from ontime group by DayOfWeek")

start =time.time()

q1.show()


print(time.time()-start)
