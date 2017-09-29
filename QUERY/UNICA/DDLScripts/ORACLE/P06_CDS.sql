 CREATE TABLE "P06_CDS" 
   (	"CDS_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"TIPO_CORSO_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"NUM_LINGUE" NUMBER(2,0) DEFAULT 0, 
	"COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"TIPO_DID_COD" VARCHAR2(10 CHAR), 
	"ISTAT_COD" VARCHAR2(10 CHAR), 
	"TITOLO" VARCHAR2(80 CHAR), 
	"DES" VARCHAR2(255 CHAR), 
	"MAX_PUNTI" NUMBER(4,0), 
	"RIF_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"UM_PESO_COD" VARCHAR2(5 CHAR), 
	"AA_ATT_ID" NUMBER(10,0), 
	"AA_DIS_ID" NUMBER(10,0), 
	"TIPO_SPEC_COD" VARCHAR2(10 CHAR), 
	"ARCH_STR" VARCHAR2(10 CHAR), 
	"POSTI_STAT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CONV_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"SETT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DES_CERT" VARCHAR2(255 CHAR), 
	"DES_PERG" VARCHAR2(255 CHAR), 
	"TIPO_TITIT_COD" VARCHAR2(10 CHAR), 
	"RESP_ID" NUMBER(10,0), 
	"ACC_RIS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"WEB_IMMAT_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"WEB_VIEW_FLG" NUMBER(1,0) DEFAULT 0, 
	"PERGA_TIPO_ESA_DES" VARCHAR2(30 CHAR), 
	"PERGA_TIPO_TIT_DES" VARCHAR2(120 CHAR), 
	"TRASM_ALMA_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DS_TIPO_TIT_DES" VARCHAR2(255 CHAR), 
	"DS_REQ_CT_DES" VARCHAR2(2000 CHAR), 
	"PERGA_ART_TIT_DES" VARCHAR2(80 CHAR), 
	"ASS_NUM_REG_PERGA_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DS_ACCESSO_STUDI_DES" VARCHAR2(2000 CHAR), 
	"DS_STATUS_PROF_DES" VARCHAR2(2000 CHAR), 
	"NOTA_PIANI_IND" VARCHAR2(255 CHAR), 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"INS_AD_PROFIN_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"URL_SITO_WEB" VARCHAR2(255 CHAR), 
	"URL_INFO_WEB" VARCHAR2(255 CHAR), 
	"DS_PROVE_AMM_DES" VARCHAR2(2000 CHAR), 
	"COD_STAT_MIUR" VARCHAR2(10 CHAR) DEFAULT 'XXXX' NOT NULL ENABLE, 
	"CDS_FORMSTR" VARCHAR2(5 CHAR), 
	"NORM_ID" NUMBER(10,0) DEFAULT 0 NOT NULL ENABLE, 
	"CSA_COD" VARCHAR2(6 CHAR), 
	"DES_CERT_BIS" VARCHAR2(255 CHAR), 
	"ENTE_ID" NUMBER(10,0), 
	"NORM_DES_CERT" VARCHAR2(2000 CHAR), 
	"SCUOLA_SPEC_ID" NUMBER(10,0), 
	"ACRONIMO" VARCHAR2(20 CHAR), 
	"TIPO_MASTER_COD" VARCHAR2(10 CHAR), 
	"RANGE_MAT_ID" NUMBER(10,0), 
	"TITIT_CERT_DES" VARCHAR2(255 BYTE), 
	"NOTE" VARCHAR2(2000 BYTE), 
	"FORMSTR_COD" VARCHAR2(40 CHAR), 
	"FORMSTR_PRG_COD" VARCHAR2(80 CHAR), 
	"IMP_UGOV_DID_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"DES_CERT_GENIT" VARCHAR2(255 CHAR), 
	"DES_CERT_LOCAT" VARCHAR2(255 CHAR), 
	"DES_CERT_VOCAT" VARCHAR2(255 CHAR), 
	"TIRO_TUTOR_PSICO_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"STAT_MIUR_FLG" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	"DECRETO_ID" NUMBER(10,0), 
	"EMAIL_NOTIF_REGLEZ" VARCHAR2(100 CHAR), 
	"CLA_AREA_ID" NUMBER(4,0), 
	"DES_LINGUA_ORI" VARCHAR2(255 CHAR) DEFAULT NULL, 
	 CONSTRAINT "C_P06CDS_010" CHECK (Rif_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_016" CHECK (POSTI_STAT_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_017" CHECK (CONV_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_018" CHECK (SETT_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_023" CHECK (ACC_RIS_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_024" CHECK (WEB_IMMAT_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_025" CHECK (WEB_VIEW_FLG BETWEEN 0 AND 2) ENABLE, 
	 CONSTRAINT "C_P06CDS_028" CHECK (TRASM_ALMA_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_032" CHECK (ASS_NUM_REG_PERGA_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_P06CDS_040" CHECK (INS_AD_PROFIN_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKP06_CDS" PRIMARY KEY ("CDS_ID"),
	 CONSTRAINT "XAKP06_CDS_COD" UNIQUE ("COD"),
 	 CONSTRAINT "C_P06CDS_026" CHECK ( stat_miur_flg BETWEEN 0 AND 1) ENABLE );
 
   COMMENT ON COLUMN "P06_CDS"."CDS_ID" IS 'ID del Corso di Studio';
   COMMENT ON COLUMN "P06_CDS"."TIPO_CORSO_COD" IS 'Nel caso di un corso post riforma (Rif_flg=0), questo attributo indica la Tipologia del Corso di Studio associato alla Classe MURST/Ateneo in questione:
1. Corso di Laurea,
2. Corso di Laurea Specialistica,
3. Corso di Dottorato,
4. Corso di Specializzazione.
5. Master
-
Nel caso ante-riforma questo attributo indica la Tipologia del Corso di Studio. indipendentemente  dalla classe:
1. Diploma Universitario
2. Corso di Laurea,
3. Corso di Dottorato,
4. Corso di Specializzazione.
In questo caso alcuni dei parametri non possono essere predefiniti (durata_anni e valore_minimo)';
   COMMENT ON COLUMN "P06_CDS"."NUM_LINGUE" IS 'OBSOLETO';
   COMMENT ON COLUMN "P06_CDS"."COD" IS 'Codice mnemonico del corso di studio';
   COMMENT ON COLUMN "P06_CDS"."TIPO_DID_COD" IS 'OBSOLETO. (sostituito dalla tabella P06_CDS_TIPI_DID)';
   COMMENT ON COLUMN "P06_CDS"."ISTAT_COD" IS 'Serve per Diploma universitario (tipo_corso_cod = DU) e per Corso di laurea (tipo_corso_cod = L1), e indica il codice ISTAT.';
   COMMENT ON COLUMN "P06_CDS"."TITOLO" IS 'OBSOLETO. Sostituito dal campo DS_TIPO_TIT_DES.
Un Corso di Studio e caratterizzato da un titolo. Questo e ottenibile combinando il tipo di corso con il nome del Corso di Studio.';
   COMMENT ON COLUMN "P06_CDS"."DES" IS 'Descrizione del corso di studio';
   COMMENT ON COLUMN "P06_CDS"."MAX_PUNTI" IS 'Questo attributo serve come base di valutazione, discrimina se il voto è espresso in centesimi oppure settantesimi o ancora 110-esimi.
Questo attributo secondo il decreto 509/99 è caratteristico del tipo di corso di studio.
NOTA: la modifica a questo livello di questo attributo è consentita SOLO per i corsi definiti prima della Riforma, altrimenti è sempre valorizzato a 110.';
   COMMENT ON COLUMN "P06_CDS"."RIF_FLG" IS 'Indica se il CDS è stato istituito in accordo con la riforma e quindi può essere associato ad una classe di laurea.
0 = NUOVO: abilita associazione con classe
1 = VECCHIO: disabilita associazione con classe';
   COMMENT ON COLUMN "P06_CDS"."UM_PESO_COD" IS 'Attributo che indica la unità di misura del Corso di studio. In caso di corso post riforma viene sempre valorizzato a Crediti.';
   COMMENT ON COLUMN "P06_CDS"."AA_ATT_ID" IS 'Anno accademico di attivazione del corso.';
   COMMENT ON COLUMN "P06_CDS"."AA_DIS_ID" IS 'Anno accademico di disattivazione del corso';
   COMMENT ON COLUMN "P06_CDS"."TIPO_SPEC_COD" IS 'Serve solo per le scuole di specializzazione (tipo_corso_cod = S1) e indica il Tipo di specializzazione (vedere contenuto tabella TIPI_SCUOLE_SPEC).';
   COMMENT ON COLUMN "P06_CDS"."ARCH_STR" IS 'Stringa di archivio. Serve per generare il codice di archivio da associare alle carriere chiuse.';
   COMMENT ON COLUMN "P06_CDS"."POSTI_STAT_FLG" IS 'Serve per le scuole di specializzazione dell´area medica: indica se è stato inserito il numero di posti a statuto per ciascun anno di corso, ovvero record nella tabella P06_CDS_STAT (1=posti a statuto 0=no).';
   COMMENT ON COLUMN "P06_CDS"."CONV_FLG" IS 'RIMONDI: OBSOLETO da rel. 1.10.0.
Indica se il corso ha delle convezioni collegate, record nella tabella P11_CNVZ (1=convenzioni 0=no). Solitamente serve per le scuole di specializzazione dell´area medica (tipo_spec_cod = MEDI), per cui indica se sono state stipulate o meno delle convenzioni con enti esterni allo scopo di finanziare una o più borse di studio';
   COMMENT ON COLUMN "P06_CDS"."SETT_FLG" IS 'Indica se nella definizione delle AD generali occorre far uso dei settori oppure delle discipline. Se RIF_FLG = 0 (CDS post riforma) necessariamente SETT_FLG = 1 e non può essere modificato, se RIF_FLG = 1 (CDS ante riforma) come default SETT_FLG = 0 e può essere modificato. Il flag può essere modificato solo nel caso in cui non vi siano attività didattiche associate al CDS con un settore o una disciplina associati.';
   COMMENT ON COLUMN "P06_CDS"."DES_CERT" IS 'Descrizione corso di studio da utilizzare nei certificati. Come default viene caricato il campo DES.';
   COMMENT ON COLUMN "P06_CDS"."DES_PERG" IS 'Descrizione corso di studio da utilizzare per la stampa della pergamena. Come default viene caricato il campo DES.';
   COMMENT ON COLUMN "P06_CDS"."TIPO_TITIT_COD" IS 'Tipo titolo (vedere contenuto tabella TIPI_TIT_IT).';
   COMMENT ON COLUMN "P06_CDS"."RESP_ID" IS 'ID Responsabile per la firma dei certificati su P13_RESP_CERT';
   COMMENT ON COLUMN "P06_CDS"."ACC_RIS_FLG" IS 'Indica se il corso è ad accesso riservato per determinate categorie studenti, ovvero se ha dei record nella tabella P06_CDS_CAT_AMM (1=riservato 0=no).';
   COMMENT ON COLUMN "P06_CDS"."WEB_IMMAT_FLG" IS 'Indica se il corso è abilitato alla immatricolazione da Web (1=immatricola 0=no).';
   COMMENT ON COLUMN "P06_CDS"."WEB_VIEW_FLG" IS 'List-Box. Indica se il corso è visibile nella lista dei corsi di studio nell´area didattica del sito web: 0=Solo descrizione, 1=Descrizione e offerta, 2=Nessuna.';
   COMMENT ON COLUMN "P06_CDS"."PERGA_TIPO_ESA_DES" IS 'Descrizione tipo esame per la stampa della pergamena.';
   COMMENT ON COLUMN "P06_CDS"."PERGA_TIPO_TIT_DES" IS 'Descrizione tipo titolo per la stampa della pergamena.';
   COMMENT ON COLUMN "P06_CDS"."TRASM_ALMA_FLG" IS 'Alma Laurea: indica se i laureati in questo corso devono essere trasmessi ad Alma Laurea (1=trasmessi 0=no).';
   COMMENT ON COLUMN "P06_CDS"."DS_TIPO_TIT_DES" IS 'OBSOLETO da rel. 4.01.05 (sostituito con gestione caratteristiche).
Descrizione tipo titolo, utilizzato nel Diploma Supplement e nel WEB.';
   COMMENT ON COLUMN "P06_CDS"."DS_REQ_CT_DES" IS 'OBSOLETO da rel. 4.01.05 (sostituito con gestione caratteristiche).
Descrizione dei requisiti per il conseguimento del titolo, utilizzato nel Diploma Supplement.';
   COMMENT ON COLUMN "P06_CDS"."PERGA_ART_TIT_DES" IS 'Descrizione articolo titolo per la stampa della pergamena.';
   COMMENT ON COLUMN "P06_CDS"."ASS_NUM_REG_PERGA_FLG" IS 'Flag assegnazione numero registro pergamena: consente di includere/escludere selettivamente i CDS riguardo l´assegnazione del numero di registro pergamena';
   COMMENT ON COLUMN "P06_CDS"."DS_ACCESSO_STUDI_DES" IS 'OBSOLETO - utilizzato relativo campo nella P06_CDSORD.
Descrizione delle modalità di accesso a studi ulteriori per Diploma Supplement.';
   COMMENT ON COLUMN "P06_CDS"."DS_STATUS_PROF_DES" IS 'OBSOLETO - utilizzato relativo campo nella P06_CDSORD.
Descrizione status professionale conferito per Diploma Supplement.';
   COMMENT ON COLUMN "P06_CDS"."NOTA_PIANI_IND" IS 'Nota informativa per piani individuali.';
   COMMENT ON COLUMN "P06_CDS"."USR_INS_ID" IS 'Utente che ha inserito il record';
   COMMENT ON COLUMN "P06_CDS"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P06_CDS"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record';
   COMMENT ON COLUMN "P06_CDS"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON COLUMN "P06_CDS"."INS_AD_PROFIN_FLG" IS 'Flag che indica se inserire in automatico, in fase di conseguimento titolo, la AD relativa alla prova finale';
   COMMENT ON COLUMN "P06_CDS"."URL_SITO_WEB" IS 'Url del sito web del CDS, esterno ad Esse3.';
   COMMENT ON COLUMN "P06_CDS"."URL_INFO_WEB" IS 'Url del sito web delle informazioni specifiche e modulistica del CDS, esterno ad Esse3.';
   COMMENT ON COLUMN "P06_CDS"."DS_PROVE_AMM_DES" IS 'OBSOLETO da rel. 4.01.05 (sostituito con gestione caratteristiche).
Descrizione delle eventuali prove di ammissione al corso di studio, utilizzate per la compilazione del Diploma Supplement.';
   COMMENT ON COLUMN "P06_CDS"."COD_STAT_MIUR" IS 'Codice Miur che identifica un Corso di studi utilizzato nelle statistiche ministeriali (in particolare nelle statistiche relative al post-laurea).';
   COMMENT ON COLUMN "P06_CDS"."CDS_FORMSTR" IS 'Stringa statica per la formattazione della matricola differenziata per CDS';
   COMMENT ON COLUMN "P06_CDS"."NORM_ID" IS 'Identificativo univoco della Normativa di riferimento per la riforma universitaria. Da questa normativa derivano le classi di laurea e l´istituzione dei corsi di studio';
   COMMENT ON COLUMN "P06_CDS"."CSA_COD" IS 'Codice CSA, utilizzato per mappare i corsi di studio di ESSE3 con le relative unità organizzative di CSA.';
   COMMENT ON COLUMN "P06_CDS"."DES_CERT_BIS" IS 'Eventuale estensione della descrizione del corso di studio da utilizzare nei certificati dove è necessario una descrizione molto lunga del CDS. Ovviamente i certificati vanno personalizzati per prevedere la stampa anche di questo campo di seguito al campo DES_CERT.';
   COMMENT ON COLUMN "P06_CDS"."ENTE_ID" IS 'Identificativo dell´ente esterno al quale è associato il corso di studio.';
   COMMENT ON COLUMN "P06_CDS"."NORM_DES_CERT" IS 'Descrizione aggiuntiva inerente la normativa a cui è soggetta il corso di studio; la stringa verrà riportata sulle certificazioni predisposte.';
   COMMENT ON COLUMN "P06_CDS"."SCUOLA_SPEC_ID" IS 'Identificativo univoco della tipologia di scuola di specializzazione. Utilizzato per le scuole di specializzazione post-riforma.';
   COMMENT ON COLUMN "P06_CDS"."ACRONIMO" IS 'Acronimo del corso di studio.';
   COMMENT ON COLUMN "P06_CDS"."TIPO_MASTER_COD" IS 'Codice della tipologia di master.';
   COMMENT ON COLUMN "P06_CDS"."RANGE_MAT_ID" IS 'Identificativo dettaglio range matricola.';
   COMMENT ON COLUMN "P06_CDS"."NOTE" IS 'Note';
   COMMENT ON COLUMN "P06_CDS"."FORMSTR_COD" IS 'Codice formattazione matricola personalizzato per corso di studio.';
   COMMENT ON COLUMN "P06_CDS"."FORMSTR_PRG_COD" IS 'Codice progressivo di formattazione matricola personalizzato per corso di studio.';
   COMMENT ON COLUMN "P06_CDS"."IMP_UGOV_DID_FLG" IS 'Indica che la struttura del corso di studio (ed informazioni annesse) è importata da U-GOV DIDATTICA.';
   COMMENT ON COLUMN "P06_CDS"."DES_CERT_GENIT" IS 'caso genitivo della DES_CERT, indica l''appartenza (DI)';
   COMMENT ON COLUMN "P06_CDS"."DES_CERT_LOCAT" IS 'caso locativo della DES_CERT (PRESSO)';
   COMMENT ON COLUMN "P06_CDS"."DES_CERT_VOCAT" IS 'caso vocativo della DES_CERT (DOVE)';
   COMMENT ON COLUMN "P06_CDS"."TIRO_TUTOR_PSICO_FLG" IS 'Indica se bisogna indicare dei tutor per il tirocinio di psicologia.';
   COMMENT ON COLUMN "P06_CDS"."STAT_MIUR_FLG" IS 'Indica se il corso è abilitato all''invio per le rilevazioni ministeriali (Default 1 Invio).';
   COMMENT ON COLUMN "P06_CDS"."DECRETO_ID" IS 'Indica l''eventuale decreto di riferimento per l''istituzione del corso';
   COMMENT ON COLUMN "P06_CDS"."EMAIL_NOTIF_REGLEZ" IS 'Indirizzo e-mail cui notificare la stampa definitiva di un registro lezioni afferente al Corso di Studio';
   COMMENT ON COLUMN "P06_CDS"."CLA_AREA_ID" IS 'indica la macro-area di riferimento del corso di studio';
   COMMENT ON COLUMN "P06_CDS"."DES_LINGUA_ORI" IS 'Descrizione corso di studio nella lingua originaria, è utilizzato per i corsi di studio a denominazione inglese ma con dichiarazione della descrizione anche in lingua italiana.';
   COMMENT ON TABLE "P06_CDS"  IS 'Un Corso di Studio è un insieme di discipline e di regole finalizzate a fornire una preparazione, che consenta il rilascio del titolo di studio a livello universitario.
Anche per il Corso di Studio occorre distinguere tra prima e dopo la riforma.
Prima della riforma un Corso di Studio poteva essere un Corso di Laurea oppure un Corso di Diploma oppure un Corso di Specializzazione o un Corso di Dottorato.
Dopo la riforma i possibili Corsi di Studio sono i corsi di laurea (L) ed i corsi di laurea specialistica (LS) per conseguire i titoli di primo e secondo livello ed i corsi di specializzazione e di dottorato al termine dei quali vengono rilasciati il  diploma di specializzazione (DS) e il dottorato di ricerca (DR).
.';

  CREATE INDEX "IDX$$_CD290008" ON "P06_CDS" ("CDS_ID", "SETT_FLG") ;
  CREATE INDEX "XIE_P06CDS_P07CLAAREE" ON "P06_CDS" ("CLA_AREA_ID");
  CREATE INDEX "XIF_P06CDS_DRECRETI_01" ON "P06_CDS" ("DECRETO_ID");
  CREATE INDEX "XIF_P06CDS_MPS_01" ON "P06_CDS" ("UM_PESO_COD");
  CREATE INDEX "XIF_P06CDS_P06CDSRNGMT_01" ON "P06_CDS" ("RANGE_MAT_ID");
  CREATE INDEX "XIF_P06CDS_P06NTST_01" ON "P06_CDS" ("ENTE_ID");
  CREATE INDEX "XIF_P06CDS_P06_01" ON "P06_CDS" ("AA_ATT_ID");
  CREATE INDEX "XIF_P06CDS_P06_02" ON "P06_CDS" ("AA_DIS_ID");
  CREATE INDEX "XIF_P06CDS_P07NRMTV_01" ON "P06_CDS" ("NORM_ID");
  CREATE INDEX "XIF_P06CDS_P13RSPCRT_01" ON "P06_CDS" ("RESP_ID");
  CREATE INDEX "XIF_P06CDS_SCLSPC_01" ON "P06_CDS" ("SCUOLA_SPEC_ID");
  CREATE INDEX "XIF_P06CDS_TPCRS_01" ON "P06_CDS" ("TIPO_CORSO_COD");
  CREATE INDEX "XIF_P06CDS_TPDD_01" ON "P06_CDS" ("TIPO_DID_COD");
  CREATE INDEX "XIF_P06CDS_TPMSTR_01" ON "P06_CDS" ("TIPO_MASTER_COD");
  CREATE INDEX "XIF_P06CDS_TPSCLSPC_01" ON "P06_CDS" ("TIPO_CORSO_COD", "TIPO_SPEC_COD");
  CREATE INDEX "XIF_P06CDS_TPSTT_01" ON "P06_CDS" ("ISTAT_COD");
  CREATE INDEX "XIF_P06CDS_TPTTT_01" ON "P06_CDS" ("TIPO_TITIT_COD");
