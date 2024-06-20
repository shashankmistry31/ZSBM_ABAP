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
  association [1..*] to sbook as _booking on  _flight.carrid = _booking.carrid
                                          and _flight.connid = _booking.connid
                                          and _flight.fldate = _booking.fldate

{
  key carrid,
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'currency'
      paymentsum,
      currency,

      _booking
}
