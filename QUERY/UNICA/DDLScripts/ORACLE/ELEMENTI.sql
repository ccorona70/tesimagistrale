CREATE TABLE "ELEMENTI" 
   (	"ELEM_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DES" VARCHAR2(1000 CHAR), 
	"TIPO_ELEM_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"NOTA" VARCHAR2(2000 CHAR), 
	"CONT_COD" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"TIPO_VINC_ASSIST_ID" NUMBER(10,0), 
	"TIPO_VINC_ASSIST_DETT_ID" NUMBER(10,0), 
	 CONSTRAINT "XPKELEMENTI" PRIMARY KEY ("ELEM_COD");

   COMMENT ON TABLE "ELEMENTI"  IS 'Tabella generica di elementi.
Utilizzata nella gestione delle azioni certificabili durante un periodo di tirocinio per indicare:
- le possibili azioni certificabili
- le proprietà di tali azioni che dovranno essere indicate
- i domini di tali proprietà.
La struttura (anche multilivello) di azioni-proprietà deve essere configurata tramite apposite tabelle.
Nel caso dei tirocini la tabella preposta è la P06_AZIONI_TIRO.';

  CREATE INDEX "XIF_ELEMENTI_P06CNTST_01" ON "ELEMENTI" ("CONT_COD");
  CREATE INDEX "XIF_ELEMENTI_TPLM_01" ON "ELEMENTI" ("TIPO_ELEM_COD");
  CREATE INDEX "XIF_ELEMENTI_TPVNCSSST_01" ON "ELEMENTI" ("TIPO_VINC_ASSIST_DETT_ID");
  CREATE INDEX "XIF_ELEMENTI_TPVNCSSST_02" ON "ELEMENTI" ("TIPO_VINC_ASSIST_ID");



