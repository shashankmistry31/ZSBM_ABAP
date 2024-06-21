*&---------------------------------------------------------------------*
*& Include          ZSBM_ALV_OOPS_01_SE
*&---------------------------------------------------------------------*


SELECTION-SCREEN BEGIN OF BLOCK text-001 .

  DATA : lv_kunnr TYPE kna1-kunnr .
  SELECT-OPTIONS : so_kunnr FOR lv_kunnr .

SELECTION-SCREEN END OF BLOCK text-001 .
