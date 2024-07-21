*&---------------------------------------------------------------------*
*& Report ZSBM_BRF_PLUS_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_brf_plus_01.

PARAMETERS : p_input TYPE zsbm_duration_de .

CONSTANTS:lv_function_id TYPE if_fdt_types=>id VALUE '173D09C4E9E21EDF91CDDD37340541B3'.
DATA:lv_timestamp  TYPE timestamp,
     lt_name_value TYPE abap_parmbind_tab,
     ls_name_value TYPE abap_parmbind,
     lr_data       TYPE REF TO data,
     lx_fdt        TYPE REF TO cx_fdt,
     la_zinput     TYPE if_fdt_types=>element_text,
     la_zoutput    TYPE zsbm_fd_interest_rate_de.
FIELD-SYMBOLS <la_any> TYPE any.
****************************************************************************************************
* All method calls within one processing cycle calling the same function must use the same timestamp.
* For subsequent calls of the same function, we recommend to use the same timestamp for all calls.
* This is to improve the system performance.
****************************************************************************************************
* If you are using structures or tables without DDIC binding, you have to declare the respective types
* by yourself. Insert the according data type at the respective source code line.
****************************************************************************************************
GET TIME STAMP FIELD lv_timestamp.
****************************************************************************************************
* Process a function without recording trace data, passing context data objects via a name/value table.
****************************************************************************************************
* Prepare function processing:
****************************************************************************************************
DATA(lv_input) =  CONV i(  p_input  )  .
*lv_input = |{ lv_input ALPHA = OUT }| .
ls_name_value-name = 'ZINPUT'.
la_zinput = lv_input.
GET REFERENCE OF la_zinput INTO lr_data.
ls_name_value-value = lr_data.
INSERT ls_name_value INTO TABLE lt_name_value.
CLEAR ls_name_value.
****************************************************************************************************
* Result data object is bound to DDIC type
* Let BRFplus convert the result into the external DDIC format:
****************************************************************************************************
GET REFERENCE OF la_zoutput INTO lr_data.
ASSIGN lr_data->* TO <la_any>.
TRY.
    cl_fdt_function_process=>process( EXPORTING iv_function_id = lv_function_id
                                                iv_timestamp   = lv_timestamp
                                      IMPORTING ea_result      = <la_any>
                                      CHANGING  ct_name_value  = lt_name_value ).
  CATCH cx_fdt INTO lx_fdt.
****************************************************************************************************
* You can check CX_FDT->MT_MESSAGE for error handling.
****************************************************************************************************
ENDTRY.

WRITE : / <la_any> .
