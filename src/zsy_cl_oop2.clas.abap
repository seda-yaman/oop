class ZSY_CL_OOP2 definition
  public
  inheriting from ZSY_CL_OOP1
  create public .

public section.

  methods CALL
    importing
      !IV_DEC1 type DEC07
      !IV_DEC2 type DEC07
    changing
      !CV_SONUC type DEC07 .
protected section.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSY_CL_OOP2 IMPLEMENTATION.


  METHOD call.

    bolme(
  EXPORTING
    iv_dec1  = iv_dec1
    iv_dec2  = iv_dec2
  CHANGING
    cv_sonuc = cv_sonuc
  EXCEPTIONS
    zero     = 1                " 0 a bölünme
    OTHERS   = 2
).
    IF sy-subrc <> 0.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
