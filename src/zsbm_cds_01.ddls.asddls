@AbapCatalog.sqlViewName: 'ZSBM_CDS01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'First Test CDS'
define view ZSBM_CDS_01
  as select from vbak
{
  key vbeln
}
