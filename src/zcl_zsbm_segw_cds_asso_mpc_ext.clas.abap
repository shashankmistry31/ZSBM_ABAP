class ZCL_ZSBM_SEGW_CDS_ASSO_MPC_EXT definition
  public
  inheriting from ZCL_ZSBM_SEGW_CDS_ASSO_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZSBM_SEGW_CDS_ASSO_MPC_EXT IMPLEMENTATION.


  METHOD define.

    DATA: lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_entity_typ,
          lo_property    TYPE REF TO /iwbep/if_mgw_odata_property.

    super->define( ) .
    lo_entity_type = model->get_entity_type( iv_entity_name =    'ZSBM_CDS_SADL_ASSOCIATION_01Type' ).
    lo_property =  lo_entity_type->get_property( iv_property_name = 'FlyingDate' ) .
    lo_property->set_nullable(  iv_nullable = abap_true ).


  ENDMETHOD.
ENDCLASS.
