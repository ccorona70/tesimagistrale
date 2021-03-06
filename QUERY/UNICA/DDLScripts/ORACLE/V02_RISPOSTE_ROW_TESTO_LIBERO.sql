CREATE TABLE "V02_RISPOSTE_ROW_TESTO_LIBERO" (
 "RISPOSTA_ID" NUMBER(10,0), 
 "QUESITO_ID" NUMBER(10,0), 
 "QUEST_COMP_ID" NUMBER(10,0), 
 "USR_INS_ID" VARCHAR2(20 CHAR), 
 "DATA_INS" DATE, 
 "USR_MOD_ID" VARCHAR2(20 CHAR), 
 "DATA_MOD" DATE, 
 "N_RIGA_TESTO_LIBERO" NUMBER, 
 "RIGA_TESTO_LIBERO" VARCHAR2(1500 CHAR));
 
  CREATE INDEX "IDX1_V02_RISPOSTE_ROW_TESTO_LIBERO" ON "V02_RISPOSTE_ROW_TESTO_LIBERO" ("RISPOSTA_ID");