REPORT ZOOPS_D8_P5.

******** DAY 8 PROGRAM 1 ***************
"""" TOPICS - 1)HIERARCHY OF CONSTRUCTOR EXECUTION SENARIO 5 .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*F)Hierarchy of constructor execution-scenario 5
*   If a super class contains instance constructor with mandatory parameters and sub class without any instance constructor and whenever we instantiate the sub class, make sure that you pass values for the parameters of super class instance constructors
*   while instantiating sub class object.


"""" NOTE - IN THIS CASE SUBCLASS INTANCE CONSTRUCTOR DOESN'T HAVE ANY MANDATORY PARAMS.






*******************************************************************************************************
"""" SUPER CLASS.

"""" REMOVING ALL THE STATIC CONSTRUCTORS FROM THE PREVIOUS PROGRAM.

CLASS LCL_SUPER DEFINITION.
  PUBLIC SECTION.

    METHODS CONSTRUCTOR IMPORTING X TYPE I
                                  Y TYPE I.


ENDCLASS.

CLASS LCL_SUPER IMPLEMENTATION.
  METHOD CONSTRUCTOR.

    FORMAT COLOR 1.
    WRITE :/ 'INSIDE INSTANCE CONSTRUCTOR OF SUPER CLASS'.
    WRITE :/ 'IMPORTED PARAMETERS', X,Y.
    FORMAT COLOR OFF.

  ENDMETHOD.





ENDCLASS.

"""" SUBCLASS - DOESN'T HAVE ITS OWN CONSTRUCTORS.

CLASS LCL_SUB DEFINITION INHERITING FROM LCL_SUPER.
    PUBLIC SECTION.
*      METHODS CONSTRUCTOR REDEFINITION.              """" ERROR - CONSTRUCTORS MAY NOT BE REDEFINED.

ENDCLASS.

CLASS LCL_SUB IMPLEMENTATION.


ENDCLASS.




*******************************************************************************************************


START-OF-SELECTION.

PARAMETERS : P_X TYPE I,
             P_Y TYPE I.


WRITE :/ 'FIRST OBJECT OB1 OF SUBCLASS LCL_SUB'.

DATA OB1 TYPE REF TO LCL_SUB.

 CREATE OBJECT OB1
  EXPORTING X = P_X
            Y = P_Y.

ULINE.
*
*"""" O/P - STATIC CONSTRUCTOR GOT EXECUTED FROM SUPER TO SUB AND INSTANCE CONSTRUCTOR GOT EXECUTED FROM SUB CLASS FIRST THEN SUPER CLASS.
*
*WRITE :/ 'SECOND OBJECT OB2 OF SUBCLASS LCL_SUB '.
*
*DATA OB2 TYPE REF TO LCL_SUB.
*
*CREATE OBJECT OB2.
*
*ULINE.























.
