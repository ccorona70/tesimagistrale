from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext, Row
from pyspark.sql.types import *
from datetime import datetime
from pyspark.sql.functions import col, udf

import time
#start = time.time()



#conf = SparkConf().setMaster("spark://192.167.155.71:7077").setAppName("Query1").set("spark.executor.cores", "2").set("spark.executor.instances", "4").set("spark.executor.memory","2G").set("spark.driver.memory","4G")

conf = SparkConf().setMaster("local").setAppName("Query1").set("spark.executor.cores", "2").set("spark.executor.memory","4G").set("spark.driver.memory","4G")


sc = SparkContext(conf = conf)

sqlContext = SQLContext(sc)


# IMPORT TABLE P02_QUESITI ----- OK ------
tab1 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3 user=esse3&password=esse3",dbtable="esse3.p02_quesiti",fetchSize=10000)
tab1.registerTempTable("p02_quesiti")


# IMPORT TABLE ELEMENTO_P02_QUESITI ------ OK ------- 
tab2 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.elementi",fetchSize=10000)
tab2.registerTempTable("elemento_p02_quesiti")


# IMPORT TABLE ELEMENTO_QUESITI_PADRE  ----- OK -----
tab3 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.elementi",fetchSize=10000)
tab3.registerTempTable("elemento_quesiti_padre")


# IMPORT TABLE P02_RISPOSTE ---- OK ----
tab4 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p02_risposte",fetchSize=10000)
tab4.registerTempTable("p02_risposte")


# IMPORT TABLE P02_QUEST_COMP_RISPOSTE ------ OK ------
tab5 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p02_quest_comp",fetchSize=10000)
tab5.registerTempTable("p02_quest_comp_risposte")


# IMPORT TABLE V02_RISPOSTE_ROW_TESTO_LIBERO ----- OK ------
tab6 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.v02_risposte_row_testo_libero",fetchSize=10000)
tab6.registerTempTable("v02_risposte_row_testo_libero")


# IMPORT TABLE P02_TIPI_FORMATO ----- OK ------
tab7 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p02_tipi_formato",fetchSize=10000)
tab7.registerTempTable("p02_tipi_formato")


# IMPORT TABLE Q35_DATI_COMP ------ OK --------
tab8 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.q35_dati_comp",fetchSize=10000)
tab8.registerTempTable("q35_dati_comp")


# IMPORT TABLE Q35_FAC_COMP ------ OK -------
tab9 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_fac",fetchSize=10000)
tab9.registerTempTable("q35_fac_comp")


# IMPORT TABLE Q35_CDS_COMP ----------- OK ------------
tab10 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_cds",fetchSize=10000)
tab10.registerTempTable("q35_cds_comp")


# IMPORT TABLE Q35_DOCENTE_AD_VAL ------- OK ---------
tab11 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.docenti",fetchSize=10000)
tab11.registerTempTable("q35_docente_ad_val")


# IMPORT TABLE Q35_DOCENTE_TIT_AD_VAL -------- OK ---------
tab12 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.docenti",fetchSize=10000)
tab12.registerTempTable("q35_docente_tit_ad_val")

# IMPORT TABLE Q35_CDS_AD_VAL -------- OK ----------
tab13 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_cds",fetchSize=10000)
tab13.registerTempTable("q35_cds_ad_val")


# IMPORT TABLE Q35_FAC_AD_VAL  -------- OK ---------
tab14 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_fac",fetchSize=10000)
tab14.registerTempTable("q35_fac_ad_val")


# IMPORT TABLE Q35_P09_AD_GEN
tab15 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p09_ad_gen",fetchSize=10000)
tab15.registerTempTable("q35_p09_ad_gen")


# IMPORT TABLE Q35_SCUOLA  ------- OK --------
tab16 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p01_scuola",fetchSize=10000)
tab16.registerTempTable("q35_scuola")


# IMPORT TABLE Q35_TIPI_TITOLO_SUP ----- OK -------
tab17 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.tipi_titolo_sup",fetchSize=10000)
tab17.registerTempTable("q35_tipi_titolo_sup")


# IMPORT TABLE Q35_P09_UD_CDS ----- OK -----
tab18 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p09_ud_cds",fetchSize=10000)
tab18.registerTempTable("q35_p09_ud_cds")


# IMPORT TABLE Q35_TIPI_CORSO_AD_VAL ------ OK --------
tab19 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.tipi_corso",fetchSize=10000)
tab19.registerTempTable("q35_tipi_corso_ad_val")


# IMPORT TABLE Q35_NORMATIVA_CDS_AD_VAL   ------ OK ------
tab20 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p07_normativa",fetchSize=10000)
tab20.registerTempTable("q35_normativa_cds_ad_val")


