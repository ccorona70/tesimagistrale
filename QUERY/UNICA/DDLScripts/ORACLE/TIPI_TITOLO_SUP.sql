 CREATE TABLE "TIPI_TITOLO_SUP" 
   (	"TIPO_TITOLO_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"ID_MACRO_TIPO" NUMBER(3,0), 
	"ID_TIPO_IST" NUMBER(3,0), 
	"ID_TITOLO" NUMBER(3,0), 
	"TIPOLOGIA_COD" VARCHAR2(10 CHAR), 
	"DES" VARCHAR2(255 CHAR), 
	"SYS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"ID_DIPLOMA" NUMBER(10,0), 
	"ALMA_COD" NUMBER(2,0), 
	"ANNO_INT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"ABIL_VIS_FLG" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	 CONSTRAINT "C_TIPITITOLOSUP_010" CHECK (ANNO_INT_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKTIPI_TITOLO_SUP" PRIMARY KEY ("TIPO_TITOLO_COD"),
	 CONSTRAINT "C_TIPITITOLOSUP_007" CHECK (sys_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPITITOLOSUP_011" CHECK ( ABIL_VIS_FLG BETWEEN 0 AND 1) ENABLE);
	 
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."TIPO_TITOLO_COD" IS 'Codice MIUR del tipo di titolo superiore';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ID_MACRO_TIPO" IS 'OBSOLETO';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ID_TIPO_IST" IS 'OBSOLETO';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ID_TITOLO" IS 'OBSOLETO';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."TIPOLOGIA_COD" IS 'IPI    Istituti professionali industirali
IPC    Istituti professionali commerciali
AMP    Altre maturità professionali
ITI    Istituti tecnici industriali
ITC    Istituti tecnici commerciali
AIT    Altri istituti tecnici
AMT    Altre maturità tecniche
MAG    Istituti magistrali
LS    Liceo scientifico
LC    Liceo classico
LING    Liceo linguistico
ARTE    Scuole d´arte';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."DES" IS 'Descrizione della tipologia del titolo di studio di scuola superiore conseguito.';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."SYS_FLG" IS 'Flag attributo di sistema, non modificabile';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ID_DIPLOMA" IS 'Identificativo diploma MIUR';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ALMA_COD" IS 'Codice ISTAT Alma Laurea';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ANNO_INT_FLG" IS 'Indicatore di gestione anno integrativo.';
   COMMENT ON COLUMN "TIPI_TITOLO_SUP"."ABIL_VIS_FLG" IS 'Abilitazione visualizzazione on-line nella gestione dei titoli di accesso e dell''anagrafica titoli.';
   COMMENT ON TABLE "TIPI_TITOLO_SUP"  IS 'Tipologie dei titoli di scuola superiore';

  CREATE INDEX "XIF_TIPITITOLOSUP_MRTPDPLM_01" ON "TIPI_TITOLO_SUP" ("ID_DIPLOMA");
  CREATE INDEX "XIF_TIPITITOLOSUP_TPSTSP_01" ON "TIPI_TITOLO_SUP" ("TIPOLOGIA_COD");
