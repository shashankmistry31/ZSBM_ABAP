*&---------------------------------------------------------------------*
*& Include          ZSBM_ALV_OOPS_01_GLOBAL
*&---------------------------------------------------------------------*


TYPES : BEGIN OF gty_kna1 ,
          kunnr TYPE  kunnr,
          land1 TYPE  land1_gp,
          name1	TYPE name1_gp,
          name2	TYPE name2_gp,
          ort01 TYPE  ort01_gp,
          pstlz	TYPE pstlz,
          regio	TYPE regio,
        END OF gty_kna1 .

DATA : gt_kna1 TYPE TABLE OF gty_kna1.


DATA : go_cont_9000 TYPE REF TO  cl_gui_custom_container .
DATA : go_alv_9000 TYPE REF TO  cl_gui_alv_grid.
DATA : gt_kna1_fieldcatalog  TYPE lvc_t_fcat.


TYPES : BEGIN OF gty_vbak .
          INCLUDE STRUCTURE vbak .
TYPES  :  cell_style TYPE lvc_t_styl,
        END OF gty_vbak .

DATA : gt_vbak    TYPE TABLE OF gty_vbak.
DATA : gv_kunnr    TYPE kunnr.
DATA : go_cont_9001 TYPE REF TO  cl_gui_custom_container .
DATA : go_alv_9001 TYPE REF TO  cl_gui_alv_grid.
DATA : gt_vbak_fieldcatalog  TYPE lvc_t_fcat.
DATA : gs_layout TYPE lvc_s_layo.

CLASS gcl_eventreceiver DEFINITION .

  PUBLIC SECTION .
    METHODS handle_double_click FOR EVENT  double_click
        OF cl_gui_alv_grid IMPORTING e_row e_column.


ENDCLASS .
