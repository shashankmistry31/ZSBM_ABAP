*&---------------------------------------------------------------------*
*& Report ZSBM_ALV_OOPS_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_alv_oops_01.

INCLUDE zsbm_alv_oops_01_status_900o01.

INCLUDE zsbm_alv_oops_01_user_commai01.

INCLUDE zsbm_alv_oops_01_se.

INCLUDE zsbm_alv_oops_01_global.


START-OF-SELECTION .

  IF so_kunnr IS NOT INITIAL. .

    CALL SCREEN 9000 .

  ENDIF.



MODULE status_9000 OUTPUT.
  SET PF-STATUS 'ZSBM_STATUS_01'.
  SET TITLEBAR 'ZSBM_ALV_TITLE_01'.

  PERFORM fetch_data .

  IF gt_kna1 IS NOT INITIAL.
    PERFORM display_alv_9000.
  ENDIF .


ENDMODULE.

FORM fetch_data .
  SELECT  kunnr
          land1
          name1
          name2
          ort01
          pstlz
          regio
    FROM kna1
    INTO TABLE gt_kna1 .
ENDFORM.


MODULE user_command_9000 INPUT.

  CASE sy-ucomm .
    WHEN 'BACK'.
      LEAVE PROGRAM .


  ENDCASE .
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form display_alv_9000
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv_9000 .

  IF go_alv_9000 IS NOT BOUND .
    CREATE OBJECT go_cont_9000
      EXPORTING
        container_name = 'CC01'.                 " Name of the Screen CustCtrl Name to Link Container To
    IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    CREATE OBJECT go_alv_9000
      EXPORTING
        i_parent = go_cont_9000.                " Parent Container
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    PERFORM display_first_screen .

  ELSE.
    go_alv_9000->refresh_table_display( ).

  ENDIF .

ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_first_screen
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_first_screen .

  PERFORM prepare_kna1_field_catalog .
  PERFORM register_kna1_events .

  go_alv_9000->set_table_for_first_display(
    CHANGING
      it_outtab                     =  gt_kna1                " Output Table
      it_fieldcatalog               =  gt_kna1_fieldcatalog                " Field Catalog
  ).
  IF sy-subrc <> 0.
*        MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*          WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form prepare_kna1_field_catalog
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM prepare_kna1_field_catalog .

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
*     I_BUFFER_ACTIVE  =
      i_structure_name = 'ZSBM_KNA1'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_BYPASSING_BUFFER           =
*     I_INTERNAL_TABNAME           =
    CHANGING
      ct_fieldcat      = gt_kna1_fieldcatalog
*   EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR    = 2
*     OTHERS           = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

CLASS gcl_eventreceiver IMPLEMENTATION .

  METHOD handle_double_click .

    IF e_column-fieldname EQ 'KUNNR'.

      gv_kunnr = VALUE kunnr( gt_kna1[ e_row-index ]-kunnr OPTIONAL  ) .

      SELECT * FROM vbak
              INTO CORRESPONDING FIELDS OF TABLE gt_vbak  WHERE
              kunnr EQ   gv_kunnr.
      IF gt_vbak IS NOT INITIAL .
        CALL SCREEN 9001 .

      ENDIF.

    ELSE .
      MESSAGE 'Only click on the Customer number column' TYPE 'I'.
    ENDIF .

  ENDMETHOD .

  METHOD handle_button_click.

    CASE es_col_id .
      WHEN 'VBELN'.

      WHEN OTHERS .
        MESSAGE 'WRONG button clicked' TYPE  'I' .
    ENDCASE .



    MESSAGE 'Button Clicked' TYPE 'I' .

  ENDMETHOD .

ENDCLASS .
*&---------------------------------------------------------------------*
*& Form register_kna1_events
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM register_kna1_events .

  DATA : ob1 TYPE REF TO gcl_eventreceiver .

  CREATE OBJECT ob1.

  SET HANDLER ob1->handle_double_click  FOR go_alv_9000.

ENDFORM.
*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
  SET PF-STATUS 'ZSBM_STATUS_02'.
  SET TITLEBAR 'ZSBM_ALV_TITLE_02'.
  PERFORM display_sales_order .
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      CALL SCREEN 9000 .
    WHEN OTHERS .
      LEAVE PROGRAM .
  ENDCASE .
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form display_sales_order
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_sales_order .

  IF go_alv_9001 IS NOT BOUND .

    CREATE OBJECT go_cont_9001
      EXPORTING
        container_name = 'CC2'.                 " Name of the Screen CustCtrl Name to Link Container To
    IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    CREATE OBJECT go_alv_9001
      EXPORTING
        i_parent = go_cont_9001.                " Parent Container
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

  ELSE.
    go_alv_9001->refresh_table_display(
    ).
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.


  ENDIF.


  PERFORM display_second_screen .


ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_second_screen
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_second_screen .
  PERFORM prepare_vbak_field_catalog .
  PERFORM prepare_vbak_layout .
  PERFORM register_sales_order_events .

  go_alv_9001->set_table_for_first_display(
      EXPORTING
      is_layout                     = gs_layout
    CHANGING
      it_outtab                     =  gt_vbak                 " Output Table
      it_fieldcatalog               =  gt_vbak_fieldcatalog                " Field Catalog


  ).
  IF sy-subrc <> 0.
*        MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*          WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form prepare_vbak_field_catalog
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM prepare_vbak_field_catalog .
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'VBAK'
    CHANGING
      ct_fieldcat      = gt_vbak_fieldcatalog.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  LOOP AT gt_vbak_fieldcatalog ASSIGNING FIELD-SYMBOL(<fs_fieldcatalog>).
    <fs_fieldcatalog>-ref_table = '' .
  ENDLOOP.

  DATA : wa_cell_style TYPE lvc_s_styl .
  LOOP AT gt_vbak ASSIGNING FIELD-SYMBOL(<fs_vbak>) .
    IF <fs_vbak>-netwr > 1000.
      wa_cell_style-fieldname ='VBELN'.
      wa_cell_style-style = cl_gui_alv_grid=>mc_style_button .
      APPEND wa_cell_style TO <fs_vbak>-cell_style .
      CLEAR wa_cell_style .
    ENDIF.

  ENDLOOP .
ENDFORM.
*&---------------------------------------------------------------------*
*& Form prepare_vbak_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM prepare_vbak_layout .

  gs_layout-stylefname =  'CELL_STYLE' .
ENDFORM.
*&---------------------------------------------------------------------*
*& Form register_sales_order_events
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM register_sales_order_events .

  DATA(ob2) = NEW gcl_eventreceiver( ) .
  SET  HANDLER ob2->handle_button_click FOR go_alv_9001 .

ENDFORM.
