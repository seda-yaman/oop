*&---------------------------------------------------------------------*
*& Report ZSY_016_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsy_016_p_oop.

SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_dec1 TYPE dec07,
              p_dec2 TYPE dec07,
              p_dec3 TYPE dec07,
              p_dec4 TYPE dec07.
SELECTION-SCREEN END OF BLOCK bl1.

START-OF-SELECTION.

  DATA: go_cl1      TYPE REF TO zsy_cl_oop1,
        go_cl1_2    TYPE REF TO zsy_cl_oop1,
        go_class2   TYPE REF TO zsy_cl_oop2,
        gv_changing TYPE dec07.

  CREATE OBJECT: go_cl1, go_cl1_2, go_class2.

  go_cl1->zsy_if_toplama~toplama(
   EXPORTING
     iv_dec1  = p_dec1
     iv_dec2  = p_dec2
   IMPORTING
     ev_sonuc = DATA(gv_cl1_toplam) ).

  go_cl1->zsy_if_cikarma~cikarma(
   EXPORTING
     iv_dec1  = p_dec1
     iv_dec2  = p_dec2
   RECEIVING
     rv_sonuc = DATA(gv_cl1_cikarma) ).

  go_cl1_2->zsy_if_toplama~toplama(
   EXPORTING
     iv_dec1  = p_dec3
     iv_dec2  = p_dec4
   IMPORTING
     ev_sonuc = DATA(gv_cl1_2_toplam) ).

  go_cl1_2->zsy_if_cikarma~cikarma(
   EXPORTING
     iv_dec1  = p_dec3
     iv_dec2  = p_dec4
   RECEIVING
     rv_sonuc = DATA(gv_cl1_2_cikarma) ).

  go_class2->call(
   EXPORTING
     iv_dec1  = p_dec1
     iv_dec2  = p_dec2
   CHANGING
     cv_sonuc = gv_changing ).

  WRITE: '1_1 Toplam Sonuç: ' && gv_cl1_toplam,/.
  WRITE: '1_1 Çıkarma Sonuç: ' && gv_cl1_cikarma,/.
  WRITE: '1_1 Instance: ' && go_cl1->zsy_if_cikarma~instance,' ',go_cl1->zsy_if_toplama~instance,/.
  WRITE: '1_2 Toplam Sonuç: ' && gv_cl1_2_toplam,/.
  WRITE: '1_2 Çıkarma Sonucu: ' && gv_cl1_2_cikarma,/.
  WRITE: '1_2 Instance: ' && go_cl1_2->zsy_if_cikarma~instance,' ',go_cl1_2->zsy_if_toplama~instance,/.
  WRITE: 'Class-2 İşlem Sonuç: ' && gv_changing,/.
