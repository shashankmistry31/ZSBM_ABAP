@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_ASSOCIATION_01
  as select from scarr
  association [1..*] to sflight as _flight on scarr.carrid = _flight.carrid
{
  key scarr.carrid,
      scarr.carrname,
      _flight.connid,
      @Semantics.amount.currencyCode : 'currency'
      _flight.price,
      _flight.currency


}
