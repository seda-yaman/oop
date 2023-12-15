class ZSY_CL_OOP1 definition
  public
  create public .

public section.

  interfaces ZSY_IF_TOPLAMA .
  interfaces ZSY_IF_CIKARMA .
protected section.

  methods BOLME
    importing
      !IV_DEC1 type DEC07
      !IV_DEC2 type DEC07
    changing
      !CV_SONUC type DEC07
    exceptions
      ZERO .
private section.
ENDCLASS.



CLASS ZSY_CL_OOP1 IMPLEMENTATION.


  method BOLME.

  endmethod.


  METHOD zsy_if_cikarma~cikarma.

    rv_sonuc = iv_dec1 - iv_dec2.
    zsy_if_cikarma~instance = rv_sonuc.

  ENDMETHOD.


  METHOD zsy_if_toplama~toplama.

    ev_sonuc = iv_dec1 + iv_dec2.
    zsy_if_toplama~instance = ev_sonuc.

  ENDMETHOD.
ENDCLASS.
