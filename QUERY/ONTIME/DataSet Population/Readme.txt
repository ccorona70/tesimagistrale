# Procedure ti populate dataset ontime table

1.To populate Mysql Database i need to download all data from source site in zipped format executing download.sh script.
I populate ten year of data. 
2.To unzip all downloaded file lauching a script unzip_all_csv.sh
3.Create table ontime into mysql database with script ONTIME-mysql.sql
4.To import alla data intop database execute script loaddata.sh 
5.Create table ontime in Oracle database esecuting a script ONTIME-oracle.sql
6.To migrate alla data from mysql to other Oracle and Postgresql database i used a linux program called sqldata available for download at link:
http://www.sqlines.com/sqldata   ("SQLines Data - Database Migration and ETL")
7.Excute a script ontime_mysql_to_oracle.sh
8.Create table into Postgresql database using script ONTIME-postgresql.sql
9.To migrate alla data from Mysql to Postgresql launch a script ontime_mysql_to_postgresql.sh