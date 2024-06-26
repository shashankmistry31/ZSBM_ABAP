CLASS zcl_sbm_path_exp_opn_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sbm_path_exp_opn_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM   zsbm_cds_association_02
    FIELDS carrid  ,
           connid  ,
           fldate ,
           paymentsum,
           currency_conversion( amount = paymentsum,
                            source_currency = currency,
                            target_currency =  'INR'  ,
                            exchange_rate_date = @sy-datum ) AS converted_curr ,

           \_booking[ (*) WHERE loccuram > 1000 ]-bookid AS booking_id ,
           \_booking[ (*) WHERE loccuram > 1000  ]-loccuram AS amount
    WHERE carrid EQ 'AA' AND fldate EQ '20230720'
    INTO TABLE @DATA(lt_output).

    out->write( lt_output ).




  ENDMETHOD.
ENDCLASS.
