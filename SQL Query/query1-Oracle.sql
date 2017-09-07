set serveroutput on
variable n number
exec :n := dbms_utility.get_time;

--SELECT /*+ PARALLEL(4) */ count(*) 
SELECT count(*) 
FROM p02_quesiti 
LEFT OUTER JOIN p02_tipi_formato ON (p02_quesiti.tipo_formato_cod = p02_tipi_formato.tipo_formato_cod)
LEFT OUTER JOIN elementi elemento_p02_quesiti ON (p02_quesiti.elem_cod = elemento_p02_quesiti.elem_cod)
LEFT OUTER JOIN p02_risposte ON (p02_quesiti.quesito_id = p02_risposte.quesito_id)
LEFT OUTER JOIN p02_quest_comp p02_quest_comp_risposte ON (p02_risposte.quest_comp_id = p02_quest_comp_risposte.quest_comp_id)
LEFT OUTER JOIN p02_quesiti quesiti_padre ON (p02_quesiti.parent_quesito_id = quesiti_padre.quesito_id) 
LEFT OUTER JOIN elementi elemento_quesiti_padre ON (quesiti_padre.elem_cod = elemento_quesiti_padre.elem_cod)
JOIN v02_risposte_row_testo_libero ON (p02_risposte.risposta_id = v02_risposte_row_testo_libero.risposta_id)
LEFT OUTER JOIN q35_dati_comp ON (p02_risposte.quest_comp_id = q35_dati_comp.quest_comp_id)
LEFT OUTER JOIN p06_cds q35_cds_ad_val ON (q35_dati_comp.cds_ad_id_val = q35_cds_ad_val.cds_id)
JOIN p06_fac_cds q35_fac_cds_ad_val ON ((q35_cds_ad_val.cds_id = q35_fac_cds_ad_val.cds_id) AND Q35_FAC_CDS_AD_VAL.DEF_AMM_FLG=1)
LEFT OUTER JOIN p06_fac q35_fac_ad_val ON (q35_fac_cds_ad_val.fac_id = q35_fac_ad_val.fac_id)
LEFT OUTER JOIN docenti q35_docente_ad_val ON (q35_dati_comp.doc_ad_id_val = q35_docente_ad_val.docente_id)
LEFT OUTER JOIN docenti q35_docente_tit_ad_val ON (q35_dati_comp.doc_tit_ad_id_val = q35_docente_tit_ad_val.docente_id)
LEFT OUTER JOIN p06_fac q35_fac_comp ON (q35_dati_comp.fac_id_comp = q35_fac_comp.fac_id)
LEFT OUTER JOIN p06_cds q35_cds_comp ON (q35_dati_comp.cds_id_comp = q35_cds_comp.cds_id)
LEFT OUTER JOIN p09_ad_gen q35_p09_ad_gen ON (q35_dati_comp.ad_id_val = q35_p09_ad_gen.ad_id)
LEFT OUTER JOIN p09_ud_cds q35_p09_ud_cds 
    ON ((q35_dati_comp.aa_off_ad_id_val = q35_p09_ud_cds.aa_off_id) 
    AND (q35_dati_comp.ad_id_val = q35_p09_ud_cds.ad_id)
    AND (q35_dati_comp.cds_ad_id_val = q35_p09_ud_cds.cds_id)
    AND (q35_dati_comp.ud_id_val = q35_p09_ud_cds.ud_id))
LEFT OUTER JOIN tipi_titolo_sup q35_tipi_titolo_sup ON (q35_dati_comp.tipo_titolo_cod_comp = q35_tipi_titolo_sup.tipo_titolo_cod)
LEFT OUTER JOIN p01_scuola q35_scuola ON (q35_dati_comp.scuola_sup_id_comp = q35_scuola.scuola_sup_id)
LEFT OUTER JOIN tipi_corso q35_tipi_corso_ad_val ON (q35_cds_ad_val.tipo_corso_cod = q35_tipi_corso_ad_val.tipo_corso_cod)
LEFT OUTER JOIN p07_normativa q35_normativa_cds_ad_val ON (q35_cds_ad_val.norm_id = q35_normativa_cds_ad_val.norm_id)
LEFT OUTER JOIN q35_invio_segnalazione ON (q35_dati_comp.quest_comp_id = q35_invio_segnalazione.quest_comp_id) 
LEFT OUTER JOIN v06_cariche_sdr_valide q35_cariche_cds_ad_val ON ((q35_fac_cds_ad_val.cds_id = q35_cariche_cds_ad_val.strutt_id)
    AND Q35_CARICHE_CDS_AD_VAL.SDR_TIP='CDS' 
	AND Q35_CARICHE_CDS_AD_VAL.CARICA_ID=95)
