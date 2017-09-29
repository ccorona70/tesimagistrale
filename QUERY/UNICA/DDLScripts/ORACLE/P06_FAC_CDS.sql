 CREATE TABLE "P06_FAC_CDS" 
   (	"FAC_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"CDS_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"DEF_REG_CT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DEF_AMM_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DEF_STAT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"AA_INI_VAL" NUMBER(4,0), 
	"AA_FINE_VAL" NUMBER(10,0), 
	"NOTE" VARCHAR2(2000 BYTE), 
	"ANN_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"OLD_DEF_REG_CT_FLG" NUMBER(1,0), 
	"OLD_DEF_AMM_FLG" NUMBER(1,0), 
	"OLD_DEF_STAT_FLG" NUMBER(1,0), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	 CONSTRAINT "C_P06FACCDS_009" CHECK (ANN_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06FACCDS_005" CHECK (def_stat_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKP06_FAC_CDS" PRIMARY KEY ("CDS_ID", "FAC_ID"),
	 CONSTRAINT "C_P06FACCDS_004" CHECK (DEF_AMM_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06FACCDS_003" CHECK (DEF_REG_CT_FLG BETWEEN 0 AND 1) ENABLE);
 

   COMMENT ON COLUMN "P06_FAC_CDS"."FAC_ID" IS 'ID della Facoltà.';
   COMMENT ON COLUMN "P06_FAC_CDS"."CDS_ID" IS 'ID del Corso di Studio';
   COMMENT ON COLUMN "P06_FAC_CDS"."DEF_REG_CT_FLG" IS 'Indicatore facoltà di default area didatticata per il CDS, è obbligatorio che una facoltà associata alla facoltà abbia il flag a 1.
(DEFAULT facoltà per la definizione delle Regole Conseguimento Titolo). La valorizzazione a 1 è consentita solo per facoltà non annullata, altrimenti usare, per la storicizzazione, il campo OLD.';
   COMMENT ON COLUMN "P06_FAC_CDS"."DEF_AMM_FLG" IS 'Indicatore facoltà di default area amministrativa per il CDS, è obbligatorio che una facoltà associata alla facoltà abbia il flag a 1. La valorizzazione a 1 è consentita solo per facoltà non annullata, altrimenti usare, per la storicizzazione, il campo OLD.';
   COMMENT ON COLUMN "P06_FAC_CDS"."DEF_STAT_FLG" IS 'Indicatore facoltà di default per l`area statistiche per il CDS, è obbligatorio che una facoltà associata al corso abbia il flag a 1. La valorizzazione a 1 è consentita solo per facoltà non annullata, altrimenti usare, per la storicizzazione, il campo OLD.';
   COMMENT ON COLUMN "P06_FAC_CDS"."AA_INI_VAL" IS 'Anno accademico di inizio validità (da valorizzarsi obbligatoriamente se la facoltà è annullata)';
   COMMENT ON COLUMN "P06_FAC_CDS"."AA_FINE_VAL" IS 'Anno accademico di fine validità (da valorizzarsi obbligatoriamente se la facoltà è annullata)';
   COMMENT ON COLUMN "P06_FAC_CDS"."NOTE" IS 'Note';
   COMMENT ON COLUMN "P06_FAC_CDS"."ANN_FLG" IS 'Se alzato, indica che la facoltà non è più valida';
   COMMENT ON COLUMN "P06_FAC_CDS"."OLD_DEF_REG_CT_FLG" IS 'Campo di storicizzazione, da usarsi solo per facoltà annullata e quindi ora non più valida, altrimenti da lasciare nullo (per facoltà attiva).';
   COMMENT ON COLUMN "P06_FAC_CDS"."OLD_DEF_AMM_FLG" IS 'Campo di storicizzazione, da usarsi solo per facoltà annullata e quindi ora non più valida, altrimenti da lasciare nullo (per facoltà attiva).';
   COMMENT ON COLUMN "P06_FAC_CDS"."OLD_DEF_STAT_FLG" IS 'Campo di storicizzazione, da usarsi solo per facoltà annullata e quindi ora non più valida, altrimenti da lasciare nullo (per facoltà attiva).';
   COMMENT ON COLUMN "P06_FAC_CDS"."USR_INS_ID" IS 'Utente che ha inserito il record';
   COMMENT ON COLUMN "P06_FAC_CDS"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P06_FAC_CDS"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record';
   COMMENT ON COLUMN "P06_FAC_CDS"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON TABLE "P06_FAC_CDS"  IS 'Relazione tra Facoltà e Corsi di studio';

  CREATE INDEX "IDX$$_CD29000C" ON "P06_FAC_CDS" ("CDS_ID", "DEF_AMM_FLG", "FAC_ID");
  CREATE INDEX "XIF_P06FACCDS_P06CDS_01" ON "P06_FAC_CDS" ("CDS_ID");
  CREATE INDEX "XIF_P06FACCDS_P06FC_01" ON "P06_FAC_CDS" ("FAC_ID");
  
