REPORT ZOOPS_D3_P2.




**************** OOPS DAY 3 PROGRAM 2 *****************


**** TOPICS - 1) METHOD RETURNING MULTIPLE VALUES. IN C++ OR JAVA METHOD CAN RETURN ONLY ONE VALUE.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" REQ - TAKE TWO METHODS - M1 - SHOULD ACCEPT CUSTOMER NUMBER AS INPUT (IMPORTING).   CUSTOMER NO -> IMPORTING.
""""                          M2 - EXPORTING CUSTOMER MASTER DATA (DATA FROM KNA1(NAME1 AND ORT01[CITY])). (SALES ORDERS OF THAT CUSTOMER DATA FROM VBAK-> [VBELN, ERDAT,ERZET,ERNAME).


CLASS LCL_CUSTOMER DEFINITION.

  PUBLIC SECTION.
    METHODS GETDATA IMPORTING I_KUNNR TYPE KNA1-KUNNR                     """"" SO THIS METHOD IS RETREVING THE DATA AND RETURNING THE DATA  """" KUNNR = CUSTOMER NUMBER
                    EXPORTING E_NAME1 TYPE KNA1-NAME1
                              E_ORT01 TYPE KNA1-ORT01
                              E_SALES TYPE ZTTVBAK.                                                                     """" ZCVBAK IS THE STRUCTURE BUT WE NEED IT.



  PROTECTED SECTION.



ENDCLASS.

CLASS LCL_CUSTOMER IMPLEMENTATION.
  METHOD GETDATA.
   """" USING SELECT SINGLE SINCE WE HAVE TO COMPARE IT USING PRIMARY KEY ONLY.
    SELECT SINGLE NAME1 ORT01
      FROM KNA1
      INTO (E_NAME1, E_ORT01)
      WHERE KUNNR = I_KUNNR.

    IF SY-SUBRC = 0.
      WRITE :/ 'CUSTOMER FOUND.'.
      """" HERE ONLY SELECT BECAUSE WE MAY HAVE MULTIPLE SALES ORDER.
      SELECT VBELN ERDAT ERZET ERNAM FROM VBAK INTO TABLE E_SALES WHERE KUNNR = I_KUNNR.

        IF SY-SUBRC NE 0.
          MESSAGE 'NO SALES ORDERS' TYPE 'I'.

        ELSE.
          MESSAGE 'CUSTOMER NOT FOUND...' TYPE 'I'.

       ENDIF.
    ENDIF.


  ENDMETHOD.

ENDCLASS.



START-OF-SELECTION.


WRITE :/ 'FIRST OBJECT OB1'.

DATA OB1 TYPE REF TO LCL_CUSTOMER.
CREATE OBJECT OB1.

PARAMETERS : P_KUNNR TYPE KNA1-KUNNR.


CALL METHOD OB1->GETDATA
EXPORTING
  I_KUNNR = P_KUNNR.




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" NOTE - EXPORTING PARAMETERS ARE ALWAYS OPTIONAL AND IMPORTING PARAMETERS ARE MANDATORY.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" CREATING ANOTHER OBJECT OB2 WHICH WILL RECEIVE 2 VALUES WHICH IS GETTING EXPORTED AND IMPORTED HERE.
ULINE.
WRITE :/ 'CREATING OBJECT OB2'.

DATA OB2 TYPE REF TO LCL_CUSTOMER.
CREATE OBJECT OB2.

DATA : V_NAME1 TYPE KNA1-NAME1,
       V_ORT01 TYPE KNA1-ORT01.


CALL METHOD OB2->GETDATA
EXPORTING
  I_KUNNR = P_KUNNR
IMPORTING
  E_NAME1 = V_NAME1
  E_ORT01 = V_ORT01.


WRITE :/ 'CUSTOMER NAME :', V_NAME1,
         'CUSTOMER CITY :', V_ORT01.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" CREATING ANOTHER OBJECT OB3 WHICH WILL RECEIVE ALL THE EXPORTING VALUES.

ULINE.
WRITE :/ 'THIRD OBJECT OB3'.

DATA OB3 TYPE REF TO LCL_CUSTOMER.
CREATE OBJECT OB3.


CLEAR : V_NAME1,
        V_ORT01.

DATA :  T_VBAK TYPE ZTTVBAK,          """" ITAB                                       """" DECLARING THIS FOR USING THE INTERNAL TABLE.
        WA_VBAK TYPE ZCVBAK.           """" WORK AREA


CALL METHOD OB3->GETDATA
EXPORTING
  I_KUNNR = P_KUNNR
IMPORTING
  E_NAME1 = V_NAME1
  E_ORT01 = V_ORT01
  E_SALES = T_VBAK.

WRITE :/ 'CUSTOMER NAME :', V_NAME1,
         'CUSTOMER CITY :', V_ORT01.

IF T_VBAK IS NOT INITIAL.
  DESCRIBE TABLE T_VBAK.                                """" DESCRIBE TABLE WILL COUNT THE NUMBER OF RECORDS IN THE INTERNAL TABLE AND STORES THAT COUNT VALUE IN A SYSTEM FIELD CALLED AS SY-TFILL..
    WRITE :/ 'NUMBER OF SALES ORDERS :',SY-TFILL.
    LOOP AT T_VBAK INTO WA_VBAK.
      WRITE :/ WA_VBAK-VBELN,
               WA_VBAK-ERNAM,
               WA_VBAK-ERDAT,
               WA_VBAK-ERZET.

      ENDLOOP.

ENDIF.



""""""""""""""""""""""""""""""""""""""""""""""""""""


"""" Q - SHOULD TAKE 2 METHODS 1 ST METHOD SHOULD ONLY RETRIVE THE DATA AND THE DISPLAY OF THE DATA SHOULD BE TAKEN CARE BY SECOND METHOD.
"""" M1 - RETRIVE
"""" M2 - DISLAY DATA.
