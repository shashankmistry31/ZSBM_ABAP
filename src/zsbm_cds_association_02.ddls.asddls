@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cardinality impact on total'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_ASSOCIATION_02
  as select from sflight as _flight
  association [1..1] to sbook as _booking on  _flight.carrid = _booking.carrid
                                          and _flight.connid = _booking.connid
                                          and _flight.fldate = _booking.fldate
  with default filter _booking.loccuram > 1200
{
  key carrid,
  key connid,
      @EndUserText: {
          label: 'Flying Date for flight',
          quickInfo: 'Flying Date for flight'
      }
  key fldate,
      @Semantics.amount.currencyCode: 'currency'
      paymentsum,
      currency,

      @Semantics.amount.currencyCode: 'converted_currency_unit'
      currency_conversion( amount => paymentsum,
                            source_currency => currency,
                            target_currency =>  cast ( 'INR'  as abap.cuky( 5 ) ) ,
                            exchange_rate_date => $session.system_date ) as converted_currency,
      cast ( 'INR'  as abap.cuky )                                       as converted_currency_unit,
      _booking.wunit,
      @Semantics.quantity.unitOfMeasure : 'wunit'
      _booking.luggweight,

      @Semantics.quantity.unitOfMeasure : 'gram'
      unit_conversion( quantity => _booking.luggweight,
                       source_unit => _booking.wunit,
                       target_unit => cast( 'G' as abap.unit( 3 ) ) ,
                       client      => $session.client ,
                       error_handling => 'SET_TO_NULL'
                       )                                                 as converted_unit,
      cast( 'G' as abap.unit( 3 ) )                                      as gram,
      _booking
}
where
  _booking.wunit = 'KG'
