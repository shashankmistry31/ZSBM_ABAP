FUNCTION-POOL ZSBM_BADI_SORT.   "MESSAGE-ID ..

CONSTANTS: true TYPE enhboolean VALUE 'X',
           no   TYPE enhboolean VALUE ' '.

DATA: g_layer TYPE i,
      g_changeable TYPE enhboolean.


DATA: g_impl_layer     TYPE enhbadi_implementation_layer,
      g_impl_layer_pbo TYPE enhbadi_implementation_layer,
      g_impl_chang     TYPE enhboolean.

TABLES: ENHBADI_SORTER_IMPL.
