from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row

import time

conf = SparkConf().setMaster("spark://192.167.155.71:7077").setAppName("unica2-mysql").set("spark.executor.memory","4G").set("spark.driver.memory","4G")

sc = SparkContext(conf = conf)

sqlContext = SQLContext(sc)


# IMPORT TABLE P02_QUESITI ----- OK ------
tab1 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P02_QUESITI",fetchSize=1000).load()
tab1.registerTempTable("P02_QUESITI")


# IMPORT TABLE ELEMENTO_P02_QUESITI ------ OK ------- 
tab2 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="ELEMENTI",fetchSize=1000).load()
tab2.registerTempTable("ELEMENTO_P02_QUESITI")


# IMPORT TABLE ELEMENTO_QUESITI_PADRE  ----- OK -----
tab3 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="ELEMENTI",fetchSize=1000).load()
tab3.registerTempTable("ELEMENTO_QUESITI_PADRE")


# IMPORT TABLE P02_RISPOSTE ---- OK ----
tab4 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P02_RISPOSTE",fetchSize=10000,partitionColumn="QUESITO_ID" , lowerBound=232, upperBound=12734, numPartitions=100).load()
tab4.registerTempTable("P02_RISPOSTE")


# IMPORT TABLE P02_QUEST_COMP_RISPOSTE ------ OK ------
tab5 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P02_QUEST_COMP",fetchSize=1000).load()
tab5.registerTempTable("P02_QUEST_COMP_RISPOSTE")


# IMPORT TABLE V02_RISPOSTE_ROW_TESTO_LIBERO ----- OK ------
tab6 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="V02_RISPOSTE_ROW_TESTO_LIBERO",fetchSize=10000,partitionColumn="QUESITO_ID" , lowerBound=232, upperBound=12734, numPartitions=100).load()
tab6.registerTempTable("V02_RISPOSTE_ROW_TESTO_LIBERO")


# IMPORT TABLE P02_TIPI_FORMATO ----- OK ------
tab7 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P02_TIPI_FORMATO",fetchSize=1000).load()
tab7.registerTempTable("P02_TIPI_FORMATO")


# IMPORT TABLE Q35_DATI_COMP ------ OK --------
tab8 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="Q35_DATI_COMP",fetchSize=1000).load()
tab8.registerTempTable("Q35_DATI_COMP")


# IMPORT TABLE Q35_FAC_COMP ------ OK -------
tab9 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_FAC",fetchSize=1000).load()
tab9.registerTempTable("Q35_FAC_COMP")


# IMPORT TABLE Q35_CDS_COMP ----------- OK ------------
tab10 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_CDS",fetchSize=1000).load()
tab10.registerTempTable("Q35_CDS_COMP")


# IMPORT TABLE Q35_DOCENTE_AD_VAL ------- OK ---------
tab11 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="DOCENTI",fetchSize=1000).load()
tab11.registerTempTable("Q35_DOCENTE_AD_VAL")


# IMPORT TABLE Q35_DOCENTE_TIT_AD_VAL -------- OK ---------
tab12 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="DOCENTI",fetchSize=1000).load()
tab12.registerTempTable("Q35_DOCENTE_TIT_AD_VAL")

# IMPORT TABLE Q35_CDS_AD_VAL -------- OK ----------
tab13 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_CDS",fetchSize=1000).load()
tab13.registerTempTable("Q35_CDS_AD_VAL")


# IMPORT TABLE Q35_FAC_AD_VAL  -------- OK ---------
tab14 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_FAC",fetchSize=1000).load()
tab14.registerTempTable("Q35_FAC_AD_VAL")


# IMPORT TABLE Q35_P09_AD_GEN
tab15 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P09_AD_GEN",fetchSize=1000).load()
tab15.registerTempTable("Q35_P09_AD_GEN")


# IMPORT TABLE Q35_SCUOLA  ------- OK --------
tab16 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P01_SCUOLA",fetchSize=1000).load()
tab16.registerTempTable("Q35_SCUOLA")


# IMPORT TABLE Q35_TIPI_TITOLO_SUP ----- OK -------
tab17 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="TIPI_TITOLO_SUP",fetchSize=1000).load()
tab17.registerTempTable("Q35_TIPI_TITOLO_SUP")


# IMPORT TABLE Q35_P09_UD_CDS ----- OK -----
tab18 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P09_UD_CDS",fetchSize=1000).load()
tab18.registerTempTable("Q35_P09_UD_CDS")


