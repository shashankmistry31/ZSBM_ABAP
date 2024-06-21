*&---------------------------------------------------------------------*
*& Report ZSBM_ALV_OOPS_PERSISTENT_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_alv_oops_persistent_01.

DATA : ob_actor TYPE REF TO zca_sbm_persistence_empl .
DATA : ob_pers  TYPE REF TO zcl_sbm_persistence_empl .

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001 .

  PARAMETERS : p_empno TYPE zsbm_empl-empno .
  PARAMETERS : p_empnm TYPE zsbm_empl-empname .
  PARAMETERS : p_desig TYPE zsbm_empl-emp_desigantion .

  PARAMETERS : rb1 TYPE char1 RADIOBUTTON GROUP grp1 USER-COMMAND fc1.
  PARAMETERS : rb2 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb3 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb4 TYPE char1 RADIOBUTTON GROUP grp1 .
  PARAMETERS : rb5 TYPE char1 RADIOBUTTON GROUP grp1 DEFAULT 'X' .


SELECTION-SCREEN END OF BLOCK b1 .


AT SELECTION-SCREEN ON RADIOBUTTON GROUP grp1 .

  ob_actor = zca_sbm_persistence_empl=>agent .

  CASE  sy-ucomm.
    WHEN 'FC1'.
      " Create entry in tables
      IF rb1 IS NOT INITIAL .


        TRY.
            ob_actor->create_persistent(
              EXPORTING
                i_empno =  p_empno                " Business Key
              RECEIVING
                result  =  ob_pers                " Newly Generated Persistent Object
            ).
          CATCH cx_os_object_existing. " Object Services Exception

        ENDTRY.

        IF ob_pers IS BOUND .


          " Now update the fields
          TRY.
              ob_pers->set_emp_desigantion( i_emp_desigantion =  p_desig ).
            CATCH cx_os_object_not_found. " Object Services Exception

          ENDTRY.

          TRY.
              ob_pers->set_empname( i_empname = p_empnm ).
            CATCH cx_os_object_not_found. " Object Services Exception

          ENDTRY.

          COMMIT WORK .
        ENDIF.


      ELSEIF rb2 IS NOT INITIAL .
        " Read
        p_empnm =  ob_actor->get_persistent( p_empno )->get_empname( ) .
        p_desig =  ob_actor->get_persistent( p_empno )->get_emp_desigantion( ) .

        LEAVE LIST-PROCESSING.


      ELSEIF rb3 IS NOT INITIAL .
        " Update
        ob_actor->get_persistent( p_empno )->set_emp_desigantion(  p_desig ).
        ob_actor->get_persistent( p_empno )->set_empname( p_empnm ) .
        COMMIT WORK .

      ELSEIF rb4 IS NOT INITIAL .
        " Delete
        ob_actor->delete_persistent( p_empno ) .
        COMMIT WORK .

      ELSEIF rb5 IS NOT INITIAL .

      ENDIF .

    WHEN OTHERS.
  ENDCASE.
