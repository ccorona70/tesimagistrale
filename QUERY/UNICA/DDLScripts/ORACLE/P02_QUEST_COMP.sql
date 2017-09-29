 CREATE TABLE "P02_QUEST_COMP" 
   (	"QUEST_COMP_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"QUESTIONARIO_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"STATO_QUEST_COD" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"USR_INS_ID" VARCHAR2(20 CHAR), 
	"DATA_INS" DATE, 
	"USR_MOD_ID" VARCHAR2(20 CHAR), 
	"DATA_MOD" DATE, 
	"COMPLETO_FLG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"AUT_FLG" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	"EVENTO_COMP_COD" VARCHAR2(10 CHAR), 
	 CONSTRAINT "C_P02QUESTCOMP_009" CHECK (aut_flg BETWEEN 0 AND 1) ENABLE, 
	 CONSTRAINT "XPKP02_QUEST_COMP" PRIMARY KEY ("QUEST_COMP_ID"));
  

   COMMENT ON COLUMN "P02_QUEST_COMP"."QUEST_COMP_ID" IS 'Id univoco del questionario compilato';
   COMMENT ON COLUMN "P02_QUEST_COMP"."QUESTIONARIO_ID" IS 'Id univoco del questionario';
   COMMENT ON COLUMN "P02_QUEST_COMP"."STATO_QUEST_COD" IS 'Codice stato questionario';
   COMMENT ON COLUMN "P02_QUEST_COMP"."USR_INS_ID" IS 'Utente che ha inserito il record';
   COMMENT ON COLUMN "P02_QUEST_COMP"."DATA_INS" IS 'Data di inserimento';
   COMMENT ON COLUMN "P02_QUEST_COMP"."USR_MOD_ID" IS 'Ultimo utente che ha modificato il record';
   COMMENT ON COLUMN "P02_QUEST_COMP"."DATA_MOD" IS 'Data di modifica';
   COMMENT ON COLUMN "P02_QUEST_COMP"."COMPLETO_FLG" IS 'Indica se il questionario è stato completato';
   COMMENT ON COLUMN "P02_QUEST_COMP"."AUT_FLG" IS 'Indica se il il compilatore del questionario ha autorizzato l''uso dello stesso.';
   COMMENT ON COLUMN "P02_QUEST_COMP"."EVENTO_COMP_COD" IS 'Codice evento di compilazione del questionario.';
   COMMENT ON TABLE "P02_QUEST_COMP"  IS 'Tabella delle testate dei questionari compilati';

  CREATE INDEX "XIF_P02QUESTCOMP_P02QSTNR_01" ON "P02_QUEST_COMP" ("QUESTIONARIO_ID");
  CREATE INDEX "XIF_P02QUESTCOMP_P02STTQST_01" ON "P02_QUEST_COMP" ("STATO_QUEST_COD");
  CREATE INDEX "XIF_P02QUESTCOMP_VNTCMPQST_01" ON "P02_QUEST_COMP" ("EVENTO_COMP_COD");