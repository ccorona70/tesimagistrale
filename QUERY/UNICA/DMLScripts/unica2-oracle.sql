set serveroutput on
variable n number
exec :n := dbms_utility.get_time;

select q35_dati_comp.aa_off_ad_id_val,count(*) 
from p02_quesiti 
left outer join p02_tipi_formato on (p02_quesiti.tipo_formato_cod = p02_tipi_formato.tipo_formato_cod)
left outer join elementi elemento_p02_quesiti on (p02_quesiti.elem_cod = elemento_p02_quesiti.elem_cod)
left outer join p02_risposte on (p02_quesiti.quesito_id = p02_risposte.quesito_id)
left outer join p02_quest_comp p02_quest_comp_risposte on (p02_risposte.quest_comp_id = p02_quest_comp_risposte.quest_comp_id)
left outer join p02_quesiti quesiti_padre on (p02_quesiti.parent_quesito_id = quesiti_padre.quesito_id) 
left outer join elementi elemento_quesiti_padre on (quesiti_padre.elem_cod = elemento_quesiti_padre.elem_cod)
join v02_risposte_row_testo_libero on (p02_risposte.risposta_id = v02_risposte_row_testo_libero.risposta_id)
left outer join q35_dati_comp on (p02_risposte.quest_comp_id = q35_dati_comp.quest_comp_id)
left outer join p06_cds q35_cds_ad_val on (q35_dati_comp.cds_ad_id_val = q35_cds_ad_val.cds_id)
join p06_fac_cds q35_fac_cds_ad_val on ((q35_cds_ad_val.cds_id = q35_fac_cds_ad_val.cds_id) and q35_fac_cds_ad_val.def_amm_flg=1)
left outer join p06_fac q35_fac_ad_val on (q35_fac_cds_ad_val.fac_id = q35_fac_ad_val.fac_id)
left outer join docenti q35_docente_ad_val on (q35_dati_comp.doc_ad_id_val = q35_docente_ad_val.docente_id)
left outer join docenti q35_docente_tit_ad_val on (q35_dati_comp.doc_tit_ad_id_val = q35_docente_tit_ad_val.docente_id)
left outer join p06_fac q35_fac_comp on (q35_dati_comp.fac_id_comp = q35_fac_comp.fac_id)
left outer join p06_cds q35_cds_comp on (q35_dati_comp.cds_id_comp = q35_cds_comp.cds_id)
left outer join p09_ad_gen q35_p09_ad_gen on (q35_dati_comp.ad_id_val = q35_p09_ad_gen.ad_id)
left outer join p09_ud_cds q35_p09_ud_cds 
    on ((q35_dati_comp.aa_off_ad_id_val = q35_p09_ud_cds.aa_off_id) 
    and (q35_dati_comp.ad_id_val = q35_p09_ud_cds.ad_id)
    and (q35_dati_comp.cds_ad_id_val = q35_p09_ud_cds.cds_id)
    and (q35_dati_comp.ud_id_val = q35_p09_ud_cds.ud_id))
left outer join tipi_titolo_sup q35_tipi_titolo_sup on (q35_dati_comp.tipo_titolo_cod_comp = q35_tipi_titolo_sup.tipo_titolo_cod)
left outer join p01_scuola q35_scuola on (q35_dati_comp.scuola_sup_id_comp = q35_scuola.scuola_sup_id)
left outer join tipi_corso q35_tipi_corso_ad_val on (q35_cds_ad_val.tipo_corso_cod = q35_tipi_corso_ad_val.tipo_corso_cod)
left outer join p07_normativa q35_normativa_cds_ad_val on (q35_cds_ad_val.norm_id = q35_normativa_cds_ad_val.norm_id)
left outer join q35_invio_segnalazione on (q35_dati_comp.quest_comp_id = q35_invio_segnalazione.quest_comp_id) 
left outer join v06_cariche_sdr_valide q35_cariche_cds_ad_val on ((q35_fac_cds_ad_val.cds_id = q35_cariche_cds_ad_val.strutt_id)
    and q35_cariche_cds_ad_val.sdr_tip='cds' 
	and q35_cariche_cds_ad_val.carica_id=95)
