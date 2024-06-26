*&---------------------------------------------------------------------*
*& Report ZSBM_ALV_OOPS_TRANSACTION_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_alv_oops_transaction_01.


PARAMETERS : p_empno TYPE zsbm_empl-empno .
PARAMETERS : p_empnm TYPE zsbm_empl-empname .
PARAMETERS : p_desig TYPE zsbm_empl-emp_desigantion .


DATA(ob1) = NEW zcl_sbm_transaction_service( ) .

EXPORT p_desig TO MEMORY ID 'A1'.
EXPORT p_empnm TO MEMORY ID 'A2'.
EXPORT p_empno TO MEMORY ID 'A3'.

CALL TRANSACTION 'ZSBM_TR' .
*ob1->m1(
*  iv_desig = p_desig
*  iv_empno = p_empno
*  iv_empnm = p_empnm
*
* ) .
