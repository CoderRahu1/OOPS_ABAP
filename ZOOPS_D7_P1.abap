REPORT ZOOPS_D7_P1.

"""" TOPICS - 1) INHERITANCE, 2) IMPLEMENTING INHERITANCE THROUGH CUSTOM CLASSES.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" INHERITANCE - > It is a process of using the properties (components) of one class inside
****               other class. SIMILAR TO INCLUDE PROGRAM
****               > The main aim of Inheritance is Reusability of the components i.e. a
****               > component declared in one class can be accessed by other class.
****               > In Inheritance, two classes are involved (super class/base class and sub
****               > class/derived class).
****               > The class which gives properties is called as super class / base class.
****               > The class which takes the properties is called as sub-class/derived class.
****               > NOTE - Only Public and Protected components can be inherited i.e. Private
****               > Components cannot be inherited

"""" EXAMPLE [SINGLE INHERITANCE { TEACHER TO CHILD}]- SE24 -> CL_GUI_CUSTOM_CONTAINER(SUB-CLASS) -> CL_GUI_CONTAINER(SUPER CLASS).
"""" EXAMPLE [MULTI LEVEL INHERITANCE ] => DOUBLE CLICK CL_GUI_CONTAINER -> ITS SUBCLASS OF ANOTHER CLASS( CL_GUI_CONTROL).
"""" EXAMPLE [PARENT CLASS ]  - CL_GUI_OBJECT.



"""" NOTE - ANY CLASS DECLARED AS FINAL CAN'T BE INHERITED.




*********************************************************************************


*CLASS LCL_VEHICLE DEFINITION FINAL.  """" MEANS CANNOT BE INHERITED.
CLASS LCL_VEHICLE DEFINITION.

  PUBLIC SECTION.
    METHODS DISPLAY.
  PROTECTED SECTION.
    DATA : WHEELS TYPE I,
           BREAKS TYPE I.

ENDCLASS.

CLASS LCL_VEHICLE IMPLEMENTATION.

  METHOD DISPLAY.
    WRITE :/ WHEELS, BREAKS.
  ENDMETHOD.

ENDCLASS.


"""" CREATING ONE MORE CLASS.

CLASS LCL_CYCLE DEFINITION INHERITING FROM LCL_VEHICLE.               """" INHERITING FROM LCL_VEHICLE > VEHICLE IS SUPER CLASS AND CYCLE IS SUBCLASS.

*  PROTECTED SECTION.                      """" INSTEAD OF REDECLARING THEM WE NEED TO REUSE.
*    DATA : WHEELS TYPE I,
*           BREAKS TYPE I.
    PUBLIC SECTION.                        """" NOTE - SUBCLASS CAN CONTAIN ITS OWN COMPONENTS AND INHERITED COMPONENT.
      METHODS SETCYCLE.

    PROTECTED SECTION.
      DATA COLOR TYPE STRING.

ENDCLASS.

CLASS LCL_CYCLE IMPLEMENTATION.

  METHOD SETCYCLE.
    WHEELS = 2.
    BREAKS =  2.
    COLOR = 'GREEN'.
    WRITE :/ 'THE CYCLE COLOR IS :', COLOR.
  ENDMETHOD.


ENDCLASS.

"""" TAKING ANOTHER CLASS.

CLASS LCL_BIKE DEFINITION INHERITING FROM LCL_CYCLE.                                                """" MULTI LEVEL INHERITANCE.
  PUBLIC SECTION.
    METHODS : SETBIKE.
  PROTECTED SECTION.
    DATA GEARS TYPE I.

ENDCLASS.

CLASS LCL_BIKE IMPLEMENTATION.

  METHOD SETBIKE.
    WHEELS = 2.
    BREAKS = 1.
    COLOR = 'RED'.
    GEARS = 5.
    WRITE :/ 'COLOR OF BIKE :',COLOR.
    WRITE :/ 'NO OF GEARS FOR BIKE :',GEARS.

  ENDMETHOD.




ENDCLASS.
************************************************************************************

START-OF-SELECTION.

WRITE :/ 'OBJECT OB1 OF SUBCLASS LCL_CYCLE...'.

DATA OB1 TYPE REF TO LCL_CYCLE.
CREATE OBJECT OB1.

CALL METHOD : OB1->SETCYCLE,
              OB1->DISPLAY.

ULINE.

WRITE :/ 'OBJECT OB2 OF SUBCLASS LCL_BIKE...'.

DATA OB2 TYPE REF TO LCL_BIKE.
CREATE OBJECT OB2.

CALL METHOD : OB2->SETBIKE,
              OB2->DISPLAY.

ULINE.