left outer join v06_cariche_sdr_valide q35_cariche_fac_ad_val on ((q35_fac_cds_ad_val.fac_id = q35_cariche_fac_ad_val.strutt_id)
    and q35_cariche_fac_ad_val.sdr_tip='fac' 
	and q35_cariche_fac_ad_val.carica_id=97)
left outer join docenti q35_preside_fac_ad_val on (q35_cariche_fac_ad_val.matricola_docente = q35_preside_fac_ad_val.matricola)
left outer join docenti q35_presidente_cds_ad_val on (q35_cariche_cds_ad_val.matricola_docente = q35_presidente_cds_ad_val.matricola)
left outer join q35_num_quest_cds_doc_ud 
    on ((q35_dati_comp.aa_off_ad_id_val = q35_num_quest_cds_doc_ud.aa_off_ad_id_val)
    and (q35_dati_comp.ad_id_val = q35_num_quest_cds_doc_ud.ad_id_val)
    and (q35_dati_comp.cds_ad_id_val = q35_num_quest_cds_doc_ud.cds_ad_id_val)
    and (q35_dati_comp.doc_ad_id_val = q35_num_quest_cds_doc_ud.doc_ad_id_val)
    and (q35_dati_comp.ud_id_val = q35_num_quest_cds_doc_ud.ud_id_val)
    and  (nvl(q35_dati_comp.evento_comp,'bozza')=q35_num_quest_cds_doc_ud.evento_comp) 
	and  (nvl(q35_dati_comp.stu_freq_flg_comp,999)=q35_num_quest_cds_doc_ud.stu_freq_flg_comp) 
	and  (nvl(q35_dati_comp.stu_no_aut_flg_comp,999)=q35_num_quest_cds_doc_ud.stu_no_aut_flg_comp))
left outer join p06_dip q35_doc_ad_val_dip_afferenza on (q35_doc_ad_val_dip_afferenza.dip_id = q35_docente_ad_val.dip_id)
left outer join p09_ud_pdsord_doc q35_ud_tipo_copertura on ((q35_dati_comp.aa_off_ad_id_val = q35_ud_tipo_copertura.aa_off_id)
    and (q35_dati_comp.aa_ord_ad_id_val = q35_ud_tipo_copertura.aa_ord_id)
    and (q35_dati_comp.ad_id_val = q35_ud_tipo_copertura.ad_id)
    and (q35_dati_comp.cds_ad_id_val = q35_ud_tipo_copertura.cds_id)
    and (q35_dati_comp.doc_ad_id_val = q35_ud_tipo_copertura.docente_id)
    and (q35_dati_comp.pds_ad_id_val = q35_ud_tipo_copertura.pds_id)
    and (q35_dati_comp.ud_id_val = q35_ud_tipo_copertura.ud_id)) 
    where ((p02_quesiti.questionario_id = 35) 
        and ((q35_dati_comp.aa_off_ad_id_val = '2013') 
        and (q35_dati_comp.dataora_comp < to_date('31/12/2013','dd/mm/yyyy'))) or
 ((q35_dati_comp.aa_off_ad_id_val = '2014') 
        and (q35_dati_comp.dataora_comp < to_date('31/12/2014','dd/mm/yyyy'))) or
 ((q35_dati_comp.aa_off_ad_id_val = '2015') 
        and (q35_dati_comp.dataora_comp < to_date('31/12/2015','dd/mm/yyyy'))) or
 ((q35_dati_comp.aa_off_ad_id_val = '2016') 
        and (q35_dati_comp.dataora_comp < to_date('31/12/2016','dd/mm/yyyy'))))
        group by q35_dati_comp.aa_off_ad_id_val
        order by q35_dati_comp.aa_off_ad_id_val;
		
exec dbms_output.put_line(((dbms_utility.get_time - :n)/100) || ' seconds....' );