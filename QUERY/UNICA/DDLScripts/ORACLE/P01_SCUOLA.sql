 CREATE TABLE "P01_SCUOLA" 
   (	"SCUOLA_SUP_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"DES" VARCHAR2(255 CHAR), 
	"TIPOLOGIA_COD" VARCHAR2(10 CHAR), 
	"VIA" VARCHAR2(100 CHAR), 
	"NUMERO_CIVICO" VARCHAR2(20 CHAR), 
	"CAP" VARCHAR2(5 CHAR), 
	"TELEFONO" VARCHAR2(14 CHAR), 
	"FAX" VARCHAR2(14 CHAR), 
	"LOCALITA" VARCHAR2(100 CHAR), 
	"COD_MIUR" VARCHAR2(10 CHAR), 
	"COMUNE_ID" NUMBER(10,0), 
	"EMAIL" VARCHAR2(100 CHAR), 
	"COD_ATENEO" VARCHAR2(10 CHAR), 
	"EMAIL_MINIST" VARCHAR2(100 CHAR), 
	"COD_UNIVERSO" VARCHAR2(10 CHAR), 
	"IST_RIF_ID" NUMBER(10,0), 
	"NUOVO_IST_ID" NUMBER(10,0), 
	"TIPI_IST_ID" NUMBER(5,0), 
	"SCUOLA_NON_STAT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DISTRETTO" VARCHAR2(5 CHAR), 
	"NUOVO_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CANC_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"AA_INI_VAL" NUMBER(4,0), 
	"AA_FINE_VAL" NUMBER(4,0), 
	"ID_SCUOLA_MIUR" NUMBER(10,0), 
	"WEB_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"NO_AGGIORNA_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 BYTE), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 BYTE), 
	"DATA_MOD" DATE, 
	"NOTE" VARCHAR2(2000 BYTE), 
	"NOTE_CRONOLOGIA" VARCHAR2(4000 BYTE), 
	"SYS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "XPKP01_SCUOLA" PRIMARY KEY ("SCUOLA_SUP_ID"),
	 CONSTRAINT "C_P01SCUOLA_022" CHECK (CANC_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P01SCUOLA_021" CHECK (NUOVO_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P01SCUOLA_019" CHECK (SCUOLA_NON_STAT_FLG BETWEEN 0 AND 1);
 
   COMMENT ON COLUMN "P01_SCUOLA"."SCUOLA_SUP_ID" IS 'ID numerico della scuola superiore';
   COMMENT ON COLUMN "P01_SCUOLA"."DES" IS 'Descrizione';
   COMMENT ON COLUMN "P01_SCUOLA"."TIPOLOGIA_COD" IS 'Codice della tipologia';
   COMMENT ON COLUMN "P01_SCUOLA"."VIA" IS 'Indirizzo.';
   COMMENT ON COLUMN "P01_SCUOLA"."NUMERO_CIVICO" IS 'Numero civico.';
   COMMENT ON COLUMN "P01_SCUOLA"."CAP" IS 'CAP.';
   COMMENT ON COLUMN "P01_SCUOLA"."TELEFONO" IS 'Numero di telefono.';
   COMMENT ON COLUMN "P01_SCUOLA"."FAX" IS 'Numero di fax.';
   COMMENT ON COLUMN "P01_SCUOLA"."LOCALITA" IS 'Località.';
   COMMENT ON COLUMN "P01_SCUOLA"."COD_MIUR" IS 'Il codice attributo dal sistema informativo del Ministero dell´Istruzione è di 10 caratteri: la sigla della città di appartenenza, seguita da due lettere che indicano la tipologia (ad esempio PC per Liceo classico, TL per Istituto tecnico per geometri, ...) e da sei caratteri - i primi cinque sono sempre numeri, mentre il sesto è un numero o una lettera.';
   COMMENT ON COLUMN "P01_SCUOLA"."COMUNE_ID" IS 'Identificativo comune.';
   COMMENT ON COLUMN "P01_SCUOLA"."EMAIL" IS 'E-mail.';
   COMMENT ON COLUMN "P01_SCUOLA"."COD_ATENEO" IS 'Vecchio codice della scuola utilizzato dall´ateneo.';
   COMMENT ON COLUMN "P01_SCUOLA"."EMAIL_MINIST" IS 'E-mail ministeriale.';
   COMMENT ON COLUMN "P01_SCUOLA"."COD_UNIVERSO" IS 'Identificativo della scuola utilizzato dal MURST per passare le informazioni relative alla pre-iscrizione.';
   COMMENT ON COLUMN "P01_SCUOLA"."IST_RIF_ID" IS 'Riporta il codice dell´istituto principale - presente solo per scuole STATALI.';
   COMMENT ON COLUMN "P01_SCUOLA"."NUOVO_IST_ID" IS 'Riporta il codice del nuovo istituto nel caso di scuole superiori chiuse.';
   COMMENT ON COLUMN "P01_SCUOLA"."TIPI_IST_ID" IS '1 --> CORSO SERALE
2 --> ISTITUTO PRINCIPALE
3 --> ISTITUZIONE EDUCAT.
4 --> SCUOLA COORDINATA
5 --> SEZIONE STACCATA';
   COMMENT ON COLUMN "P01_SCUOLA"."SCUOLA_NON_STAT_FLG" IS 'Se 0 la scuola è statale se 1 la scuola è non statale.';
   COMMENT ON COLUMN "P01_SCUOLA"."DISTRETTO" IS 'Distretto.';
   COMMENT ON COLUMN "P01_SCUOLA"."NUOVO_FLG" IS 'Nuovo istituto.';
   COMMENT ON COLUMN "P01_SCUOLA"."CANC_FLG" IS 'Obsoleto.';
   COMMENT ON COLUMN "P01_SCUOLA"."AA_INI_VAL" IS 'Anno inizio validità scuola - gestione obsolescenza.';
   COMMENT ON COLUMN "P01_SCUOLA"."AA_FINE_VAL" IS 'Anno fine validità scuola - gestione obsolescenza.';
   COMMENT ON COLUMN "P01_SCUOLA"."ID_SCUOLA_MIUR" IS 'Identificativo scuola MIUR.';
   COMMENT ON COLUMN "P01_SCUOLA"."WEB_FLG" IS 'Indica la visibilità da web di questo istituto';
   COMMENT ON COLUMN "P01_SCUOLA"."NO_AGGIORNA_FLG" IS 'Se alzato, indica che la scuola superiore verrà esclusa dall''aggiornamento dei dati anagrafici.';
   COMMENT ON COLUMN "P01_SCUOLA"."USR_INS_ID" IS 'Utente di inserimento';
   COMMENT ON COLUMN "P01_SCUOLA"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P01_SCUOLA"."USR_MOD_ID" IS 'Utente di ultima modifica.';
   COMMENT ON COLUMN "P01_SCUOLA"."DATA_MOD" IS 'Data di ultima modifica';
   COMMENT ON COLUMN "P01_SCUOLA"."NOTE" IS 'Campo note';
   COMMENT ON COLUMN "P01_SCUOLA"."NOTE_CRONOLOGIA" IS 'Campo note che tiene traccia di eventuali interventi di riunificazione avvenuti';
   COMMENT ON COLUMN "P01_SCUOLA"."SYS_FLG" IS 'Se alzato, indica che l''inserimento dell''Ateneo è certificato dalle procedure di sistema o dalla migrazione nuova di UNIBASE.';
   COMMENT ON TABLE "P01_SCUOLA"  IS 'Anagrafica scuole superiori';

  CREATE INDEX "XIF_P01SCUOLA_MRSCL_01" ON "P01_SCUOLA" ("ID_SCUOLA_MIUR");
  CREATE INDEX "XIF_P01SCUOLA_P01CM_01" ON "P01_SCUOLA" ("COMUNE_ID");
  CREATE INDEX "XIF_P01SCUOLA_TPSTSP_01" ON "P01_SCUOLA" ("TIPOLOGIA_COD");
  CREATE INDEX "XIF_P01SCUOLA_TPST_01" ON "P01_SCUOLA" ("TIPI_IST_ID");
