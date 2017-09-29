CREATE TABLE "P02_TIPI_FORMATO" 
   (	"TIPO_FORMATO_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DES" VARCHAR2(80 CHAR) NOT NULL ENABLE, 
	"TIPO_ELEM_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"SYS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	 CONSTRAINT "XPKP02_TIPI_FORMATO" PRIMARY KEY ("TIPO_FORMATO_COD"));
;

   COMMENT ON COLUMN "P02_TIPI_FORMATO"."TIPO_FORMATO_COD" IS 'Codice Tipo formato da utilizzare nei questionari';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."DES" IS 'Descrizione Tipo formato da utilizzare nei questionari';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."TIPO_ELEM_COD" IS 'Codice della tipologia di elemento.';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."SYS_FLG" IS 'Indica se record utilizzato dal sistema, non eliminare o modificare: 1 = di sistema, 0 = inserito dall´operatore.';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."USR_INS_ID" IS 'Utente che ha inserito il record';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record';
   COMMENT ON COLUMN "P02_TIPI_FORMATO"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON TABLE "P02_TIPI_FORMATO"  IS 'Tipi di formato da utilizzare per il layout dei quesiti dei questionari';

  CREATE INDEX "XIF_P02TIPIFORMATO_TPLM_01" ON "P02_TIPI_FORMATO" ("TIPO_ELEM_COD");

