*&---------------------------------------------------------------------*
*& Report zsbm_singleton_local_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_singleton_local_class.


CLASS lc_definition DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    CLASS-METHODS object_method RETURNING VALUE(lo_obj) TYPE REF TO lc_definition.
    CLASS-DATA lc_attr1 TYPE int4.
    METHODS m2 .

  PROTECTED SECTION.

    CLASS-DATA ob TYPE REF TO lc_definition.


  PRIVATE SECTION .




ENDCLASS.

CLASS lc_definition IMPLEMENTATION.

  METHOD class_constructor.
    CREATE OBJECT ob.

  ENDMETHOD.

  METHOD object_method.

    lo_obj =  ob.

  ENDMETHOD.

  METHOD m2.
    WRITE : / 'Implementation for M2 ' .
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION .

  DATA(lo_object) = lc_definition=>object_method(  ) .
  lo_object->m2(  ) .
