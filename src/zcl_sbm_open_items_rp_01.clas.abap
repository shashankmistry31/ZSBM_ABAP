CLASS zcl_sbm_open_items_rp_01 DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_http_handler
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS if_rest_application~get_root_handler REDEFINITION .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sbm_open_items_rp_01 IMPLEMENTATION.
  METHOD if_rest_application~get_root_handler.


    DATA(lo_router) = NEW cl_rest_router(  ).

    lo_router->attach(
      iv_template      = '/open_items'
      iv_handler_class = 'ZCL_SBM_API_OPEN_ITEMS_REP_01'
*      it_parameter     =
    ).

    ro_root_handler = lo_router.


  ENDMETHOD.

ENDCLASS.