# IMPORT TABLE Q35_TIPI_CORSO_AD_VAL ------ OK --------
tab19 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="TIPI_CORSO",fetchSize=1000).load()
tab19.registerTempTable("Q35_TIPI_CORSO_AD_VAL")


# IMPORT TABLE Q35_NORMATIVA_CDS_AD_VAL   ------ OK ------
tab20 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P07_NORMATIVA",fetchSize=1000).load()
tab20.registerTempTable("Q35_NORMATIVA_CDS_AD_VAL")


# IMPORT TABLE Q35_INVIO_SEGNALAZIONE ------ OK -----
tab21 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="Q35_INVIO_SEGNALAZIONE",fetchSize=1000).load()
tab21.registerTempTable("Q35_INVIO_SEGNALAZIONE")


# IMPORT TABLE Q35_NUM_QUEST_CDS_DOC_UD  ------- OK ---------
tab22 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="Q35_NUM_QUEST_CDS_DOC_UD",fetchSize=1000).load()
tab22.registerTempTable("Q35_NUM_QUEST_CDS_DOC_UD")


# IMPORT TABLE Q35_CARICHE_FAC_AD_VAL  ------ OK -------
tab23 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="V06_CARICHE_SDR_VALIDE",fetchSize=1000).load()
tab23.registerTempTable("Q35_CARICHE_FAC_AD_VAL")


# IMPORT TABLE Q35_PRESIDE_FAC_AD_VAL  ------ OK ------
tab24 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="DOCENTI",fetchSize=1000).load()
tab24.registerTempTable("Q35_PRESIDE_FAC_AD_VAL")


# IMPORT TABLE Q35_CARICHE_CDS_AD_VAL   -------- OK --------
tab25 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="V06_CARICHE_SDR_VALIDE",fetchSize=1000).load()
tab25.registerTempTable("Q35_CARICHE_CDS_AD_VAL")


# IMPORT TABLE Q35_PRESIDENTE_CDS_AD_VAL  ------ OK ------
tab26 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="DOCENTI",fetchSize=1000).load()
tab26.registerTempTable("Q35_PRESIDENTE_CDS_AD_VAL")


# IMPORT TABLE Q35_DOC_AD_VAL_DIP_AFFERENZA   ------- OK --------
tab27 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_DIP",fetchSize=1000).load()
tab27.registerTempTable("Q35_DOC_AD_VAL_DIP_AFFERENZA")


# IMPORT TABLE Q35_UD_TIPO_COPERTURA  ------- OK -------
tab28 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P09_UD_PDSORD_DOC",fetchSize=1000).load()
tab28.registerTempTable("Q35_UD_TIPO_COPERTURA")


# IMPORT TABLE QUESITI_PADRE ----- OK -----
tab29 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P02_QUESITI",fetchSize=1000).load()
tab29.registerTempTable("QUESITI_PADRE")


# IMPORT TABLE Q35_FAC_CDS_AD_VAL
tab30 = sqlContext.read.format("jdbc").options(url="jdbc:mysql://192.160.156.94:3306/ESSE3?user=esse3&password=esse3",dbtable="P06_FAC_CDS",fetchSize=1000).load()
tab30.registerTempTable("Q35_FAC_CDS_AD_VAL")

start = time.time()

