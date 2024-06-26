class ZCL_SBM_TRANSACTION_SERVICE definition
  public
  final
  create public .

public section.

  methods M1
    importing
      !IV_EMPNO type ZSBM_EMPL-EMPNO optional
      !IV_EMPNM type ZSBM_EMPL-EMPNAME optional
      !IV_DESIG type ZSBM_EMPL-EMP_DESIGANTION optional .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SBM_TRANSACTION_SERVICE IMPLEMENTATION.


  METHOD m1.

    DATA: transaction         TYPE REF TO if_os_transaction,
          transaction_manager TYPE REF TO if_os_transaction_manager.

    transaction_manager = cl_os_system=>get_transaction_manager( ).
    TRY.

* 1. Create transactioncobject
        transaction = transaction_manager->create_transaction( ).
        transaction->start( ).
        " persistence service call
        DATA : ob_actor TYPE REF TO zca_sbm_persistence_empl .
        DATA : ob_pers  TYPE REF TO zcl_sbm_persistence_empl .
        DATA : v_empno TYPE zsbm_empl-empno,
               v_empnm TYPE zsbm_empl-empname,
               v_desig TYPE zsbm_empl-emp_desigantion.


        ob_actor = zca_sbm_persistence_empl=>agent .
        " Fetch from abap memory
        IMPORT p_empno TO v_empno FROM MEMORY ID  'A3' .
        IMPORT p_empnm TO v_empnm FROM MEMORY ID  'A2' .
        IMPORT p_desig TO v_desig FROM MEMORY ID  'A1' .


        " Update
        ob_pers  = ob_actor->create_persistent( v_empno  )  .
        ob_pers->set_emp_desigantion(  v_desig ).
        ob_pers->set_empname( v_empnm ) .

        transaction->end( ).

      CATCH cx_os_error.
        transaction->undo( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
