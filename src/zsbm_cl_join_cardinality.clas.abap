CLASS zsbm_cl_join_cardinality DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsbm_cl_join_cardinality IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "    left outer join cardinality concept
*    SELECT * FROM ZSBM_CDS_JOIN_CARDINALITY
*        INTO TABLE @DATA(lt_output) .

*    SELECT
*    carrid ,
*    carrname
*    FROM
*    zsbm_cds_association_01
*    INTO TABLE @DATA(lt_output) .
*    out->write( lt_output ).

    "   for showing the CDS association cardinality impact
    SELECT SUM( paymentsum )
    FROM zsbm_cds_association_02
    INTO TABLE @DATA(lt_output1).
*    WHERE carrid = 'AA'
*     AND  connid = '0017'
*     AND  fldate = '20230922'.

    .
    out->write(  lt_output1 ).


    SELECT carrid , connid , paymentsum , class
    FROM zsbm_cds_association_02
    INTO TABLE @DATA(lt_output2).
*    WHERE carrid = 'AA'
*     AND  connid = '0017'
*     AND  fldate = '20230922'.


    DATA(lv_total) = REDUCE netwr( INIT lv_sum TYPE s_sum
                                    FOR ls_output2 IN lt_output2
                                    NEXT lv_sum = lv_sum + ls_output2-paymentsum
                                    ) .


    out->write(  lv_total ).







  ENDMETHOD.
ENDCLASS.
