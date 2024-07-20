@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SFLIGHT CDS VIew'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_SFLIGHT
  as select from sflight
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
      @Semantics.amount.currencyCode : 'Currency'
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      @Semantics.amount.currencyCode : 'Currency'
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF
}
where
  fldate <> '00000000'
