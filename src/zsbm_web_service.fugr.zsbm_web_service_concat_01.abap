FUNCTION zsbm_web_service_concat_01.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_FIRST_NAME) TYPE  CHAR10 OPTIONAL
*"     VALUE(IV_LAST_NAME) TYPE  CHAR10 OPTIONAL
*"     VALUE(IV_MIDDLE_NAME) TYPE  CHAR10 OPTIONAL
*"     VALUE(IV_COUNTER) TYPE  INT2 OPTIONAL
*"  EXPORTING
*"     VALUE(EV_OUTPUT) TYPE  CHAR200
*"----------------------------------------------------------------------



  ev_output = |{ iv_first_name }| && | | && |{ iv_middle_name }| && | | && |{ iv_last_name }| .

  DATA: log TYPE REF TO zif_logger.

  log = zcl_logger_factory=>create_log( object = 'ZSBM'
                                        subobject = 'ZSBM_NORM'
                                        desc = 'Stuff imported from legacy systems' ).

  log->s( | Importing parameter | && |{ iv_counter }|  ).

ENDFUNCTION.
