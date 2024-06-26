*&---------------------------------------------------------------------*
*& Report ZSBM_ALV_OOPS_PERSISTENT_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_alv_oops_persistent_guid.

DATA : ob_actor TYPE REF TO zca_sbm_persistence_guid_empl .
DATA : ob_pers  TYPE REF TO zcl_sbm_persistence_guid_empl .

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001 .
  PARAMETERS : p_guid  TYPE zsbm_empl_guid-guid .
  PARAMETERS : p_empno TYPE zsbm_empl_guid-empno .
  PARAMETERS : p_empnm TYPE zsbm_empl_guid-empname .
  PARAMETERS : p_desig TYPE zsbm_empl_guid-emp_desigantion .

  PARAMETERS : rb1 TYPE char1 RADIOBUTTON GROUP grp1 USER-COMMAND fc1.
  PARAMETERS : rb2 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb3 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb4 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb5 TYPE char1 RADIOBUTTON GROUP grp1 DEFAULT 'X' .


SELECTION-SCREEN END OF BLOCK b1 .


AT SELECTION-SCREEN ON RADIOBUTTON GROUP grp1 .

  " Get the isntance of singleton class by accessing the Static component
  ob_actor = zca_sbm_persistence_guid_empl=>agent .

  CASE  sy-ucomm.
    WHEN 'FC1'.
      " Create entry in tables
      IF rb1 IS NOT INITIAL .

        ob_pers = ob_actor->create_persistent( ).

        IF ob_pers IS BOUND .
          ob_pers->set_empno( p_empno ).
          ob_pers->set_emp_desigantion( p_desig ).
          ob_pers->set_empname( p_empnm ).
          COMMIT WORK .
        ENDIF.


      ELSEIF rb2 IS NOT INITIAL .
*      " Read
        DATA(ob_super) =  ob_actor->if_os_ca_persistency~get_persistent_by_oid( i_oid = p_guid ) .
        ob_pers ?= ob_super .
        IF ob_pers IS BOUND .
          p_empno = ob_pers->get_empno( ) .
          p_empnm = ob_pers->get_empname( ) .
          p_desig = ob_pers->get_emp_desigantion( )  .
        ENDIF.
*
        LEAVE LIST-PROCESSING.


      ELSEIF rb3 IS NOT INITIAL .



*      " Update
        CLEAR :  ob_pers , ob_super .
        " Read
        ob_super =  ob_actor->if_os_ca_persistency~get_persistent_by_oid( i_oid = p_guid ) .
        ob_pers ?= ob_super .
        CHECK ob_pers IS BOUND.
        ob_pers->set_emp_desigantion( p_desig ) .
        ob_pers->set_empno( p_empno ) .
        ob_pers->set_empname( p_empnm ) .
        COMMIT WORK .



      ELSEIF rb4 IS NOT INITIAL .
*      " Delete
*      ob_actor->delete_persistent( p_empno ) .
*      COMMIT WORK .
        CLEAR :  ob_pers , ob_super .
        " Read
        ob_super =  ob_actor->if_os_ca_persistency~get_persistent_by_oid( i_oid = p_guid ) .
        ob_pers ?= ob_super .
        CHECK ob_pers IS BOUND.
        ob_actor->if_os_factory~delete_persistent( ob_pers ) .
        COMMIT WORK .
        CLEAR :  p_desig , p_empnm , p_empno .
        LEAVE TO LIST-PROCESSING .

      ELSEIF rb5 IS NOT INITIAL .

      ENDIF .

    WHEN OTHERS.
  ENDCASE.
