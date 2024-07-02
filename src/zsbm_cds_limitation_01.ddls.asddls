@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Limitation Demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_LIMITATION_01
  as select from zsbm_empl_salary as _sal
  association [1..1] to zsbm_empl as _head on $projection.salaryEmpNo = _head.empno
{
  key _sal.empno,
      cast( _sal.empno as abap.int4 ) as salaryEmpNo,
      @Semantics.amount.currencyCode: 'Currency'
      _sal.empsalary                  as Empsalary,
      _sal.currency                   as Currency,
      _head
}
