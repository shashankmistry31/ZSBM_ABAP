CLASS zcl_sbm_ac_test_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sbm_ac_test_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT * FROM zsbm_cds_consume_assoc_01
    WITH PRIVILEGED ACCESS
    INTO TABLE @DATA(lt_association_01)

    .

    out->write( lt_association_01 ).


  ENDMETHOD.
ENDCLASS.
