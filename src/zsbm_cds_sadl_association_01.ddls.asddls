@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sadl framework CDS Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_SADL_ASSOCIATION_01
  as select from scarr
  association [1..*] to ZSBM_CDS_SFLIGHT as _flight  on  scarr.carrid = _flight.Carrid
  association [1..*] to ZSBM_CDS_SBOOK   as _booking on  $projection.connid     = _booking.Connid
                                                     and scarr.carrid           = _booking.Carrid
                                                     and $projection.FlyingDate = _booking.Fldate
{
  key  scarr.carrid,
  key  _flight.Connid,
  key  case
      when _flight.Fldate is null  then '99991231'
      else _flight.Fldate  end as FlyingDate,


       //            _flight.Fldate  as FlyingDate,

       scarr.carrname,

       @Semantics.amount.currencyCode : 'currency'
       _flight.Price,
       _flight.Currency,

       _booking


}
