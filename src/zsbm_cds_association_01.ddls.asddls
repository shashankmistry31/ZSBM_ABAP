@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true

define view entity ZSBM_CDS_ASSOCIATION_01
  as select from scarr
  association [1..*] to sflight as _flight  on  scarr.carrid = _flight.carrid
  association [1..*] to sbook   as _booking on  $projection.connid     = _booking.connid
                                            and scarr.carrid           = _booking.carrid
                                            and $projection.FlyingDate = _booking.fldate
{
  key  scarr.carrid,
  key  _flight.connid,
  key  cast( _flight.fldate as  abap.dats ) as FlyingDate,

       scarr.carrname,

       @Semantics.amount.currencyCode : 'currency'
       _flight.price,
       _flight.currency,

       _booking


}    
