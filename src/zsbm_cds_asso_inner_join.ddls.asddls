@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association with Inner join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_ASSO_INNER_JOIN
  as select from ZSBM_CDS_ASSOCIATION_02._booking as book_detail
  association [*] to scarr   as _airline  on book_detail.carrid = _airline.carrid
  association [1] to scustom as _customer on book_detail.customid = _customer.id
{
  key carrid,
  key connid,
  key fldate,


      bookid,

      _airline[ carrid  = 'AA' ].carrname,
      _customer[ inner ].name

}
