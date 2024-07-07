class ZCL_SBM_API_OPEN_ITEMS_REP_01 definition
  public
  inheriting from CL_REST_RESOURCE
  final
  create public .

public section.

  methods IF_REST_RESOURCE~GET
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SBM_API_OPEN_ITEMS_REP_01 IMPLEMENTATION.


  METHOD if_rest_resource~get.
*CALL METHOD SUPER->IF_REST_RESOURCE~GET
*    .

    DATA : ls_open_items TYPE zsbm_open_items_deep_st_01 .
    DATA : lv_kunnr TYPE kunnr .
    DATA : lv_bukrs TYPE bukrs .

    lv_kunnr  = mo_request->get_uri_query_parameter( 'KUNNR' ).
    lv_bukrs  = mo_request->get_uri_query_parameter( 'BUKRS' ).

    lv_kunnr = |{  lv_kunnr ALPHA = IN }| .
    lv_bukrs = |{  lv_bukrs ALPHA = IN }| .

    IF lv_kunnr IS NOT INITIAL AND lv_bukrs IS NOT INITIAL .
      CALL FUNCTION 'ZCL_SBM_API_OPEN_ITEMS_01'
        EXPORTING
          iv_kunnr      = lv_kunnr
          iv_bukrs      = lv_bukrs
        IMPORTING
          es_open_items = ls_open_items.

      " Serialisation
      DATA(serialised_data)  = /ui2/cl_json=>serialize(
         EXPORTING
           data             =   ls_open_items               " Data to serialize
       ).

      " Set Data
      mo_response->create_entity( )->set_string_data( iv_data = serialised_data ) .

      " Set Header
      mo_response->set_header_field(
        iv_name  =  'Content-Type'                " Header Name
        iv_value =  'application/JSON'                " Header Value
      ).


    ENDIF .
  ENDMETHOD.
ENDCLASS.
