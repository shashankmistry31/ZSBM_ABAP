@EndUserText.label: 'Table function demo 2'
define table function ZSBM_TABLE_FUNCT_02

  with parameters
    @Environment.systemField: #CLIENT
    client : abap.clnt
returns
{
  client          : abap.clnt;
  empno           : abap.char( 10 );
  EMPSALARY       : wertv13;
  currency        : abap.cuky( 5 );
  EMPNAME         : abap.char( 10 );
  EMP_DESIGANTION : abap.char( 20 );
}
implemented by method
  zsbm_table_function_02=>fetch_data;
