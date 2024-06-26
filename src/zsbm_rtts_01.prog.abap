*&---------------------------------------------------------------------*
*& Report zsbm_rtts_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_rtts_01.


DATA : ob_typedescr TYPE REF TO cl_abap_typedescr .
DATA : ob_structdescr TYPE REF TO cl_abap_structdescr .
DATA : ob_tabledescr TYPE REF TO cl_abap_tabledescr .

PARAMETERS : p_tabnam TYPE dd02l-tabname .


START-OF-SELECTION .

  IF p_tabnam IS NOT INITIAL .

    cl_abap_typedescr=>describe_by_name(
      EXPORTING
        p_name         = p_tabnam
      RECEIVING
        p_descr_ref    = ob_typedescr
      EXCEPTIONS
        type_not_found = 1
        OTHERS         = 2
    ).
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    IF ob_typedescr IS BOUND .

      ob_structdescr ?= ob_typedescr .

    ENDIF.

    IF ob_structdescr IS BOUND .
      cl_abap_tabledescr=>create(
        EXPORTING
          p_line_type  = ob_structdescr
*            p_table_kind = tablekind_std
*            p_unique     = abap_false
*            p_key        =
*            p_key_kind   = keydefkind_default
        RECEIVING
          p_result     = ob_tabledescr
      ).
*        CATCH cx_sy_table_creation.


      DATA wa_ref TYPE REF TO data .
      DATA it_ref TYPE REF TO data .

      CREATE DATA wa_ref TYPE HANDLE ob_structdescr .
      CREATE DATA it_ref TYPE HANDLE ob_tabledescr .


      FIELD-SYMBOLS <fs> .
      FIELD-SYMBOLS <fwa> TYPE any .
      FIELD-SYMBOLS <fit> TYPE ANY TABLE .

      ASSIGN wa_ref->* TO <fwa> .
      ASSIGN it_ref->* TO <fit> .


      SELECT * FROM (p_tabnam)  INTO TABLE <fit> .

      LOOP AT <fit> ASSIGNING <fwa>.

        DO.
          ASSIGN COMPONENT sy-index OF STRUCTURE <fwa> TO <fs>.
          IF sy-subrc EQ 0.
            WRITE : <fs> .
          ELSE.
            EXIT.
          ENDIF.

        ENDDO.

        NEW-LINE .

      ENDLOOP.


    ENDIF.














  ENDIF.
