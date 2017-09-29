CREATE TABLE "P06_FAC" 
   (	"FAC_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"ISTAT_COD" VARCHAR2(10 CHAR), 
	"COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DES" VARCHAR2(255 CHAR), 
	"ATENEO_ID" NUMBER(10,0), 
	"CITTA" VARCHAR2(40 CHAR), 
	"VIA" VARCHAR2(40 CHAR), 
	"PROV" VARCHAR2(4 CHAR), 
	"CAP" VARCHAR2(5 CHAR), 
	"CF" VARCHAR2(30 CHAR), 
	"PRESDIR" VARCHAR2(40 CHAR), 
	"FIRMA_CERT" VARCHAR2(40 CHAR), 
	"AA_ATT_ID" NUMBER(10,0), 
	"AA_DIS_ID" NUMBER(10,0), 
	"SYS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"URL_SITO_WEB" VARCHAR2(255 CHAR), 
	"WEB_VIEW_FLG" NUMBER(1,0) DEFAULT 1, 
	"COMUNE_ID" NUMBER(10,0), 
	"TEL" VARCHAR2(30 CHAR), 
	"FAX" VARCHAR2(30 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"DES_CERT" VARCHAR2(255 CHAR), 
	"COD_STAT_MIUR" VARCHAR2(10 CHAR) DEFAULT 'XX' NOT NULL ENABLE, 
	"ACRONIMO_FAC" VARCHAR2(5 CHAR), 
	"CSA_COD" VARCHAR2(6 CHAR), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"DEF_APPELLI_WEB" NUMBER(1,0) DEFAULT 2, 
	"COD_FACOLTA" VARCHAR2(10 CHAR), 
	"NOTE" VARCHAR2(2000 CHAR), 
	"DES_BREVE" VARCHAR2(50 CHAR), 
	"SDR_TIP" VARCHAR2(5 CHAR) DEFAULT 'FAC' NOT NULL ENABLE, 
	"TMP_ID" NUMBER(10,0), 
	"DES_CERT_GENIT" VARCHAR2(255 CHAR), 
	"DES_CERT_LOCAT" VARCHAR2(255 CHAR), 
	"DES_CERT_VOCAT" VARCHAR2(255 CHAR), 
	"EMAIL_NOTIF_REGLEZ" VARCHAR2(100 CHAR), 
	"ID_STRUTTURA" VARCHAR2(20 CHAR), 
	"RAC_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"AREA_DISC_COD" VARCHAR2(10 CHAR), 
	 CONSTRAINT "XPKP06_FAC" PRIMARY KEY ("FAC_ID"));
  
   COMMENT ON COLUMN "P06_FAC"."FAC_ID" IS 'ID facoltà';
   COMMENT ON COLUMN "P06_FAC"."ISTAT_COD" IS 'Codice ISTAT che distingue la tipologia della facoltà.';
   COMMENT ON COLUMN "P06_FAC"."COD" IS 'Codice facoltà';
   COMMENT ON COLUMN "P06_FAC"."DES" IS 'Descrizione facoltà';
   COMMENT ON COLUMN "P06_FAC"."ATENEO_ID" IS 'ID ateneo';
   COMMENT ON COLUMN "P06_FAC"."CITTA" IS 'Viene valorizzato in automatico dal programma con la  descrizione (in maiuscolo) del comune.';
   COMMENT ON COLUMN "P06_FAC"."VIA" IS 'Indiririzzo';
   COMMENT ON COLUMN "P06_FAC"."PROV" IS 'Viene valorizzato in automatico dal programma con la  provincia del comune.';
   COMMENT ON COLUMN "P06_FAC"."CF" IS 'Codice Fiscale';
   COMMENT ON COLUMN "P06_FAC"."PRESDIR" IS 'OBSOLETO da rel. 4.01.05 (sostituito con gestione carriera).
Nome del preside (facoltà) o del direttore (dipartimento, istituto,..)';
   COMMENT ON COLUMN "P06_FAC"."FIRMA_CERT" IS 'Titolo, nome e cognome di chi firma i certificati';
   COMMENT ON COLUMN "P06_FAC"."AA_ATT_ID" IS 'Anno accademico di attivazione.';
   COMMENT ON COLUMN "P06_FAC"."AA_DIS_ID" IS 'Anno accademico di disattivazione';
   COMMENT ON COLUMN "P06_FAC"."SYS_FLG" IS 'Indica se il record è di sistema oppure no: nel primo caso, il record NON è cancellabile, mentre nel secondo sì';
   COMMENT ON COLUMN "P06_FAC"."URL_SITO_WEB" IS 'Url del sito web della facoltà, esterno ad Esse3.';
   COMMENT ON COLUMN "P06_FAC"."WEB_VIEW_FLG" IS 'Indica se la facoltà è visibile nella lista delle facoltà nell¿area didattica del sito web (1=visibile 0=no).
Il flag è indipendente rispetto al corrispondente campo IN P06_CDS, ovvero è possibile non visualizzare la facoltà, ma visualizzare i suoi cds.';
   COMMENT ON COLUMN "P06_FAC"."COMUNE_ID" IS 'ID numerico unico del comune';
   COMMENT ON COLUMN "P06_FAC"."TEL" IS 'Numero di telefono della Facoltà (se valorizzato viene visualizzato nel web).';
   COMMENT ON COLUMN "P06_FAC"."FAX" IS 'Numero di fax della Facoltà (se valorizzato viene visualizzato nel web).';
   COMMENT ON COLUMN "P06_FAC"."EMAIL" IS 'Indirizzo di posta elettronica della Facoltà  (se valorizzato viene visualizzato nel web).';
   COMMENT ON COLUMN "P06_FAC"."DES_CERT" IS 'Descrizione utilizzabile nella stampa dei certificati, nel caso si voglia differenziarla da quella del percorso, campo DES.';
   COMMENT ON COLUMN "P06_FAC"."COD_STAT_MIUR" IS 'Codice Miur che identifica un Facoltà utilizzato nelle statistiche ministeriali (in particolare nelle statistiche relative al post-laurea).';
   COMMENT ON COLUMN "P06_FAC"."ACRONIMO_FAC" IS 'Acronimo facoltà. Utilizzato ad es. nei bollettini postali prestampati.';
   COMMENT ON COLUMN "P06_FAC"."CSA_COD" IS 'Codice CSA, utilizzato per mappare le nazioni durante l¿allineamento docenti dal sistema CSA.';
   COMMENT ON COLUMN "P06_FAC"."USR_INS_ID" IS 'Utente che ha inserito il record';
   COMMENT ON COLUMN "P06_FAC"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P06_FAC"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record';
   COMMENT ON COLUMN "P06_FAC"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON COLUMN "P06_FAC"."DEF_APPELLI_WEB" IS 'Indica se per i CdS della Facoltà si possono definire appelli attraverso le funzioni web dell''area docente.
0: definizione appelli non consentita
1: definizione consentita solo per appelli sui moduli (UD), dove previsto.
2: definizione appelli consentita sia per appelli su moduli che sull''AD';
   COMMENT ON COLUMN "P06_FAC"."SDR_TIP" IS 'Codice tipo di struttura didattica responsabile. Codici di sistema: FAC: Facoltà, DIP: Dipartimenti.';
   COMMENT ON COLUMN "P06_FAC"."DES_CERT_GENIT" IS 'caso genitivo della DES_CERT, indica l''appartenza (DI)';
   COMMENT ON COLUMN "P06_FAC"."DES_CERT_LOCAT" IS 'caso locativo della DES_CERT (PRESSO)';
   COMMENT ON COLUMN "P06_FAC"."DES_CERT_VOCAT" IS 'caso vocativo della DES_CERT (DOVE)';
   COMMENT ON COLUMN "P06_FAC"."EMAIL_NOTIF_REGLEZ" IS 'Indirizzo e-mail cui notificare la stampa definitiva di un registro lezioni afferente alla facoltà o dipartimento';
   COMMENT ON COLUMN "P06_FAC"."RAC_FLG" IS 'Se valorizzato, indica che si tratta di una struttura di raccordo o scuola, ossia una struttura interdipartimentale il cui scopo è raccordare più dipartimenti in Ateneo';
   COMMENT ON COLUMN "P06_FAC"."AREA_DISC_COD" IS 'Area disciplinare di afferenza della facoltà/dipartimento.';
   COMMENT ON TABLE "P06_FAC"  IS 'Le Facoltà sono le strutture attraverso cui le Università organizzano la loro presenza nei diversi settori culturali e disciplinari.
Un Ateneo si articola IN una o più facoltà.
La relazione tra Ateneo e Facoltà è uno-a-molti.
IN realtà, IN taluni casi, occorre passare attraverso il polo (o sede) per stabilire questa relazione.
Il ruolo della facoltà ALL¿interno di un Ateneo è stato fortemente modificato dal decreto ministeriale 509/99.
-- Facoltà prima della Riforma
Attualmente (prima dell applicazione del DM 509/99) è la facoltà a coordinare gli insegnamenti IN diplomi universitari,
corsi di laurea e di specializzazione e di fatto la facoltà procede a designare e chiamare i professori,
determinando la distribuzione dei compiti e del carico didattico dei professori di ruolo e dei ricercatori.
La facoltà è retta da un Consiglio di Facoltà e da un Preside.
Il Consiglio di Facoltà programma lo sviluppo dell¿attività didattica coordinandone il funzionamento e propone eventuali MODIFICHE da apportare
ALL¿ordinamento didattico.
--
Esempi di facoltà sono (Università di Trento):Economia, Giurisprudenza, Ingegneria, Lettere Scienze e Sociologia.
-- Facoltà e Riforma
Nel Decreto Ministeriale 509/99 non si parla di Facoltà: l¿organizzazione dei Corsi di Studio è realizzata dall¿Ateneo
mediante l attivazione delle Classi di Corso di Studio, definite a livello ministeriale, (Regolamento Didattico di Ateneo)
e da una struttura didattica responsabile (Ordinamento di Corso di Studio), che caratterizza le attività didattiche ASSOCIATE al Corso di Studio.
Inoltre il concetto di Facoltà è reintrodotto nei Decreti d Area, che indicano che i Corsi di Laurea e Laurea Specialistica si svolgono nelle Facoltà.
Il ruolo della facoltà e l¿individuazione della struttura didattica responsabile appaiono strettamente dipendenti
dalle dimensioni degli Atenei stessi e da quanto è forte la spinta dell¿Ateneo verso l¿Autonomia.
Ne deriva uno scenario estremam';

  CREATE INDEX "XIF_P06FAC_MIURSTRUTTURE_01" ON "P06_FAC" ("ID_STRUTTURA");
  CREATE INDEX "XIF_P06FAC_MRFCLT_01" ON "P06_FAC" ("COD_FACOLTA");
  CREATE INDEX "XIF_P06FAC_P01CM_01" ON "P06_FAC" ("COMUNE_ID"); 
  CREATE INDEX "XIF_P06FAC_P06RDSC_01" ON "P06_FAC" ("AREA_DISC_COD");
  CREATE INDEX "XIF_P06FAC_P06TN_01" ON "P06_FAC" ("ATENEO_ID");
  CREATE INDEX "XIF_P06FAC_TPSDR_01" ON "P06_FAC" ("SDR_TIP");
  CREATE INDEX "XIF_P06FAC_TPSTT_01" ON "P06_FAC" ("ISTAT_COD");