LEFT OUTER JOIN v06_cariche_sdr_valide q35_cariche_fac_ad_val ON ((q35_fac_cds_ad_val.fac_id = q35_cariche_fac_ad_val.strutt_id)
    And Q35_CARICHE_FAC_AD_VAL.SDR_TIP='FAC' 
	AND Q35_CARICHE_FAC_AD_VAL.CARICA_ID=97)
LEFT OUTER JOIN docenti q35_preside_fac_ad_val ON (q35_cariche_fac_ad_val.matricola_docente = q35_preside_fac_ad_val.matricola)
LEFT OUTER JOIN docenti q35_presidente_cds_ad_val ON (q35_cariche_cds_ad_val.matricola_docente = q35_presidente_cds_ad_val.matricola)
LEFT OUTER JOIN q35_num_quest_cds_doc_ud 
    ON ((q35_dati_comp.aa_off_ad_id_val = q35_num_quest_cds_doc_ud.aa_off_ad_id_val)
    AND (q35_dati_comp.ad_id_val = q35_num_quest_cds_doc_ud.ad_id_val)
    AND (q35_dati_comp.cds_ad_id_val = q35_num_quest_cds_doc_ud.cds_ad_id_val)
    AND (q35_dati_comp.doc_ad_id_val = q35_num_quest_cds_doc_ud.doc_ad_id_val)
    AND (q35_dati_comp.ud_id_val = q35_num_quest_cds_doc_ud.ud_id_val)
    AND  (nvl(Q35_DATI_COMP.EVENTO_COMP,'BOZZA')=Q35_NUM_QUEST_CDS_DOC_UD.EVENTO_COMP) 
	AND  (nvl(Q35_DATI_COMP.STU_FREQ_FLG_COMP,999)=Q35_NUM_QUEST_CDS_DOC_UD.STU_FREQ_FLG_COMP) 
	AND  (nvl(Q35_DATI_COMP.STU_NO_AUT_FLG_COMP,999)=Q35_NUM_QUEST_CDS_DOC_UD.STU_NO_AUT_FLG_COMP))
LEFT OUTER JOIN v06_dip q35_doc_ad_val_dip_afferenza ON (q35_doc_ad_val_dip_afferenza.dip_id = q35_docente_ad_val.dip_id)
LEFT OUTER JOIN p09_ud_pdsord_doc q35_ud_tipo_copertura ON ((q35_dati_comp.aa_off_ad_id_val = q35_ud_tipo_copertura.aa_off_id)
    AND (q35_dati_comp.aa_ord_ad_id_val = q35_ud_tipo_copertura.aa_ord_id)
    AND (q35_dati_comp.ad_id_val = q35_ud_tipo_copertura.ad_id)
    AND (q35_dati_comp.cds_ad_id_val = q35_ud_tipo_copertura.cds_id)
    AND (q35_dati_comp.doc_ad_id_val = q35_ud_tipo_copertura.docente_id)
    AND (q35_dati_comp.pds_ad_id_val = q35_ud_tipo_copertura.pds_id)
    AND (q35_dati_comp.ud_id_val = q35_ud_tipo_copertura.ud_id)) 
    WHERE ((p02_quesiti.questionario_id = 35) 
        AND ((q35_dati_comp.aa_off_ad_id_val = '2016') 
        AND (Q35_DATI_COMP.DATAORA_COMP < to_date('31/12/2016','dd/mm/yyyy'))));
		
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100) || ' seconds....' );
