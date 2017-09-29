CREATE TABLE "TIPI_CORSO" 
   (	"TIPO_CORSO_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"TIPO_CORSO_DES" VARCHAR2(80 CHAR), 
	"DURATA_ANNI" NUMBER(5,0), 
	"VALORE_MIN" NUMBER(6,0), 
	"RIF_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"LIVELLO" NUMBER(1,0) DEFAULT 0, 
	"SYS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"APPELLATIVO_M" VARCHAR2(40 CHAR), 
	"APPELLATIVO_F" VARCHAR2(40 CHAR), 
	"ALMA_COD" VARCHAR2(3 CHAR), 
	"TIPO_TITIT_COD" VARCHAR2(10 CHAR) DEFAULT 'X' NOT NULL ENABLE, 
	"TIPO_CORSO_MIUR_COD" VARCHAR2(10 CHAR), 
	"TIPO_CORSO_ETIC_DES" VARCHAR2(80 CHAR), 
	"ID_TIPO_LAUREA" VARCHAR2(12 CHAR), 
	"GEN_IPO_FLG" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	"CSA_COD" VARCHAR2(2 CHAR), 
	"TIPO_CORSO_VULC_COD" VARCHAR2(2 CHAR), 
	"ANS_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"UM_DURATA" VARCHAR2(1 CHAR) DEFAULT 'A' NOT NULL ENABLE, 
	"DURATA_EFFETTIVA" NUMBER(4,0), 
	"NORM_ID" NUMBER(10,0), 
	"ATTMAT_ATTISCR_CHK" VARCHAR2(3 BYTE), 
	"DM270_MAX_ESA" NUMBER(3,0), 
	"DM270_MAXCFU_RIC" NUMBER(3,0), 
	"DES_CERT" VARCHAR2(200 BYTE), 
	"MAX_POSTI_PART" NUMBER(5,0), 
	"REIMMATRICOLABILE_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"MAX_PUNTI_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"COPIA_BORSA" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"COPIA_BORSA_ATTIVA" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"COPIA_BORSA_MIN" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CLASSE_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"NOTE" VARCHAR2(2000 CHAR), 
	"DES_CERT_GENIT" VARCHAR2(255 CHAR), 
	"DES_CERT_LOCAT" VARCHAR2(255 CHAR), 
	"DES_CERT_VOCAT" VARCHAR2(255 CHAR), 
	"DOTTORATO_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"POST_LAUREAM_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"VIS_TROVACV_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"SCUOLA_SPEC_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"MOBIL_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "C_TIPICORSO_027" CHECK (REIMMATRICOLABILE_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKTIPI_CORSO" PRIMARY KEY ("TIPO_CORSO_COD"),
	 CONSTRAINT "C_TIPICORSO_018" CHECK (ANS_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_015" CHECK (GEN_IPO_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_005" CHECK (RIF_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_007" CHECK (SYS_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_019" CHECK (UM_DURATA IN ('A', 'M', 'G','O')) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_028" CHECK (MAX_PUNTI_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_029" CHECK (COPIA_BORSA BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_030" CHECK (COPIA_BORSA_ATTIVA BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_031" CHECK (COPIA_BORSA_MIN BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_032" CHECK (CLASSE_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPITITST_033" CHECK (VIS_TROVACV_FLG BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_033" CHECK ( scuola_spec_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "C_TIPICORSO_034" CHECK (MOBIL_FLG BETWEEN 0 AND 1) ENABLE);
	 

   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_CORSO_COD" IS 'Nel caso di un corso post riforma (Rif_flg=0), questo attributo indica la Tipologia del Corso di Studio associato alla Classe MURST/Ateneo in questione:
1. Corso di Laurea,
2. Corso di Laurea Specialistica,
3. Corso di Dottorato,
4. Corso di Specializzazione.
5. MASTER
-
Nel caso ante-riforma questo attributo indica la Tipologia del Corso di Studio. indipendentemente  dalla classe:
1. Diploma Universitario
2. Corso di Laurea,
3. Corso di Dottorato,
4. Corso di Specializzazione.
IN questo caso alcuni dei parametri non possono essere predefiniti (durata_anni e valore_minimo)';
   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_CORSO_DES" IS 'Descrizione tipo corso';
   COMMENT ON COLUMN "TIPI_CORSO"."DURATA_ANNI" IS 'Numero di anni di durata del corso di studio effettivo.
Questo attributo secondo il decreto 509/99 e caratteristico del tipo di corso di studio:
CdL --> 3 anni
CdLS --> 5 anni
Ma viene inserito a questo livello nel caso si voglia gestire anche il vecchio sistema: in passato un corso di studio poteva durare 4, 5 o 6 anni (ad esempio lettere, ingegneria e medicina).
Per quanto riguarda la durata in anni del Corso di Studio (Durata_Anni) il DM 509/99 cita:
"Per ogni Corso di Studio e definita una durata normale in anni, proporzionale al numero totale di crediti [...] tenendo conto che ad un anno corrispondono sessanta crediti [...] La durata normale dei corsi di laurea e di tre anni; la durata normale dei corsi di laurea specialistica e di ulteriori due anni dopo la laurea."
';
   COMMENT ON COLUMN "TIPI_CORSO"."VALORE_MIN" IS 'Questo attributo determina il numero minimo di crediti o annualita, che devono essere ottenuti per poter conseguire il titolo di studio.
Questo attributo secondo il decreto 509/99 e caratteristico del tipo di corso di studio:
CdL -->  180 crediti
CdLS --> 300 crediti
Ma viene inserito a questo livello nel caso si voglia gestire anche il vecchio sistema.
Per quanto riguarda il valore minimo dei crediti necessari per conseguire il titolo di studio (Valore_Minimo), il DM 509 cita:
"Per conseguire la laurea lo studente deve aver acquisito 180 crediti [...]. Per conseguire la laurea specialistica lo studente deve aver acquisito 300 crediti [...]. I decreti ministeriali determinano il numero di crediti che lo studente deve aver acquisito per conseguire il diploma di specializzazione. Tale numero deve essere compreso tra 300 e 360 crediti [...]. Per conseguire il master universitario lo studente deve aver acquisito almeno sessanta crediti oltre a quelli acquisiti per conseguire la laurea o laurea specialistica."
';
   COMMENT ON COLUMN "TIPI_CORSO"."RIF_FLG" IS 'Indica se il CDS è stato istituito prima o dopo (e quindi in accordo) con la riforma.
0 = NUOVO (riformato)
1 = VECCHIO';
   COMMENT ON COLUMN "TIPI_CORSO"."LIVELLO" IS 'Indica qual e il livello del Corso di Studio.
Viene specificato per i corsi post riforma e serve
per il diploma supplement.
Puo assumere i valori:
1 --> per la laurea
2 --> per la laurea specialistica
3 --> per il dottorato.
Occorre verificare se esistono dei valori anche per Master, Scuole di Specializzazione e Scuole di Perfezionamento.';
   COMMENT ON COLUMN "TIPI_CORSO"."SYS_FLG" IS 'Indica se record utilizzato dal sistema, non eliminare o modificare:
1 = di sistema
0 = inserito dall´operatore';
   COMMENT ON COLUMN "TIPI_CORSO"."APPELLATIVO_M" IS 'Appellativo maschile del tipo corso. es: Dott.';
   COMMENT ON COLUMN "TIPI_CORSO"."APPELLATIVO_F" IS 'Appellativo femminile del tipo corso. es: Dott.a';
   COMMENT ON COLUMN "TIPI_CORSO"."ALMA_COD" IS 'Codice ISTAT Alma Laurea';
   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_TITIT_COD" IS 'Tipo titolo conseguito al termine del corso di studio.';
   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_CORSO_MIUR_COD" IS 'Codice MIUR tipologia corso, utilizzato nei report statistici richiesti dal MIUR.';
   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_CORSO_ETIC_DES" IS 'Descrizione tipo corso per etichette';
   COMMENT ON COLUMN "TIPI_CORSO"."ID_TIPO_LAUREA" IS 'Codice MIUR del tipo di laurea';
   COMMENT ON COLUMN "TIPI_CORSO"."GEN_IPO_FLG" IS 'indica se per il tipo corso devono essere generate le ipotesi di iscrizione';
   COMMENT ON COLUMN "TIPI_CORSO"."CSA_COD" IS 'Codice CSA. Se valorizzato i CDS che fanno capo a questo tipo corso vengono trasmessi al CSA (vedere views V09_CSA_<nome>).';
   COMMENT ON COLUMN "TIPI_CORSO"."TIPO_CORSO_VULC_COD" IS 'Codice Tipo Corso per VULCANO';
   COMMENT ON COLUMN "TIPI_CORSO"."ANS_FLG" IS 'Indica se la tipologia di corso di studio è trasmessa all´Anagrafe Nazionale Studenti.';
   COMMENT ON COLUMN "TIPI_CORSO"."UM_DURATA" IS 'Unità di misura della durata effettiva del corso (valore del campo DURATA_EFFETTIVA). Sono ammessi i valori: A=anni, M=mesi, G=giorni.
Viene utilizzato come DEFAULT per l´ordinamento di cds (p06_cdsord.um_durata).
Per i tipi corso L2, LS, LC5 e LC6 il valore è sempre A, come stabilito dal decreto 509/99.';
   COMMENT ON COLUMN "TIPI_CORSO"."DURATA_EFFETTIVA" IS 'Durata effettiva del corso espressa in base all´UM (campo UM_DURATA).
IN base al valore inserito IN questo campo viene valorizzato il campo DURATA_ANNI, il quale indica il numero di anni (di corso) di durata del corso.
Viene utilizzato come DEFAULT per l´ordinamento di cds (p06_cdsord.durata_effettiva).
Per i tipi corso L2, LS, LC5 e LC6 il valore è fisso, ovvero stabilito dal descreto 509/99.';
   COMMENT ON COLUMN "TIPI_CORSO"."NORM_ID" IS 'Identificativo univoco della Normativa di riferimento per la riforma universitaria. Da questa normativa derivano le classi di laurea e l''istituzione dei corsi di studio.
CAMPO FACOLTATIVO.';
   COMMENT ON COLUMN "TIPI_CORSO"."ATTMAT_ATTISCR_CHK" IS 'Abilita il perfezionamento automatico dell`immatricolazione alla ricezione del pagamento che attiva l`iscrizione:
AUT: automatica
MAN: manuale
NON: non abilitato';
   COMMENT ON COLUMN "TIPI_CORSO"."DM270_MAX_ESA" IS 'Indica il massimo numero di esami consentito dalla normativa del D.M.270';
   COMMENT ON COLUMN "TIPI_CORSO"."DM270_MAXCFU_RIC" IS 'Indica il massimo numero di CFU riconoscibili consentito dalla normativa del D.M.270';
   COMMENT ON COLUMN "TIPI_CORSO"."MAX_POSTI_PART" IS 'Valore di default del corrispondente campo P09_AD_LOG durante il travaso dati da UGOV della logistica (procedura IMP_EXP).
Indica il numero massimo di posti disponibili per la singola partizione (classe).';
   COMMENT ON COLUMN "TIPI_CORSO"."REIMMATRICOLABILE_FLG" IS 'Indica se è possibile immatricolarsi nuovamente al corso di studio dopo aver conseguito il titolo.';
   COMMENT ON COLUMN "TIPI_CORSO"."MAX_PUNTI_FLG" IS 'Indica l''obbligatorietà nell''inserimento di un punteggio massimo (es. 110) a livello del corso di studio afferente a questo tipo corso.';
   COMMENT ON COLUMN "TIPI_CORSO"."COPIA_BORSA" IS 'Indicatore di attivazione del processo di copia borsa di studio al rinnovo iscrizione.
Se impostao a 0 non viene copiata la borsa di studio.
Se impostato a 1 viene copiata la borsa di studio.';
   COMMENT ON COLUMN "TIPI_CORSO"."COPIA_BORSA_ATTIVA" IS 'Indicatore di attivazione del processo di copia borsa di studio al rinnovo iscrizione in base allo stato.
Se impostao a 0 viene copiata la borsa di studio in qualsiasi stato.
Se impostato a 1 viene copiata la borsa di studio solo se attiva.';
   COMMENT ON COLUMN "TIPI_CORSO"."COPIA_BORSA_MIN" IS 'Indicatore di attivazione del processo di copia borsa di studio al rinnovo iscrizione in base al tipo di borsa.
Se impostao a 0 viene copiata la borsa di studio di qualsiasi tipo.
Se impostato a 1 viene copiata la borsa di studio solo se Ministeriale.
(OBSOLETO)';
   COMMENT ON COLUMN "TIPI_CORSO"."CLASSE_FLG" IS 'Indica genericamente che il tipo corso associato avrà una classe associata (tipicamente una classe di ateneo in rappresentanza di una classe ministeriale)';
   COMMENT ON COLUMN "TIPI_CORSO"."USR_INS_ID" IS 'Identificativo dell''utente che ha inserito il record';
   COMMENT ON COLUMN "TIPI_CORSO"."DATA_INS" IS 'Data di inserimento del record';
   COMMENT ON COLUMN "TIPI_CORSO"."USR_MOD_ID" IS 'Identificativo dell''utente che ha modificato il record';
   COMMENT ON COLUMN "TIPI_CORSO"."DATA_MOD" IS 'Data di modifica del record';
   COMMENT ON COLUMN "TIPI_CORSO"."DES_CERT_GENIT" IS 'caso genitivo della DES_CERT, indica l''appartenza (DI)';
   COMMENT ON COLUMN "TIPI_CORSO"."DES_CERT_LOCAT" IS 'caso locativo della DES_CERT (PRESSO)';
   COMMENT ON COLUMN "TIPI_CORSO"."DES_CERT_VOCAT" IS 'caso vocativo della DES_CERT (DOVE)';
   COMMENT ON COLUMN "TIPI_CORSO"."DOTTORATO_FLG" IS 'Indica se il tipo corso rappresenta un Dottorato di Ricerca, ossia un titolo accademico italiano post lauream, corrispondente al 3° ciclo dell''istruzione superiore in molti paesi del mondo. È stato introdotto nel sistema universitario italiano nel 1980 e rappresenta il più alto grado di istruzione universitaria, come dettato dal Processo di Bologna.';
   COMMENT ON COLUMN "TIPI_CORSO"."POST_LAUREAM_FLG" IS 'Indica che il tipo corso è "post lauream"';
   COMMENT ON COLUMN "TIPI_CORSO"."VIS_TROVACV_FLG" IS 'Indica se il tipo corso è utilizzabile nei criteri di filtro di recupero dei CV su WEBESSE3.';
   COMMENT ON COLUMN "TIPI_CORSO"."SCUOLA_SPEC_FLG" IS 'Indica se il tipo corso rappresenta una scuola di specializzazione, ossia un titolo accademico italiano post lauream a carattere professionalizzante, che ha l’obiettivo di fornire conoscenze e abilità per lo svolgimento di funzioni altamente qualificate, richieste per l’esercizio di particolari attività professionali, esclusivamente in applicazione di direttive europee o di specifiche norme di legge.';
   COMMENT ON COLUMN "TIPI_CORSO"."MOBIL_FLG" IS 'Indica se il tipo corso rappresenta un corso (fittizio) di mobilità';
   COMMENT ON TABLE "TIPI_CORSO"  IS 'Tipologia dei Corsi di Studio:
- prima della riforma questo attributo veniva specificato a livello di Corso di Studio
- dopo la riforma la tipologia è ereditata dalla/e Classi di appartenenza
(Classe Ateneo e Classe MURST).';

  CREATE INDEX "IDX$$_243430003" ON "TIPI_CORSO" ("POST_LAUREAM_FLG", "TIPO_CORSO_COD");
  CREATE INDEX "XIF_TIPICORSO_MRTPLR_01" ON "TIPI_CORSO" ("ID_TIPO_LAUREA");
  CREATE INDEX "XIF_TIPICORSO_P07NRMTV_01" ON "TIPI_CORSO" ("NORM_ID");
  CREATE INDEX "XIF_TIPICORSO_TPTTT_01" ON "TIPI_CORSO" ("TIPO_TITIT_COD");