q1 = sqlContext.sql("SELECT Q35_DATI_COMP.AA_OFF_AD_ID_VAL,COUNT(*) AS NUM_RECORD FROM P02_QUESITI LEFT OUTER JOIN P02_TIPI_FORMATO ON (P02_QUESITI.TIPO_FORMATO_COD = P02_TIPI_FORMATO.TIPO_FORMATO_COD) LEFT OUTER JOIN ELEMENTO_P02_QUESITI ON (P02_QUESITI.ELEM_COD = ELEMENTO_P02_QUESITI.ELEM_COD) LEFT OUTER JOIN P02_RISPOSTE ON (P02_QUESITI.QUESITO_ID = P02_RISPOSTE.QUESITO_ID) LEFT OUTER JOIN P02_QUEST_COMP_RISPOSTE ON (P02_RISPOSTE.QUEST_COMP_ID = P02_QUEST_COMP_RISPOSTE.QUEST_COMP_ID) LEFT OUTER JOIN QUESITI_PADRE ON (P02_QUESITI.PARENT_QUESITO_ID = QUESITI_PADRE.QUESITO_ID) LEFT OUTER JOIN ELEMENTO_QUESITI_PADRE ON (QUESITI_PADRE.ELEM_COD = ELEMENTO_QUESITI_PADRE.ELEM_COD) JOIN V02_RISPOSTE_ROW_TESTO_LIBERO ON (P02_RISPOSTE.RISPOSTA_ID = V02_RISPOSTE_ROW_TESTO_LIBERO.RISPOSTA_ID) LEFT OUTER JOIN Q35_DATI_COMP ON (P02_RISPOSTE.QUEST_COMP_ID = Q35_DATI_COMP.QUEST_COMP_ID) LEFT OUTER JOIN Q35_CDS_AD_VAL ON (Q35_DATI_COMP.CDS_AD_ID_VAL = Q35_CDS_AD_VAL.CDS_ID) JOIN Q35_FAC_CDS_AD_VAL ON ((Q35_CDS_AD_VAL.CDS_ID = Q35_FAC_CDS_AD_VAL.CDS_ID) AND Q35_FAC_CDS_AD_VAL.DEF_AMM_FLG=1) LEFT OUTER JOIN Q35_FAC_AD_VAL ON (Q35_FAC_CDS_AD_VAL.FAC_ID = Q35_FAC_AD_VAL.FAC_ID) LEFT OUTER JOIN Q35_DOCENTE_AD_VAL ON (Q35_DATI_COMP.DOC_AD_ID_VAL = Q35_DOCENTE_AD_VAL.DOCENTE_ID) LEFT OUTER JOIN Q35_DOCENTE_TIT_AD_VAL ON (Q35_DATI_COMP.DOC_TIT_AD_ID_VAL = Q35_DOCENTE_TIT_AD_VAL.DOCENTE_ID) LEFT OUTER JOIN Q35_FAC_COMP ON (Q35_DATI_COMP.FAC_ID_COMP = Q35_FAC_COMP.FAC_ID) LEFT OUTER JOIN Q35_CDS_COMP ON (Q35_DATI_COMP.CDS_ID_COMP = Q35_CDS_COMP.CDS_ID) LEFT OUTER JOIN Q35_P09_AD_GEN ON (Q35_DATI_COMP.AD_ID_VAL = Q35_P09_AD_GEN.AD_ID) LEFT OUTER JOIN Q35_P09_UD_CDS ON ((Q35_DATI_COMP.AA_OFF_AD_ID_VAL = Q35_P09_UD_CDS.AA_OFF_ID) AND (Q35_DATI_COMP.AD_ID_VAL = Q35_P09_UD_CDS.AD_ID) AND (Q35_DATI_COMP.CDS_AD_ID_VAL = Q35_P09_UD_CDS.CDS_ID) AND (Q35_DATI_COMP.UD_ID_VAL = Q35_P09_UD_CDS.UD_ID)) LEFT OUTER JOIN Q35_TIPI_TITOLO_SUP ON (Q35_DATI_COMP.TIPO_TITOLO_COD_COMP = Q35_TIPI_TITOLO_SUP.TIPO_TITOLO_COD) LEFT OUTER JOIN Q35_SCUOLA ON (Q35_DATI_COMP.SCUOLA_SUP_ID_COMP = Q35_SCUOLA.SCUOLA_SUP_ID) LEFT OUTER JOIN Q35_TIPI_CORSO_AD_VAL ON (Q35_CDS_AD_VAL.TIPO_CORSO_COD = Q35_TIPI_CORSO_AD_VAL.TIPO_CORSO_COD) LEFT OUTER JOIN Q35_NORMATIVA_CDS_AD_VAL ON (Q35_CDS_AD_VAL.NORM_ID = Q35_NORMATIVA_CDS_AD_VAL.NORM_ID) LEFT OUTER JOIN Q35_INVIO_SEGNALAZIONE ON (Q35_DATI_COMP.QUEST_COMP_ID = Q35_INVIO_SEGNALAZIONE.QUEST_COMP_ID) LEFT OUTER JOIN Q35_CARICHE_CDS_AD_VAL ON ((Q35_FAC_CDS_AD_VAL.CDS_ID = Q35_CARICHE_CDS_AD_VAL.STRUTT_ID) AND Q35_CARICHE_CDS_AD_VAL.SDR_TIP='CDS' AND Q35_CARICHE_CDS_AD_VAL.CARICA_ID=95) LEFT OUTER JOIN Q35_CARICHE_FAC_AD_VAL ON ((Q35_FAC_CDS_AD_VAL.FAC_ID = Q35_CARICHE_FAC_AD_VAL.STRUTT_ID) AND Q35_CARICHE_FAC_AD_VAL.SDR_TIP='FAC' AND Q35_CARICHE_FAC_AD_VAL.CARICA_ID=97) LEFT OUTER JOIN Q35_PRESIDE_FAC_AD_VAL ON (Q35_CARICHE_FAC_AD_VAL.MATRICOLA_DOCENTE = Q35_PRESIDE_FAC_AD_VAL.MATRICOLA) LEFT OUTER JOIN Q35_PRESIDENTE_CDS_AD_VAL ON (Q35_CARICHE_CDS_AD_VAL.MATRICOLA_DOCENTE = Q35_PRESIDENTE_CDS_AD_VAL.MATRICOLA) LEFT OUTER JOIN Q35_NUM_QUEST_CDS_DOC_UD ON ((Q35_DATI_COMP.AA_OFF_AD_ID_VAL = Q35_NUM_QUEST_CDS_DOC_UD.AA_OFF_AD_ID_VAL) AND (Q35_DATI_COMP.AD_ID_VAL = Q35_NUM_QUEST_CDS_DOC_UD.AD_ID_VAL) AND (Q35_DATI_COMP.CDS_AD_ID_VAL = Q35_NUM_QUEST_CDS_DOC_UD.CDS_AD_ID_VAL) AND (Q35_DATI_COMP.DOC_AD_ID_VAL = Q35_NUM_QUEST_CDS_DOC_UD.DOC_AD_ID_VAL) AND (Q35_DATI_COMP.UD_ID_VAL = Q35_NUM_QUEST_CDS_DOC_UD.UD_ID_VAL) AND  (NVL(Q35_DATI_COMP.EVENTO_COMP,'BOZZA')=Q35_NUM_QUEST_CDS_DOC_UD.EVENTO_COMP) AND  (NVL(Q35_DATI_COMP.STU_FREQ_FLG_COMP,999)=Q35_NUM_QUEST_CDS_DOC_UD.STU_FREQ_FLG_COMP) AND  (NVL(Q35_DATI_COMP.STU_NO_AUT_FLG_COMP,999)=Q35_NUM_QUEST_CDS_DOC_UD.STU_NO_AUT_FLG_COMP)) LEFT OUTER JOIN Q35_DOC_AD_VAL_DIP_AFFERENZA ON (Q35_DOC_AD_VAL_DIP_AFFERENZA.DIP_ID = Q35_DOCENTE_AD_VAL.DIP_ID) LEFT OUTER JOIN Q35_UD_TIPO_COPERTURA ON ((Q35_DATI_COMP.AA_OFF_AD_ID_VAL = Q35_UD_TIPO_COPERTURA.AA_OFF_ID) AND (Q35_DATI_COMP.AA_ORD_AD_ID_VAL = Q35_UD_TIPO_COPERTURA.AA_ORD_ID) AND (Q35_DATI_COMP.AD_ID_VAL = Q35_UD_TIPO_COPERTURA.AD_ID) AND (Q35_DATI_COMP.CDS_AD_ID_VAL = Q35_UD_TIPO_COPERTURA.CDS_ID) AND (Q35_DATI_COMP.DOC_AD_ID_VAL = Q35_UD_TIPO_COPERTURA.DOCENTE_ID) AND (Q35_DATI_COMP.PDS_AD_ID_VAL = Q35_UD_TIPO_COPERTURA.PDS_ID) AND (Q35_DATI_COMP.UD_ID_VAL = Q35_UD_TIPO_COPERTURA.UD_ID)) WHERE P02_QUESITI.QUESTIONARIO_ID = 35 AND (Q35_DATI_COMP.AA_OFF_AD_ID_VAL NOT IN ('2016') AND Q35_DATI_COMP.DATAORA_COMP < CAST('2016-01-01 00:00:00' AS DATE) OR Q35_DATI_COMP.DATAORA_COMP > CAST('2016-12-31 00:00:00' AS DATE)) GROUP BY Q35_DATI_COMP.AA_OFF_AD_ID_VAL HAVING COUNT(*)>200000 ORDER BY Q35_DATI_COMP.AA_OFF_AD_ID_VAL")


q1.show()

print(time.time()-start)
