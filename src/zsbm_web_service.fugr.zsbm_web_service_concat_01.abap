FUNCTION zsbm_web_service_concat_01.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_FIRST_NAME) TYPE  CHAR10
*"     VALUE(IV_LAST_NAME) TYPE  CHAR10
*"     VALUE(IV_MIDDLE_NAME) TYPE  CHAR10
*"  EXPORTING
*"     VALUE(EV_OUTPUT) TYPE  CHAR200
*"----------------------------------------------------------------------



  ev_output = |{ iv_first_name }| && | | && |{ iv_middle_name }| && | | && |{ iv_last_name }| .

ENDFUNCTION.
