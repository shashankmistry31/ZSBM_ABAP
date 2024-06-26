@EndUserText.label: 'Table Function demo'
@ClientHandling.type: #CLIENT_INDEPENDENT



define table function ZSBM_CDS_TABLE_FUNCTION_01
  with parameters

//    @Environment.systemField: #CLIENT
    client : abap.clnt
returns
{
  client_element_name : abap.clnt;
  vbeln               : vbeln;

}
implemented by method
  zcl_sbm_table_function_01=>get_data;
