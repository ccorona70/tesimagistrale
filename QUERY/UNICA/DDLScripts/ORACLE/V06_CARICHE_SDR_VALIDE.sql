CREATE TABLE "V06_CARICHE_SDR_VALIDE" (
"SDR_ID" NUMBER(10,0), 
"CARICA_ID" NUMBER(10,0), 
"SDR_TIP" VARCHAR2(5 CHAR), 
"STRUTT_ID" NUMBER(10,0), 
"COD" VARCHAR2(10 CHAR), 
"DES" VARCHAR2(300 CHAR), 
"DES_CARICA" VARCHAR2(255 CHAR), 
"DATA_INIZIO_VAL" DATE, 
"DATA_FINE_VAL" DATE, 
"TIPO_SOGG" VARCHAR2(10 CHAR), 
"APPELLATIVO" VARCHAR2(40 CHAR), 
"ID_AB" NUMBER, 
"MATRICOLA_DOCENTE" VARCHAR2(10 CHAR), 
"CARICA_SDR_ID" NUMBER(10,0), 
"CARICA_DES_LIN_ID" NUMBER(10,0), 
"CARICA_SDR_RESP_ID" NUMBER(10,0));

CREATE INDEX "IDX1_V06_CARICHE_SDR_VALIDE" ON "V06_CARICHE_SDR_VALIDE" ("STRUTT_ID");



 
  