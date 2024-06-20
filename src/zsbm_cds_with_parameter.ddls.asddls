@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds view with parameter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_WITH_PARAMETER
  with parameters
    p_vbeln : vbeln,
    @Environment.systemField: #SYSTEM_DATE
    p_datum : abap.dats
  as select from vbak

{
  key vbeln               as SO,
      erdat               as Erdat,
      erzet               as Erzet,
      ernam               as Ernam,
      angdt               as Angdt,
      bnddt               as Bnddt,
      audat               as Audat,
      vbtyp               as Vbtyp,
      trvog               as Trvog,
      auart               as Auart,
      $parameters.p_datum as System_date
}
where
  vbeln = $parameters.p_vbeln
