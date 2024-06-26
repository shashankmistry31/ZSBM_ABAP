class ZCL_SBM_PERSISTENCE_GUID_EMPL definition
  public
  final
  create protected

  global friends ZCB_SBM_PERSISTENCE_GUID_EMPL .

public section.

  interfaces IF_OS_STATE .

  methods GET_EMPNAME
    returning
      value(RESULT) type CHAR10
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_EMPNO
    returning
      value(RESULT) type MANDT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_EMP_DESIGANTION
    returning
      value(RESULT) type CHAR20
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_EMPNAME
    importing
      !I_EMPNAME type CHAR10
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_EMPNO
    importing
      !I_EMPNO type MANDT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_EMP_DESIGANTION
    importing
      !I_EMP_DESIGANTION type CHAR20
    raising
      CX_OS_OBJECT_NOT_FOUND .
protected section.

  data EMPNO type MANDT .
  data EMPNAME type CHAR10 .
  data EMP_DESIGANTION type CHAR20 .
private section.
ENDCLASS.



CLASS ZCL_SBM_PERSISTENCE_GUID_EMPL IMPLEMENTATION.


  method GET_EMPNAME.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute EMPNAME
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = EMPNAME.

           " GET_EMPNAME
  endmethod.


  method GET_EMPNO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute EMPNO
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = EMPNO.

           " GET_EMPNO
  endmethod.


  method GET_EMP_DESIGANTION.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute EMP_DESIGANTION
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = EMP_DESIGANTION.

           " GET_EMP_DESIGANTION
  endmethod.


  method IF_OS_STATE~GET.
***BUILD 090501
     " returning result type ref to object
************************************************************************
* Purpose        : Get state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  create object STATE_OBJECT.
  call method STATE_OBJECT->SET_STATE_FROM_OBJECT( ME ).
  result = STATE_OBJECT.

  endmethod.


  method IF_OS_STATE~HANDLE_EXCEPTION.
***BUILD 090501
     " importing I_EXCEPTION type ref to IF_OS_EXCEPTION_INFO optional
     " importing I_EX_OS type ref to CX_OS_OBJECT_NOT_FOUND optional
************************************************************************
* Purpose        : Handles exceptions during attribute access.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : If an exception is raised during attribut access,
*                  this method is called and the exception is passed
*                  as a paramater. The default is to raise the exception
*                  again, so that the caller can handle the exception.
*                  But it is also possible to handle the exception
*                  here in the callee.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
* - 2000-08-02   : (SB)  OO Exceptions
************************************************************************
* Modify if you like
************************************************************************

  if i_ex_os is not initial.
    raise exception i_ex_os.
  endif.

  endmethod.


  method IF_OS_STATE~INIT.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Initialisation of the transient state partition.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Transient state is initial.
*
* OO Exceptions  : -
*
* Implementation : Caution!: Avoid Throwing ACCESS Events.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~INVALIDATE.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Do something before all persistent attributes are
*                  cleared.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : Whatever you like to do.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~SET.
***BUILD 090501
     " importing I_STATE type ref to object
************************************************************************
* Purpose        : Set state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  STATE_OBJECT ?= I_STATE.
  call method STATE_OBJECT->SET_OBJECT_FROM_STATE( ME ).

  endmethod.


  method SET_EMPNAME.
***BUILD 090501
     " importing I_EMPNAME
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute EMPNAME
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_EMPNAME <> EMPNAME ).

    EMPNAME = I_EMPNAME.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_EMPNAME <> EMPNAME )

           " GET_EMPNAME
  endmethod.


  method SET_EMPNO.
***BUILD 090501
     " importing I_EMPNO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute EMPNO
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_EMPNO <> EMPNO ).

    EMPNO = I_EMPNO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_EMPNO <> EMPNO )

           " GET_EMPNO
  endmethod.


  method SET_EMP_DESIGANTION.
***BUILD 090501
     " importing I_EMP_DESIGANTION
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute EMP_DESIGANTION
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_EMP_DESIGANTION <> EMP_DESIGANTION ).

    EMP_DESIGANTION = I_EMP_DESIGANTION.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_EMP_DESIGANTION <> EMP_DESIGANTION )

           " GET_EMP_DESIGANTION
  endmethod.
ENDCLASS.
