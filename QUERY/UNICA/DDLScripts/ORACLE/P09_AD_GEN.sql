CREATE TABLE "P09_AD_GEN" 
   (	"AD_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DES" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"RIF_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"TIPO_ENTITA" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"EXT_CODE" VARCHAR2(400 CHAR), 
	"PESO" NUMBER(5,2), 
	 CONSTRAINT "XPKP09_AD_GEN" PRIMARY KEY ("AD_ID"),
  	 CONSTRAINT "C_P09ADGEN_004" CHECK (Rif_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P09ADGEN_009" CHECK (TIPO_ENTITA IN (0, 1, 2)) ENABLE, 
	 CONSTRAINT "XAKP09_AD_GEN" UNIQUE ("COD"));
 
   COMMENT ON COLUMN "P09_AD_GEN"."AD_ID" IS 'ID dell´attività didattica.';
   COMMENT ON COLUMN "P09_AD_GEN"."COD" IS 'Codice dell´attività didattica.';
   COMMENT ON COLUMN "P09_AD_GEN"."DES" IS 'Descrizione dell´attività didattica.';
   COMMENT ON COLUMN "P09_AD_GEN"."RIF_FLG" IS 'OBSOLETO.';
   COMMENT ON COLUMN "P09_AD_GEN"."USR_INS_ID" IS 'Utente di inserimento.';
   COMMENT ON COLUMN "P09_AD_GEN"."DATA_INS" IS 'Data di inserimento.';
   COMMENT ON COLUMN "P09_AD_GEN"."USR_MOD_ID" IS 'Utente di ultima modifica.';
   COMMENT ON COLUMN "P09_AD_GEN"."DATA_MOD" IS 'Data di ultima modifica.';
   COMMENT ON COLUMN "P09_AD_GEN"."TIPO_ENTITA" IS 'Tipo di uso dell´entità (attività/unità):
0 = SOLO AD
1 = SOLO UD
2 = ENTRAMBI';
   COMMENT ON COLUMN "P09_AD_GEN"."PESO" IS 'Questo attributo contiene il numero di crediti fissi associati alla attività didattica.';
   COMMENT ON TABLE "P09_AD_GEN"  IS 'Questa entità contiene l´anagrafica delle attività didattiche (codice e nome).
Tali attività non variano al variare dell´anno accademico e del corso di studio; ad esse sono associate i settori e/o le discipline.';