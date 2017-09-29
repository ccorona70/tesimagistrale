 CREATE TABLE "P09_UD_CDS" 
   (	"UD_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"CDS_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"AA_OFF_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"AD_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"DES" VARCHAR2(255 CHAR), 
	"COD" VARCHAR2(20 CHAR), 
	"PROGR_URL" VARCHAR2(255 CHAR), 
	"TIPO_UD_COD" VARCHAR2(10 CHAR), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	 CONSTRAINT "XPKP09_UD_CDS" PRIMARY KEY ("AD_ID", "CDS_ID", "AA_OFF_ID", "UD_ID"));
 
   COMMENT ON COLUMN "P09_UD_CDS"."UD_ID" IS 'ID dell´Unità Didattica.';
   COMMENT ON COLUMN "P09_UD_CDS"."CDS_ID" IS 'ID del Corso di Studio.';
   COMMENT ON COLUMN "P09_UD_CDS"."AA_OFF_ID" IS 'ID dell''''Anno Accademico.';
   COMMENT ON COLUMN "P09_UD_CDS"."AD_ID" IS 'ID dell´attività didattica.';
   COMMENT ON COLUMN "P09_UD_CDS"."DES" IS 'Descrizione dell´unità didattica.';
   COMMENT ON COLUMN "P09_UD_CDS"."COD" IS 'Codice dell´unità didattica.';
   COMMENT ON COLUMN "P09_UD_CDS"."PROGR_URL" IS 'OBSOLETO.';
   COMMENT ON COLUMN "P09_UD_CDS"."TIPO_UD_COD" IS 'Tipo unità didattica, ad esempio modulo, corso, seminario.
Obbligatorio se, nelle regole di scelta, la AD prevede la selezione di moduli di un particolare tipo.';
   COMMENT ON COLUMN "P09_UD_CDS"."USR_INS_ID" IS 'Utente di inserimento.';
   COMMENT ON COLUMN "P09_UD_CDS"."DATA_INS" IS 'Data di inserimento.';
   COMMENT ON COLUMN "P09_UD_CDS"."USR_MOD_ID" IS 'Utente di ultima modifica.';
   COMMENT ON COLUMN "P09_UD_CDS"."DATA_MOD" IS 'Data di ultima modifica.';
   COMMENT ON TABLE "P09_UD_CDS"  IS 'Questa entità contiene le informazioni relative alle unità didattiche associate alle attività didattiche offerte in un determinato anno accademico, relativamente ad un corso di studio, a prescindere dall´ordinamento e dal percorso';

  CREATE INDEX "XIF_P09UDCDS_P09DCDS_01" ON "P09_UD_CDS" ("CDS_ID", "AD_ID", "AA_OFF_ID");
  CREATE INDEX "XIF_P09UDCDS_TPD_01" ON "P09_UD_CDS" ("TIPO_UD_COD");
