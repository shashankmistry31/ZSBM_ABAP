*&---------------------------------------------------------------------*
*& Report zsbm_salv_ida_annotation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_salv_ida_annotation.


*SELECT * FROM zsbm_cds_association_02
*INTO TABLE @DATA(lt_output)
*WHERE carrid = 'AA' .


*cl_salv_gui_table_ida=>create_for_cds_view(
*  EXPORTING
*    iv_cds_view_name      = 'ZSBM_CDS_ASSOCIATION_02'
*)->fullscreen(  )->display(  ).
*CATCH cx_salv_db_connection.
*CATCH cx_salv_db_table_not_supported.
*CATCH cx_salv_ida_contract_violation.
*CATCH cx_salv_function_not_supported.


cl_dd_ddl_annotation_service=>get_annos(
  EXPORTING
    entityname         = 'ZSBM_CDS_ASSOCIATION_02'
*    variant            = ''
*    language           = SY-LANGU
*    extend             = abap_false
*    metadata_extension = abap_true
*    translation        = abap_true
*    null_values        = abap_false
  IMPORTING
    entity_annos       = DATA(ls_entity_annos)
    element_annos      = DATA(ls_element_annos)
*    parameter_annos    =
*    annos_tstmp        =
).

cl_demo_output=>write( ls_entity_annos ).
cl_demo_output=>display( ls_element_annos ).
