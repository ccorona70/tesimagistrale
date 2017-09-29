
  CREATE TABLE "DOCENTI" 
   (	"DOCENTE_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"SETT_COD" VARCHAR2(12 CHAR), 
	"MATRICOLA" VARCHAR2(10 CHAR), 
	"FAC_ID" NUMBER(10,0), 
	"DIP_ID" NUMBER(10,0), 
	"ORIG_DATO_COD" VARCHAR2(10 CHAR), 
	"RUOLO_DOC_COD" VARCHAR2(10 CHAR), 
	"APPELLATIVO" VARCHAR2(40 CHAR), 
	"NOMINATIVO_ALT" VARCHAR2(110 CHAR), 
	"DATA_INI_ATT" DATE, 
	"DATA_FIN_ATT" DATE, 
	"NAZI_NASC_ID" NUMBER(5,0), 
	"COM_NASC_ID" NUMBER(10,0), 
	"LOCALITA_NASC_ID" NUMBER(10,0), 
	"CITSTRA_NASC" VARCHAR2(80 CHAR), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"FIRMA_ID" NUMBER(10,0), 
	"DATA_INI_RUOLO" DATE, 
	"ATENEO_ID" NUMBER(10,0), 
	"ID_AB" NUMBER(10,0), 
	"OPER_CELLULARE" NUMBER(2,0), 
	"CONS_SMS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"PROFILO" VARCHAR2(20 CHAR), 
	 CONSTRAINT "C_DOCENTI_035" CHECK (CONS_SMS_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKDOCENTI" PRIMARY KEY ("DOCENTE_ID"),
 	 CONSTRAINT "XAKDOCENTI_MATRICOLA" UNIQUE ("MATRICOLA"));
 
   COMMENT ON COLUMN "DOCENTI"."DOCENTE_ID" IS 'ID numerico unico del docente';
   COMMENT ON COLUMN "DOCENTI"."SETT_COD" IS 'Codice settore scientifico disciplinare';
   COMMENT ON COLUMN "DOCENTI"."MATRICOLA" IS 'Matricola docente';
   COMMENT ON COLUMN "DOCENTI"."COGNOME" IS 'Cognome docente (inserito sempre in maiuscolo).';
   COMMENT ON COLUMN "DOCENTI"."NOME" IS 'Nome docente (inserito sempre in maiuscolo).';
   COMMENT ON COLUMN "DOCENTI"."BADGE" IS 'Numero badge';
   COMMENT ON COLUMN "DOCENTI"."E_MAIL" IS 'Indirizzo di posta elettronica pubblica, ossia visulizzato nel web e stampato nei vari documenti (es. Guida studente)';
   COMMENT ON COLUMN "DOCENTI"."FAC_ID" IS 'ID facoltà di appartenenza';
   COMMENT ON COLUMN "DOCENTI"."DIP_ID" IS 'ID numerico univoco del dipartimento';
   COMMENT ON COLUMN "DOCENTI"."ORIG_DATO_COD" IS 'Codice Origine Dato. Indica la funzione applicativa o il sistema che ha inserito il dato (es. WEBDOMCT - Domanda di Conseguimento titolo via WEB)';
   COMMENT ON COLUMN "DOCENTI"."RUOLO_DOC_COD" IS 'Codice ruolo docente. Codici di sistema ORD - Ordinario, ASS - Associato, RIC - Ricercatore. Più eventuali altri codici non di sistema';
   COMMENT ON COLUMN "DOCENTI"."COD_FIS" IS 'Codice Fiscale';
   COMMENT ON COLUMN "DOCENTI"."CELLULARE" IS 'Numero di cellulare.';
   COMMENT ON COLUMN "DOCENTI"."HYPERLINK" IS 'Link ipertestuale per i docenti';
   COMMENT ON COLUMN "DOCENTI"."APPELLATIVO" IS 'Appellativo del titolo del docente (es: Dott., Dott.sa, ecc.).';
   COMMENT ON COLUMN "DOCENTI"."NOMINATIVO_ALT" IS 'Nominativo alternativo del docente in modalità case sensitive. Valorizzato solo se relativo parametro di configurazione attivo. Viene utilizzato solo per le personalizzazioni, nello standard vengono sempre utilizzati cognome e nome.';
   COMMENT ON COLUMN "DOCENTI"."DATA_INI_ATT" IS 'Data di inizio attivazione del docente. Se non valorizzato si considera il docente attivo da sempre.';
   COMMENT ON COLUMN "DOCENTI"."DATA_FIN_ATT" IS 'Data di fine attivazione del docente. Se non valorizzato si considera il docente ancora attivo.';
   COMMENT ON COLUMN "DOCENTI"."SESSO" IS 'M = maschio, F = femmina';
   COMMENT ON COLUMN "DOCENTI"."DATA_NASCITA" IS 'Data di nascita.';
   COMMENT ON COLUMN "DOCENTI"."NAZI_NASC_ID" IS 'ID nazione di nascita.';
   COMMENT ON COLUMN "DOCENTI"."COM_NASC_ID" IS 'ID comune di nascita. Abilitato solo se Naz_Nasc_ID è Italia.';
   COMMENT ON COLUMN "DOCENTI"."LOCALITA_NASC_ID" IS 'ID località di nascita.';
   COMMENT ON COLUMN "DOCENTI"."CITSTRA_NASC" IS 'Nome città straniera di nascita. Abilitato solo se Naz_Nasc_ID non è Italia.';
   COMMENT ON COLUMN "DOCENTI"."USR_INS_ID" IS 'Utente che ha inserito il record.';
   COMMENT ON COLUMN "DOCENTI"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "DOCENTI"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record.';
   COMMENT ON COLUMN "DOCENTI"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON COLUMN "DOCENTI"."DOCENTE_NOME" IS 'OBSOLETO!';
   COMMENT ON COLUMN "DOCENTI"."FIRMA_ID" IS 'Identificativo univoco';
   COMMENT ON COLUMN "DOCENTI"."DATA_INI_RUOLO" IS 'Data inizio ruolo docente attuale (ovvero il campo ruolo_doc_cod).';
   COMMENT ON COLUMN "DOCENTI"."ATENEO_ID" IS 'ID numerico univoco';
   COMMENT ON COLUMN "DOCENTI"."ID_AB" IS 'ID address book della persona in UGOV';
   COMMENT ON COLUMN "DOCENTI"."OPER_CELLULARE" IS 'Codice operatore cellulare.';
   COMMENT ON COLUMN "DOCENTI"."CONS_SMS_FLG" IS 'Consenso alla notifica tramite messaggistica SMS.';
   COMMENT ON COLUMN "DOCENTI"."PROFILO" IS 'Profilo docente';
   COMMENT ON TABLE "DOCENTI"  IS 'Docenti. Le principali informazioni dono quelle anagrafiche (Cognome, Nome, Codice Fiscale, Cellulare, e-mail), Matricola, Ruolo (Ordinario,  Associato, Ricercatore). Facoltà e Dipartimento e Settore Scientifico Disciplinare di appartenenza.
Collegata a questa tabella sono presenti altre due tabelle di estensione: DOCENTI_RECAPITI e DOCENTE_NOTE.';

  CREATE INDEX "XIF_DOCENTI_P01CM_01" ON "DOCENTI" ("COM_NASC_ID");
  CREATE INDEX "XIF_DOCENTI_P01FRM_01" ON "DOCENTI" ("FIRMA_ID"); 
  CREATE INDEX "XIF_DOCENTI_P01LCLT_01" ON "DOCENTI" ("LOCALITA_NASC_ID");
  CREATE INDEX "XIF_DOCENTI_P01NZ_01" ON "DOCENTI" ("NAZI_NASC_ID");
  CREATE INDEX "XIF_DOCENTI_P01PRCLLLR_01" ON "DOCENTI" ("OPER_CELLULARE");
  CREATE INDEX "XIF_DOCENTI_P06DP_01" ON "DOCENTI" ("DIP_ID");
  CREATE INDEX "XIF_DOCENTI_P06FC_01" ON "DOCENTI" ("FAC_ID");
  CREATE INDEX "XIF_DOCENTI_P06TN_01" ON "DOCENTI" ("ATENEO_ID");
  CREATE INDEX "XIF_DOCENTI_P07STT_01" ON "DOCENTI" ("SETT_COD");
  CREATE INDEX "XIF_DOCENTI_RGDT_01" ON "DOCENTI" ("ORIG_DATO_COD");
  CREATE INDEX "XIF_DOCENTI_RLDC_01" ON "DOCENTI" ("RUOLO_DOC_COD");
 
