CLASS zsbmcl_base_operator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   interfaces if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsbmcl_base_operator IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
    out->write( 'Git Push changes ' ).
  ENDMETHOD.

ENDCLASS.
