CLASS zsbm_table_function_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .

    CLASS-METHODS fetch_data FOR TABLE FUNCTION zsbm_table_funct_02 .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsbm_table_function_02 IMPLEMENTATION.
  METHOD fetch_data BY DATABASE FUNCTION
                    FOR HDB LANGUAGE SQLSCRIPT
                    OPTIONS READ-ONLY

                    USING zsbm_empl zsbm_empl_salary.

    lt_data = select client  ,
                     zsbm_empl.empno    ,
                     empsalary    ,
                     currency      ,
                     empname         ,
                     emp_desigantion
              FROM zsbm_empl INNER JOIN zsbm_empl_salary
              ON zsbm_empl.empno = zsbm_empl_salary.empno ;



    return :lt_data ;


  endmethod.

ENDCLASS.
