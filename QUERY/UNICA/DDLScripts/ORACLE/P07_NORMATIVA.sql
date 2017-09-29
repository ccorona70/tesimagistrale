CREATE TABLE "P07_NORMATIVA" 
   (	"NORM_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NORM_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DES" VARCHAR2(255 CHAR), 
	"NOTE" VARCHAR2(2000 BYTE), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	 CONSTRAINT "XAKP07_NORMATIVA" UNIQUE ("NORM_COD"),
	 CONSTRAINT "XPKP07_NORMATIVA" PRIMARY KEY ("NORM_ID")); 

   COMMENT ON COLUMN "P07_NORMATIVA"."NORM_ID" IS 'Identificativo univoco della Normativa di riferimento per la riforma universitaria. Da questa normativa derivano le classi di laurea e l''istituzione dei corsi di studio';
   COMMENT ON COLUMN "P07_NORMATIVA"."NORM_COD" IS 'Codice Normativa (codice breve alfanumerico):
DM509/1999
DM270/2004';
   COMMENT ON COLUMN "P07_NORMATIVA"."DES" IS 'Descrizione estesa della Normativa';
   COMMENT ON COLUMN "P07_NORMATIVA"."NOTE" IS 'Note';
   COMMENT ON COLUMN "P07_NORMATIVA"."USR_INS_ID" IS 'Identificativo dell''utente che ha inserito il record';
   COMMENT ON COLUMN "P07_NORMATIVA"."DATA_INS" IS 'Data di inserimento del record';
   COMMENT ON COLUMN "P07_NORMATIVA"."USR_MOD_ID" IS 'Identificativo dell''utente che ha modificato il record';
   COMMENT ON COLUMN "P07_NORMATIVA"."DATA_MOD" IS 'Data di modifica del record';
   COMMENT ON TABLE "P07_NORMATIVA"  IS 'Normativa di riferimento per le classi e i corsi di studio.
Contiene due valori di riferimento:
1) ANTE RIFORMA (solo se RIF_FLG=1)
2) DM509/1999
3) DM270/2004';