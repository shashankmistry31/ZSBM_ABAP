CLASS zcl_sbm_advanced_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sbm_advanced_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA lvbak              TYPE vbak.

    DATA v_vbeln            TYPE bapivbeln-vbeln.
    DATA v_order_header_inx TYPE bapisdh1x.
    DATA i_item             TYPE TABLE OF bapisditm.
    DATA ls_item            TYPE bapisditm.
    DATA i_itemx            TYPE TABLE OF bapisditmx.
    DATA i_schedule_lines   TYPE TABLE OF bapischdl.
    DATA ls_schedule_lines  TYPE bapischdl.
    DATA i_schedule_linesx  TYPE TABLE OF bapischdlx.
    DATA ls_schedule_linesx TYPE bapischdlx.
    DATA i_return           TYPE TABLE OF bapiret2 WITH EMPTY KEY
                            WITH NON-UNIQUE SORTED KEY line COMPONENTS type. .
    DATA lposnr             TYPE vbap-posnr.

    SELECT SINGLE * FROM vbak INTO lvbak WHERE vbeln = '0000000042'.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    SELECT MAX( posnr ) FROM vbap
      INTO lposnr
      WHERE vbeln = '0000000042'.



    lposnr += 10.

    v_order_header_inx-updateflag = if_kbas_bapi_call_up_types=>gc_call_up_type_update.

    v_vbeln = '0000000042'.
    ls_item-itm_number = lposnr.
    ls_item-material   = '000000000000000185'.
* i_item-sales_unit = 'KG'.
* i_item-plant      = '1100'.

*i_itemx-itm_number   = lposnr.
*i_itemx-updateflag   = 'I'.
*i_itemx-material     = 'X'.
*i_itemx-plant        = 'X'.
*i_itemx-sales_unit   = 'X'.

    ls_schedule_lines = VALUE bapischdl( itm_number = lposnr
                                         sched_line = 1
                                         req_date   = sy-datum
                                         req_qty    = 1 ).

    ls_schedule_linesx = VALUE bapischdlx( itm_number = lposnr
                                           sched_line = 1
                                           updateflag = 'I'
                                           req_date   = xsdbool( ls_schedule_lines-req_date IS NOT INITIAL ) " XSDBOOL Function usage
                                           req_qty    = xsdbool( ls_schedule_lines-req_qty IS NOT INITIAL ) ).


    APPEND ls_item TO i_item.
*APPEND i_itemx.
    APPEND ls_schedule_lines TO i_schedule_lines.

    APPEND ls_schedule_linesx TO i_schedule_linesx.

    CALL FUNCTION 'BAPI_SALESORDER_CHANGE'
      EXPORTING
        salesdocument    = v_vbeln
        order_header_inx = v_order_header_inx
      TABLES
        return           = i_return
        order_item_in    = i_item
        order_item_inx   = i_itemx
        schedule_lines   = i_schedule_lines
        schedule_linesx  = i_schedule_linesx.

    "Want to get the count of the error messages using REDUCE
    DATA(i_error_count) = REDUCE i( INIT x TYPE i
                                    FOR ls_temp_return IN i_return WHERE (  type = 'E' )
                                    NEXT x = x + 1
                                   ).


    DATA(i_error_count1) = lines( FILTER #(  i_return USING KEY line WHERE type = 'E' ) ).

    " Different type of messages
    DATA(lv_mess_type_number) = REDUCE i( INIT x = 0
                                    FOR GROUPS <group_key> OF <group> IN i_return GROUP BY <group>-type
                                    NEXT x = x + 1
                                   ).
    " Value operator directly in the WHERE clause
    SELECT  FROM vbap
      FIELDS vbeln , posnr
*      WHERE vbeln IN @(  VALUE rsdsselopt_t( ( sign = 'I' option = 'EQ' low = '0000000042' ) ) ).
      WHERE posnr = @(  VALUE #( i_item[  itm_number = '0000000010' ]-itm_number OPTIONAL  ) )
      INTO TABLE @DATA(lt_vbap) .

    " TODO: variable is assigned but never used (ABAP cleaner)
    LOOP AT i_return INTO DATA(ls_return) WHERE type = 'A' OR type = 'E'.
      EXIT.
    ENDLOOP.

    "If name1 is null the function will return name2. Else name1.

    SELECT FROM kna1
    FIELDS kunnr , coalesce( name2, name1 ) AS name
    INTO TABLE @DATA(lt_value).

    IF sy-subrc <> 0.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.
    ENDIF.
    out->write( lt_value ).
  ENDMETHOD.
ENDCLASS.
