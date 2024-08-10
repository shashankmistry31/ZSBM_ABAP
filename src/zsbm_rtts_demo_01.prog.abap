*&---------------------------------------------------------------------*
*& Report ZSBM_RTTS_DEMO_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_rtts_demo_01.
TRY.
    DATA: fldate TYPE sflights-fldate.

    " Components of the dynamically created table
    DATA(components) = VALUE cl_abap_structdescr=>component_table(

" Creates a component called CARRID of type CHAR(3)
                        (
                          name = 'CARRID'
                          type = cl_abap_elemdescr=>get_c( 3 ) " S_CARR_ID
                        )

" Creates a component called CONNID of type NUMC(4)
                        (
                          name = 'CONNID'
                          type = cl_abap_elemdescr=>get_n( 4 ) " S_CONN_ID
                        )

" Creates a component called CARRNAME based on the DDIC data element S_CARRNAME
                        (
                          name = 'CARRNAME'
                          type = CAST #( cl_abap_elemdescr=>describe_by_name( 'S_CARRNAME' ) )
                        )

" Creates a component called FLDATE based on the variable fldate (see above)
                        (
                          name = 'FLDATE'
                          type = CAST #( cl_abap_datadescr=>describe_by_data( fldate ) )
                        )
                    ).

    " Generate structure description object based on the created component table 'components'
    DATA(struct_desc) = cl_abap_structdescr=>create( components ).


    " Create table description object
    " Dyanmic line type, table type STANDARD TABLE and user-defined NON-UNIQUE KEY
    DATA(table_desc) = cl_abap_tabledescr=>create(
                            p_line_type  = struct_desc
                            p_table_kind = cl_abap_tabledescr=>tablekind_std
                            p_unique     = abap_false
                            p_key        = VALUE #(
                                             ( name = 'CARRID' )
                                             ( name = 'CONNID' )
                                           )
                            p_key_kind   = cl_abap_tabledescr=>keydefkind_user
                       ).

    " Create a RTTC table object using the table description class
    DATA: table TYPE REF TO data.
    CREATE DATA table TYPE HANDLE table_desc.

    FIELD-SYMBOLS <table> TYPE ANY TABLE.
    ASSIGN table->* TO <table>.

    " Select data from database and fill dynamically created table
    SELECT * FROM sflights INTO CORRESPONDING FIELDS OF TABLE @<table>.

    " Demo Output
    cl_demo_output=>display( <table> ).

  CATCH cx_root INTO DATA(e).
    WRITE: / e->get_text( ).
ENDTRY.