# IMPORT TABLE Q35_INVIO_SEGNALAZIONE ------ OK -----
tab21 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.q35_invio_segnalazione",fetchSize=10000)
tab21.registerTempTable("q35_invio_segnalazione")


# IMPORT TABLE Q35_NUM_QUEST_CDS_DOC_UD  ------- OK ---------
tab22 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.q35_num_quest_cds_doc_ud",fetchSize=10000)
tab22.registerTempTable("q35_num_quest_cds_doc_ud")


# IMPORT TABLE Q35_CARICHE_FAC_AD_VAL  ------ OK -------
tab23 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.v06_cariche_sdr_valide",fetchSize=10000)
tab23.registerTempTable("q35_cariche_fac_ad_val")


# IMPORT TABLE Q35_PRESIDE_FAC_AD_VAL  ------ OK ------
tab24 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.docenti",fetchSize=10000)
tab24.registerTempTable("q35_preside_fac_ad_val")


# IMPORT TABLE Q35_CARICHE_CDS_AD_VAL   -------- OK --------
tab25 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.v06_cariche_sdr_valide",fetchSize=10000)
tab25.registerTempTable("q35_cariche_cds_ad_val")


# IMPORT TABLE Q35_PRESIDENTE_CDS_AD_VAL  ------ OK ------
tab26 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.docenti",fetchSize=10000)
tab26.registerTempTable("q35_presidente_cds_ad_val")


# IMPORT TABLE Q35_DOC_AD_VAL_DIP_AFFERENZA   ------- OK --------
tab27 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_dip",fetchSize=10000)
tab27.registerTempTable("q35_doc_ad_val_dip_afferenza")


# IMPORT TABLE Q35_UD_TIPO_COPERTURA  ------- OK -------
tab28 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p09_ud_pdsord_doc",fetchSize=10000)
tab28.registerTempTable("q35_ud_tipo_copertura")


# IMPORT TABLE QUESITI_PADRE ----- OK -----
tab29 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p02_quesiti",fetchSize=10000)
tab29.registerTempTable("quesiti_padre")


# IMPORT TABLE Q35_FAC_CDS_AD_VAL
tab30 = sqlContext.load(source="jdbc",url="jdbc:postgresql://localhost:5432/esse3?user=esse3&password=esse3",dbtable="esse3.p06_fac_cds",fetchSize=10000)
tab30.registerTempTable("q35_fac_cds_ad_val")

start = time.time()

