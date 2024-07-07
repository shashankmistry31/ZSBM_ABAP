FUNCTION zcl_sbm_api_open_items_01.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_KUNNR) TYPE  KUNNR
*"     REFERENCE(IV_BUKRS) TYPE  BUKRS
*"  EXPORTING
*"     REFERENCE(ES_OPEN_ITEMS) TYPE  ZSBM_OPEN_ITEMS_DEEP_ST_01
*"----------------------------------------------------------------------
  SELECT SINGLE a~kunnr ,  a~name1 , b~bukrs
    FROM kna1  AS a INNER JOIN knb1 AS b ON a~kunnr = b~kunnr
    INTO ( @es_open_items-kunnr , @es_open_items-name1 , @es_open_items-bukrs )
    WHERE a~kunnr = @iv_kunnr AND b~bukrs = @iv_bukrs .

  IF sy-subrc EQ 0.
    SELECT bukrs
          kunnr
          zuonr
          gjahr
          belnr
          buzei
          dmbtr

      FROM bsid
      INTO TABLE es_open_items-item
      WHERE kunnr = es_open_items-kunnr AND bukrs = es_open_items-bukrs .

    IF sy-subrc EQ 0.
      es_open_items-bal_amount = REDUCE dmbtr(  INIT i TYPE dmbtr FOR ls_item IN es_open_items-item NEXT i = i + ls_item-dmbtr ) .

    ENDIF .

  ENDIF .


ENDFUNCTION.
