REPORT ZOOPS_D8_P4.

******** DAY 8 PROGRAM 1 ***************

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" TOPICS - 1)HIERARCHY OF CONSTRUCTOR EXECUTION SENARIO 3 VERY IMPORTANT.

* D)Hierarchy of constructor execution-scenario 4
*   If a super class contains instance constructor with mandatory parameters and sub class also contains instance constructor with mandatory parameters and whenever we instantiate the sub class, make sure that you pass values for the parameters of sub
*   class instance constructors and from sub class instance constructor implementation we need to call super class instance constructor by passing values for parameters of super class instance constructor.


"""" NOTE - BEFORE WE CREATE THE OBJECT OF ANY CLASS WE SHOULD CHECK IF THAT CLASS CONTAINS ANY INSTANCE CONSTRUCTOR AND 
""""        WE SHOULD CHECK IF THAT INSTANCE CONSTRUCTOR CONTAINS ANY MANDATORY PARAMETERS IF IT CONTAINS
""""        THEN WE NEED TO PASS THE VALUES AT THE TIME OF CREATING THE OBJECT.
""""        ALSO SHOULD CHECK IF THE CLASS CONTAINS ANY SUPER CLASS AND IF THAT SUPER CLASS CONTAINS ANY INSTANCE CONSTRUCTOR AND IF IT CONTAINS ANY MADATORY PARAMS.

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
    """" DECLARING STATIC METHOD ONCE AGAIN IN THE SUBCLASS    (METHOD OVERLOADING)

*     METHOD M1.             """" ERROR : INVALID SINCE A CLASS CANNOT CONTAIN METHODS WITH SAME NAME.

    """" NOTE - THEREFORE CONSTRUCTORS ARE NOT INHERITED.

    METHODS CONSTRUCTOR IMPORTING R TYPE I.



ENDCLASS.

CLASS LCL_SUB IMPLEMENTATION.



    METHOD CONSTRUCTOR.


    FORMAT COLOR 2.
    WRITE :/ 'INSIDE INSTANCE CONSTRUCTOR OF SUB CLASS'.
    WRITE :/ 'IMPORTED PARAMETER IN INSTANCE CONSTRUCTOR OF SUB CLASS LCL_SUB', R.
    FORMAT COLOR OFF.

    CALL METHOD SUPER->CONSTRUCTOR
                        EXPORTING X = 10
                                  Y = 20.
  ENDMETHOD.


ENDCLASS.




*******************************************************************************************************


START-OF-SELECTION.

WRITE :/ 'FIRST OBJECT OB1 OF SUBCLASS LCL_SUB'.

DATA OB1 TYPE REF TO LCL_SUB.

CREATE OBJECT OB1
  EXPORTING
    R = 15.

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
