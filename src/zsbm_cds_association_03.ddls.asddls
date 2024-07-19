@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association Cardinaltiy and Projection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_ASSOCIATION_03
  as select from vbak as _header
  association [1..*] to vbap as _item    on _header.vbeln = _item.vbeln
  association [1..1] to kna1 as _cust    on _header.kunnr = _cust.kunnr
  association [1..*] to makt as _descr   on $projection.matnr = _descr.matnr
  association [0..*] to vbfa as _docflow on _header.vbeln = _docflow.vbelv

{
  key _header.vbeln,
      _header.ernam as createdBy,
      _item.posnr,
      _item.matnr,
      _cust.name1,
      _cust.kunnr,
      _descr,
      _docflow
}
