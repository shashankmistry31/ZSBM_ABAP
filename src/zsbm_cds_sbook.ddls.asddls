@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SBOOK referenced CDS view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_SBOOK
  as select from sbook
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
  key bookid     as Bookid,
      customid   as Customid,
      custtype   as Custtype,
      smoker     as Smoker,
      @Semantics.quantity.unitOfMeasure: 'Wunit'
      luggweight as Luggweight,
      wunit      as Wunit,
      invoice    as Invoice,
      class      as Class,
      @Semantics.amount.currencyCode: 'Forcurkey'
      forcuram   as Forcuram,
      forcurkey  as Forcurkey,
      @Semantics.amount.currencyCode: 'Loccurkey'
      loccuram   as Loccuram,
      loccurkey  as Loccurkey,
      order_date as OrderDate,
      counter    as Counter,
      agencynum  as Agencynum,
      cancelled  as Cancelled,
      reserved   as Reserved,
      passname   as Passname,
      passform   as Passform,
      passbirth  as Passbirth
}
