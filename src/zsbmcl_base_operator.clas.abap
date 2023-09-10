CLASS zsbmcl_base_operator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsbmcl_base_operator IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

    " First Structure
    DATA:
      BEGIN OF struct1,
        col1 TYPE i VALUE 11,
        col2 TYPE i VALUE 12,
      END OF struct1.

    " Second Structure
    DATA:
      BEGIN OF struct2,
        col2 TYPE i VALUE 22,
        col3 TYPE i VALUE 23,
      END OF struct2.

    " Here we are assigning structure 1 value to structure 2
    " First structure 2 will be cleared and then assignment will happen.
    struct2 = CORRESPONDING #( struct1 ). " Struct2 will have value 12 ,0
    out->write( struct2 ) .


    struct2  = VALUE #( col2 = 22  col3 = 23 ) .
    " It is different from below statement
    " here the target variable will not be cleared.
    MOVE-CORRESPONDING struct1 TO struct2.  " struct2 will have value 12,23
    out->write( struct2 ) .

    " so if you dont want clear operation to be performed first, use BASE
    " below operation is similar to MOVE-CORRESPONDING
    struct2  = VALUE #( col2 = 22  col3 = 23 ) .
    struct2 = CORRESPONDING #( BASE ( struct2 )  struct1 ) . " struct2 will have value 12,23
    out->write( struct2 ) .

    " You can also change the values of specific field
    struct2 = VALUE #( col2 = 22  col3 = 23 ) .
    struct2 = VALUE #( BASE struct1  col3 = 33 ). " struct2 will have value 11 , 33 - No Corresponding will take place
    out->write( struct2 ) .

    " Now lets see the internal tables
    DATA : itab TYPE SORTED TABLE OF  i WITH UNIQUE KEY TABLE_LINE .
    itab = VALUE #( ( 1 ) ( 2 )  ( 3 ) ). " Itab will have 1 , 2 , 3 value
    itab = VALUE #( ( 4 ) ( 5 )  ( 6 ) ). " itab will have 4 , 5 , 6 value  (it will erase the 1,2,3 first)

*    This is not the same as
*    APPEND 1 TO itab.
*    APPEND 2 TO itab.
*    APPEND 3 TO itab.
*    APPEND 4 TO itab.
*    APPEND 5 TO itab.
*    APPEND 6 TO itab.

    " lets say we want to append the values , not clearning first
    "Output should look like 1,2,3,4,5,6
    itab = VALUE #( BASE itab ( 1 ) ( 2 )  ( 3 ) ). " the already has value 4,5,6 will not be lost
    out->write( itab ) .


  ENDMETHOD.

ENDCLASS.
