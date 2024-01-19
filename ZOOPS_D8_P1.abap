REPORT ZOOPS_D8_P1.

******** DAY 8 PROGRAM 1 ***************
"""" TOPICS - 1)HIERARCHY OF CONSTRUCTOR EXECUTION


*A) Hierarchy of constructor execution-scenario 1
*-  If a super class contains static and instance constructor and subclass without any constructors,
*   and if we instantiate first object of super class/sub class before accessing any static components of super/sub class ,then SAP first executes static
*   constructor of super class and then instance constructor of super class and from second object of super class/sub class only
*   instance constructor of super class will be executed.





*******************************************************************************************************
"""" SUPER CLASS.

CLASS LCL_SUPER DEFINITION.
  PUBLIC SECTION.
    METHODS CONSTRUCTOR.
    CLASS-METHODS CLASS_CONSTRUCTOR.

ENDCLASS.

CLASS LCL_SUPER IMPLEMENTATION.
  METHOD CONSTRUCTOR.


    FORMAT COLOR 1.
    WRITE :/ 'INSIDE INSTANCE CONSTRUCTOR OF SUPER CLASS'.
    FORMAT COLOR OFF.
  ENDMETHOD.

  METHOD CLASS_CONSTRUCTOR.

  WRITE :/ 'INSIDE STATIC CONSTRUCTOR OF SUPER CLASS'.

  ENDMETHOD.

ENDCLASS.

"""" SUBCLASS - DOESN'T HAVE ITS OWN CONSTRUCTORS.

CLASS LCL_SUB DEFINITION INHERITING FROM LCL_SUPER.



ENDCLASS.




*******************************************************************************************************


START-OF-SELECTION.

*WRITE :/ 'FIRST OBJECT OF SUBCLASS  OB1'.
*
*DATA OB1 TYPE REF TO LCL_SUB.
*
*CREATE OBJECT OB1.
*
*""""  NOTE - WHENEVER WE ARE CREATING OBJECT FOR A CLASS WE SHOULD NOT ONLY FOCUS ON THAT CLASS WE SHOULD ALSO CHECK IF THAT CLASS CONTAINS ANY SUPER CLASS.
*""""         AS IF THAT CLASS CONTAINS ANY SUPER CLASS THEN THAT CONSTRUCTOR OF SUPER CLASS ALSO GETS EXECUTED.
*
*ULINE.
*
*WRITE :/ 'FIRST OBJECT OF SUBCLASS  OB2 WHERE IT SHOWS STATIC CONSTRUCTOR IS CALLED ONLY ONCE AND THE INSTANCE CONSTRUCTOR IS CALLED AS MANY TIME'.
*
*DATA OB2 TYPE REF TO LCL_SUB.
*
*CREATE OBJECT OB2.          """" STATIC CONSTRUCTOR IS CALLED AS MANY AS TIME AS POSSIBLE WHILE INSTANCE CONSTRUTOR IS CALLED ONLY ONCE.
*
*
*ULINE.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" NOW CREATING FIRST OBJECT OF SUPER CLASS.

WRITE :/ 'FIRST OBJECT OF SUPERCLASS  K1'.

DATA K1 TYPE REF TO LCL_SUPER.

CREATE OBJECT K1.                     """" NOTE - STATIC CONSTRUCTOR GETS EXECUTED FIRST THEN INSTANCE CONSTRUCTOR.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
