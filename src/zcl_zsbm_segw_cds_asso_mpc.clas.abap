class ZCL_ZSBM_SEGW_CDS_ASSO_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_ZSBM_CDS_SADL_ASSOCIATION_0.
      include type ZSBM_CDS_SADL_ASSOCIATION_01.
  types:
    end of TS_ZSBM_CDS_SADL_ASSOCIATION_0 .
  types:
   TT_ZSBM_CDS_SADL_ASSOCIATION_0 type standard table of TS_ZSBM_CDS_SADL_ASSOCIATION_0 .
  types:
    begin of TS_ZSBM_CDS_SBOOKTYPE.
      include type ZSBM_CDS_SBOOK.
  types:
    end of TS_ZSBM_CDS_SBOOKTYPE .
  types:
   TT_ZSBM_CDS_SBOOKTYPE type standard table of TS_ZSBM_CDS_SBOOKTYPE .

  constants GC_ZSBM_CDS_SADL_ASSOCIATION_0 type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZSBM_CDS_SADL_ASSOCIATION_01Type' ##NO_TEXT.
  constants GC_ZSBM_CDS_SBOOKTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZSBM_CDS_SBOOKType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZSBM_SEGW_CDS_ASSO_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZSBM_SEGW_CDS_ASSOC_SADL_01_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20240720082904'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
*    @@TYPE_SWITCH:
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20240720045905'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root ##CATCH_ALL.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20240720045905'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="ZSBM_CDS_SADL_ASSOCIATION_01" binding="ZSBM_CDS_SADL_ASSOCIATION_01" />|  &
               | <sadl:dataSource type="CDS" name="ZSBM_CDS_SBOOK" binding="ZSBM_CDS_SBOOK" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="ZSBM_CDS_SADL_ASSOCIATION_01" dataSource="ZSBM_CDS_SADL_ASSOCIATION_01" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_BOOKING" binding="_BOOKING" target="ZSBM_CDS_SBOOK" cardinality="oneToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZSBM_CDS_SBOOK" dataSource="ZSBM_CDS_SBOOK" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZSBM_SEGW_CDS_ASSOC_SADL_01' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
