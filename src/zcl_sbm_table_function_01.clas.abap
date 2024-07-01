CLASS zcl_sbm_table_function_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .

    CLASS-METHODS get_data FOR TABLE FUNCTION zsbm_cds_table_function_01 .

  PROTECTED SECTION.



  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sbm_table_function_01 IMPLEMENTATION.

  METHOD get_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING vbak .

    it_vbak = select mandt as client_element_name , vbeln from vbak
                    where mandt = :client
                 ;

    RETURN :it_vbak ;
  ENDMETHOD.

ENDCLASS.
