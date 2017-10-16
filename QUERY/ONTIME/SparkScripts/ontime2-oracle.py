from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *


import time

conf =SparkConf().setMaster("spark://spark-master:7077").setAppName("ontime2-oracle").set("spark.driver.memory","4G")

sc =SparkContext(conf =conf)

sqlContext =SQLContext(sc)

tab1 =sqlContext.read.format("jdbc").options(url="jdbc:oracle:thin:esse3/esse3@//spark-db:1521/orcl.unica.it",dbtable="ONTIME", fetchSize=10000, partitionColumn="YEAR" , lowerBound=2007, upperBound=2017, numPartitions=12).load()
tab1.registerTempTable("ONTIME")


q1 = sqlContext.sql("select DAYOFWEEK, count(*) from ONTIME group by DAYOFWEEK")

start =time.time()

q1.show()

print(time.time()-start)
