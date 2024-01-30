REPORT ZOOPS_D8_P3.

******** DAY 8 PROGRAM 1 ***************
"""" TOPICS - 1)HIERARCHY OF CONSTRUCTOR EXECUTION SENARIO 3 VERY IMPORTANT.


"""" THEORY :

*C)Hierarchy of constructor execution-scenario 3
*-  If a super class contains static and instance Constructor and subclass also with static and instance constructor, then it is mandatory for sub class instance constructor to call the super class instance constructor explicitly by using super keyword.
*-  In this case, if we instantiate first object of sub class before accessing any static components of super/sub class and before creating any objects for super class, then SAP first executes static constructors from super class to sub class (top to
*   bottom) and then instance constructors from sub class to super class (bottom to top) and from second object of sub class onwards, only instance constructors will be executed from sub class to super class.



"""" ERROR - THE CONSTRUCTOR METHOD MUST CALL THE CONSTRUCTOR OF THE SUPER CLASS
"""" FOR NORMAL METHOD CALLING SUPER IS ONLY RECOMMENDATION.
"""" NOTE - INCASE OF INSTANCE CONSTRUCTOR IT IS MANDATORY FOR SUBCLASS INSTANCE CONSTRUCTOR TO CALL THE SUPER CLASS INSTANCE
""""        CONSTRUCTOR.

"""" CONSTRUCTORS ARE IMPLICITY CALLED AFTER CREATING OBJECT.

"""" IF THE SUPER CLASS AND SUBCLASS CONTAINS RESPECTIVE INSTANCE CONSTRUCTORS THEN ITS MANDATORY FOR SUBCLASS
"""" INSTANCE CONSTRUCTOR TO CALL THE SUPER CLASS INSTANCE CONSTRUCTOR AND THAT IS DONE BY USING SUPER KEYWORD.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" SUMMARY - 1) IF THE SUPER CLASS CONTAINS STATIC AND INSTANCE CONSTRUCTOR AND SUBCLASS ALSO CONTAINS STATIC AND INSTANCE CONSTRUCTOR THEN ITS MANDATORY
""""              FOR THE SUBCLASS TO CALL THE SUPERCLASS INSTANCE CONSTRUCTOR BY USING THE SUPER KEYWORD(CALL METHOD SUPER->CONSTRUCTOR) IN THE IMPLEMENTATION
""""              OF THE SUBCLASS.
""""           2) STATIC CONSTRUCTOR IS EXECUTED FROM TOP TO BOTTOM (SUPER TO SUBCLASS) AND INSTANCE CONSTRUCTOR IS EXECUTED FROM BOTTOM TO TOP (SUBCLASS TO SUPER).




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
  PUBLIC SECTION.
    """" DECLARING STATIC METHOD ONCE AGAIN IN THE SUBCLASS    (METHOD OVERLOADING)

*     METHOD M1.             """" ERROR : INVALID SINCE A CLASS CANNOT CONTAIN METHODS WITH SAME NAME.
    CLASS-METHODS CLASS_CONSTRUCTOR.                      """" ERROR - CLASS LCL_SUB DEFINITION DOESN'T HAVE IMPLEMENTATION STATEMENT.
    """" NOTE - THEREFORE CONSTRUCTORS ARE NOT INHERITED.

    METHODS CONSTRUCTOR.


ENDCLASS.

CLASS LCL_SUB IMPLEMENTATION.


  METHOD CLASS_CONSTRUCTOR.

  WRITE :/ 'INSIDE STATIC CONSTRUCTOR OF SUB CLASS'.

  ENDMETHOD.

    METHOD CONSTRUCTOR.


    FORMAT COLOR 2.
    WRITE :/ 'INSIDE INSTANCE CONSTRUCTOR OF SUB CLASS'.
    FORMAT COLOR OFF.

    CALL METHOD SUPER->CONSTRUCTOR.             """" CALLING SUPERCLASS INSTANCE CONTRUCTOR EXPLICITELY.



  ENDMETHOD.


ENDCLASS.




*******************************************************************************************************


START-OF-SELECTION.

WRITE :/ 'FIRST OBJECT OB1 OF SUBCLASS LCL_SUB'.

DATA OB1 TYPE REF TO LCL_SUB.

CREATE OBJECT OB1.

ULINE.

"""" O/P - STATIC CONSTRUCTOR GOT EXECUTED FROM SUPER TO SUB AND INSTANCE CONSTRUCTOR GOT EXECUTED FROM SUB CLASS FIRST THEN SUPER CLASS.

WRITE :/ 'SECOND OBJECT OB2 OF SUBCLASS LCL_SUB '.

DATA OB2 TYPE REF TO LCL_SUB.

CREATE OBJECT OB2.

ULINE.

"""" O/P - ONLY INSTANCE CONSTRUCTOR OF SUBCLASS IS CALLED FIRST AND THEN INSTANCE CONSTRUCTOR OF SUPER CLASS.
"""" NOTE - STATIC CONSTRUCTORS ARE NOT CALLED AGAIN.
"""" NOTE - SUPER SHOULD BE USED INSIDE SUBCLASS ONLY.



"""" CONCLUSION - 1) IF THE SUPER CLASS CONTAINS STATIC AND INSTANCE CONSTRUCTOR AND SUBCLASS ALSO CONTAINS STATIC AND INSTANCE CONSTRUCTOR THEN ITS MANDATORY
""""                 FOR THE SUBCLASS TO CALL THE SUPERCLASS INSTANCE CONSTRUCTOR BY USING THE SUPER KEYWORD(CALL METHOD SUPER->CONSTRUCTOR) IN THE IMPLEMENTATION
""""                 OF THE SUBCLASS.
""""              2) STATIC CONSTRUCTOR IS EXECUTED FROM TOP TO BOTTOM (SUPER TO SUBCLASS) AND INSTANCE CONSTRUCTOR IS EXECUTED FROM BOTTOM TO TOP (SUBCLASS TO SUPER).








.