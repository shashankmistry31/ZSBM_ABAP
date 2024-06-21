@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume 03'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_ASSOCIATION_04
  as select from ZSBM_CDS_ASSOCIATION_03
{
  key vbeln,
      posnr,
      matnr,
      name1,
      kunnr,
      /* Associations */
      _descr.maktx,
      _docflow[  inner where vbtyp_n = 'M' and
                 posnv  = $projection.posnr ].vbeln as invoice_number,
      _docflow[ inner where vbtyp_n = 'M' and
                 $projection.posnr = posnv ].posnn
}
