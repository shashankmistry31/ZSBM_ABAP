@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join Cardinality'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSBM_CDS_JOIN_CARDINALITY

//    join will be created  in query optimiser 1 : N scebnario and 
//    even though no second table entry got selected
//    as select from    vbak as _header
//      left outer join vbap as _item on _header.vbeln = _item.vbeln
//  
//  {
//    key _header.vbeln,
//        _header.kunnr
//  }

  //No Join will be created in Query optimiser since we are not
  //accessing the second table and N:1 scenario
//    as select from    vbap as _item
//      left outer join vbak as _header on _header.vbeln = _item.vbeln
//  
//  {
//    key _item.vbeln,
//        _item.posnr
//  }


  // here the join will be formed since there is MANY keyword
//  as select from    vbak as _header
//      left outer to many join vbap as _item on _header.vbeln = _item.vbeln
//  
//  {
//    key _header.vbeln,
//        _header.kunnr
//  }


  // here the join will not be formed since there is ONE keyword
//  as select from    vbak as _header
//      left outer to one join vbap as _item on _header.vbeln = _item.vbeln
//  
//  {
//    key _header.vbeln,
//        _header.kunnr
//  }


  // here the join will be formed even though there is ONE keyword
  //since we are using the second table field
//  as select from    vbak as _header
//      left outer to one join vbap as _item on _header.vbeln = _item.vbeln
//  
//  {
//    key _header.vbeln,
//        _header.kunnr,
//        _item.posnr
//  
//  }


  // here the join will not be formed since there is ONE keyword
  //and we are not using the second table
//  as select from           vbak as _header
//    left outer to one join vbap as _item on _header.vbeln = _item.vbeln
//
//{
//  count( * ) as number_of_entries
//
//}


  // here the join will not be formed since there is many keyword
  as select from           vbak as _header
    left outer to many join vbap as _item on _header.vbeln = _item.vbeln

{
  count( * ) as number_of_entries

}