q1 = sqlContext.sql("select q35_dati_comp.aa_off_ad_id_val,count(*) as num_record from p02_quesiti left outer join p02_tipi_formato on (p02_quesiti.tipo_formato_cod = p02_tipi_formato.tipo_formato_cod) left outer join elemento_p02_quesiti on (p02_quesiti.elem_cod = elemento_p02_quesiti.elem_cod) left outer join p02_risposte on (p02_quesiti.quesito_id = p02_risposte.quesito_id) left outer join p02_quest_comp_risposte on (p02_risposte.quest_comp_id = p02_quest_comp_risposte.quest_comp_id) left outer join quesiti_padre on (p02_quesiti.parent_quesito_id = quesiti_padre.quesito_id) left outer join elemento_quesiti_padre on (quesiti_padre.elem_cod = elemento_quesiti_padre.elem_cod) join v02_risposte_row_testo_libero on (p02_risposte.risposta_id = v02_risposte_row_testo_libero.risposta_id) left outer join q35_dati_comp on (p02_risposte.quest_comp_id = q35_dati_comp.quest_comp_id) left outer join q35_cds_ad_val on (q35_dati_comp.cds_ad_id_val = q35_cds_ad_val.cds_id) join q35_fac_cds_ad_val on ((q35_cds_ad_val.cds_id = q35_fac_cds_ad_val.cds_id) and q35_fac_cds_ad_val.def_amm_flg=1) left outer join q35_fac_ad_val on (q35_fac_cds_ad_val.fac_id = q35_fac_ad_val.fac_id) left outer join q35_docente_ad_val on (q35_dati_comp.doc_ad_id_val = q35_docente_ad_val.docente_id) left outer join q35_docente_tit_ad_val on (q35_dati_comp.doc_tit_ad_id_val = q35_docente_tit_ad_val.docente_id) left outer join q35_fac_comp on (q35_dati_comp.fac_id_comp = q35_fac_comp.fac_id) left outer join q35_cds_comp on (q35_dati_comp.cds_id_comp = q35_cds_comp.cds_id) left outer join q35_p09_ad_gen on (q35_dati_comp.ad_id_val = q35_p09_ad_gen.ad_id) left outer join q35_p09_ud_cds on ((q35_dati_comp.aa_off_ad_id_val = q35_p09_ud_cds.aa_off_id) and (q35_dati_comp.ad_id_val = q35_p09_ud_cds.ad_id) and (q35_dati_comp.cds_ad_id_val = q35_p09_ud_cds.cds_id) and (q35_dati_comp.ud_id_val = q35_p09_ud_cds.ud_id)) left outer join q35_tipi_titolo_sup on (q35_dati_comp.tipo_titolo_cod_comp = q35_tipi_titolo_sup.tipo_titolo_cod) left outer join q35_scuola on (q35_dati_comp.scuola_sup_id_comp = q35_scuola.scuola_sup_id) left outer join q35_tipi_corso_ad_val on (q35_cds_ad_val.tipo_corso_cod = q35_tipi_corso_ad_val.tipo_corso_cod) left outer join q35_normativa_cds_ad_val on (q35_cds_ad_val.norm_id = q35_normativa_cds_ad_val.norm_id) left outer join q35_invio_segnalazione on (q35_dati_comp.quest_comp_id = q35_invio_segnalazione.quest_comp_id) left outer join q35_cariche_cds_ad_val on ((q35_fac_cds_ad_val.cds_id = q35_cariche_cds_ad_val.strutt_id) and q35_cariche_cds_ad_val.sdr_tip='cds' and q35_cariche_cds_ad_val.carica_id=95) left outer join q35_cariche_fac_ad_val on ((q35_fac_cds_ad_val.fac_id = q35_cariche_fac_ad_val.strutt_id) and q35_cariche_fac_ad_val.sdr_tip='fac' and q35_cariche_fac_ad_val.carica_id=97) left outer join q35_preside_fac_ad_val on (q35_cariche_fac_ad_val.matricola_docente = q35_preside_fac_ad_val.matricola) left outer join q35_presidente_cds_ad_val on (q35_cariche_cds_ad_val.matricola_docente = q35_presidente_cds_ad_val.matricola) left outer join q35_num_quest_cds_doc_ud on ((q35_dati_comp.aa_off_ad_id_val = q35_num_quest_cds_doc_ud.aa_off_ad_id_val) and (q35_dati_comp.ad_id_val = q35_num_quest_cds_doc_ud.ad_id_val) and (q35_dati_comp.cds_ad_id_val = q35_num_quest_cds_doc_ud.cds_ad_id_val) and (q35_dati_comp.doc_ad_id_val = q35_num_quest_cds_doc_ud.doc_ad_id_val) and (q35_dati_comp.ud_id_val = q35_num_quest_cds_doc_ud.ud_id_val) and  (nvl(q35_dati_comp.evento_comp,'bozza')=q35_num_quest_cds_doc_ud.evento_comp) and  (nvl(q35_dati_comp.stu_freq_flg_comp,999)=q35_num_quest_cds_doc_ud.stu_freq_flg_comp) and  (nvl(q35_dati_comp.stu_no_aut_flg_comp,999)=q35_num_quest_cds_doc_ud.stu_no_aut_flg_comp)) left outer join q35_doc_ad_val_dip_afferenza on (q35_doc_ad_val_dip_afferenza.dip_id = q35_docente_ad_val.dip_id) left outer join q35_ud_tipo_copertura on ((q35_dati_comp.aa_off_ad_id_val = q35_ud_tipo_copertura.aa_off_id) and (q35_dati_comp.aa_ord_ad_id_val = q35_ud_tipo_copertura.aa_ord_id) and (q35_dati_comp.ad_id_val = q35_ud_tipo_copertura.ad_id) and (q35_dati_comp.cds_ad_id_val = q35_ud_tipo_copertura.cds_id) and (q35_dati_comp.doc_ad_id_val = q35_ud_tipo_copertura.docente_id) and (q35_dati_comp.pds_ad_id_val = q35_ud_tipo_copertura.pds_id) and (q35_dati_comp.ud_id_val = q35_ud_tipo_copertura.ud_id)) where ((p02_quesiti.questionario_id = 35) and ((q35_dati_comp.aa_off_ad_id_val = '2013') and (q35_dati_comp.dataora_comp < cast('2013-12-31 00:00:00' as date))) or ((q35_dati_comp.aa_off_ad_id_val = '2014') and (q35_dati_comp.dataora_comp < cast('2014-12-31 00:00:00' as date))) or ((q35_dati_comp.aa_off_ad_id_val = '2015') and (q35_dati_comp.dataora_comp < cast('2015-12-31 00:00:00' as date))) or ((q35_dati_comp.aa_off_ad_id_val = '2016') and (q35_dati_comp.dataora_comp < cast('2016-12-31 00:00:00' as date)))) group by q35_dati_comp.aa_off_ad_id_val order by q35_dati_comp.aa_off_ad_id_val")

q1.show()

print(time.time()-start)
