REPORT ZOOPS_D8_P2.

******** DAY 8 PROGRAM 1 ***************
"""" TOPICS - 1)HIERARCHY OF CONSTRUCTOR EXECUTION SENARIO 2


*B)Hierarchy of constructor execution-scenario 2
*-  If a super class contains static and instance constructor and subclass only with static constructor,
*   and if we instantiate first object of sub class before accessing any static components of super/sub class and also before creating any objects for
*   super class, then SAP first executes static constructors from super class to sub class and
*   then instance constructor of super class and from second object onwards, only instance constructor of super class will be executed.






*******************************************************************************************************
"""" SUPER CLASS.

CLASS LCL_SUPER DEFINITION.
  PUBLIC SECTION.
    METHODS CONSTRUCTOR.
    CLASS-METHODS CLASS_CONSTRUCTOR.
    METHODS M1.


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

  METHOD M1.

    WRITE :/ 'INSIDE INSTANCE METHOD M1 OF SUPER CLASS'.

  ENDMETHOD.

ENDCLASS.

"""" SUBCLASS - DOESN'T HAVE ITS OWN CONSTRUCTORS.

CLASS LCL_SUB DEFINITION INHERITING FROM LCL_SUPER.
  PUBLIC SECTION.
    """" DECLARING STATIC METHOD ONCE AGAIN IN THE SUBCLASS    (METHOD OVERLOADING)

*     METHOD M1.             """" ERROR : INVALID SINCE A CLASS CANNOT CONTAIN METHODS WITH SAME NAME.
    CLASS-METHODS CLASS_CONSTRUCTOR.                      """" ERROR - CLASS LCL_SUB DEFINITION DOESN'T HAVE IMPLEMENTATION STATEMENT.
    """" NOTE - THEREFORE CONSTRUCTORS ARE NOT INHERITED.



ENDCLASS.

CLASS LCL_SUB IMPLEMENTATION.


  METHOD CLASS_CONSTRUCTOR.

  WRITE :/ 'INSIDE STATIC CONSTRUCTOR OF SUB CLASS'.

  ENDMETHOD.

ENDCLASS.




*******************************************************************************************************


START-OF-SELECTION.

*WRITE :/ 'FIRST OBJECT OB1 OF SUBCLASS LCL_SUB'.
*
*DATA OB1 TYPE REF TO LCL_SUB.
*
*CREATE OBJECT OB1.
*
*
*"""" O/P - STATIC CONSTRUCTORS GOT EXECUTED FROM SUPER TO SUB AND THEN INSTANCE OF SUPER CLASS.
*WRITE :/ 'SECOND OBJECT OB2 OF SUBCLASS LCL_SUB'.
*
*DATA OB2 TYPE REF TO LCL_SUB.
*
*CREATE OBJECT OB2.
*
*"""" O/P - ONLY INSTANCE CONSTRUCTOR OF SUPER CLASS GETS EXECUTED.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" CREATING FIRST OBJECT OF SUPER CLASS.


WRITE :/ 'FIRST OBJECT OF SUPER CLASS K1'.

DATA K1 TYPE REF TO LCL_SUPER.

CREATE OBJECT K1.

""" METHOD OVERLOADING MEANS SAME METHOD WHEN YOU DECLARE AGAIN WITH DIFFERENT SIGNATURE THEN ITS CALLED OVERLOADING.




















.
