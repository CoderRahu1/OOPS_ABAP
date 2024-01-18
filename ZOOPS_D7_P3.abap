REPORT ZOOPS_D7_P3.

***************************************************************************************
"""" TOPICS - 1)POLYMORPHISM

"""" INTERVIEW Q - WILL THE FINAL KEYWORD STOP THE INHERITANCE?.
""""           A- SHOULD ASK IF ITS AT CLASS LEVEL OR METHOD LEVEL IF ITS AT CLASS LEVEL CLASS CANNOT BE INHERITED.
""""              IF ITS AT METHOD LEVEL PUBLIC AND PROTECTED METHOD CAN BE INHERITED BUT CANNOT BE REDEFINED.



****Poly -> many,
****Morph-> forms,
****Ism-> behaviour
****It is a process of making an entity behaving in multiple forms.
****In this case, the entity is a method
****Example:
****Method overloading, Method Overriding.



* 1) Method Overloading:
*      It is similar to function overloading in C++.
*      It is a process of overloading the same method by passing different Number and different types of parameters.
*      Eg: methods m1.
*      Methods m1 importing x type i.
*      Methods m1 importing x type c.
*      Methods m1 importing x type I y type i.
*      ABAP does not support method overloading.


* 2) Method Overriding:
*-  If a subclass redefines a super class method it is called as Method Overriding.
*-  Whenever a local subclass wants to redefine the super class method, the sub class as to re-declare super class method by using “redefinition” keyword.
*-  Whenever the super class method is redefined in subclasses, we cannot change the visibility / category.
*-  Only public and protected instance methods can be redefined.
*-  Whenever a subclass redefines super class method, it is always recommended to call the super class method implementation in the subclass and this is done by using “super” keyword.
*-  “Super” keyword is always used in subclass method implementations (inside redefined super class method) to refer to super class method implementation.
*-  A class declared as final cannot be inherited.
*-  Static methods cannot be redefined
*-  Instance public / Instance protected methods declared as final can be inherited but cannot be redefined.
*-  A static public/static protected methods cannot be declared as final because by default, static methods cannot be redefined.
*A) Hierarchy of constructor execution-scenario 1
*-  If a super class contains static and instance constructor and subclass without any constructors, and if we instantiate first object of super class/sub class before accessing any static components of super/sub class ,then SAP first executes static
*constructor of super class and then instance constructor of super class and from second object of super class/sub class only instance constructor of super class will be executed.
*B)Hierarchy of constructor execution-scenario 2
*-  If a super class contains static and instance constructor and subclass only with static constructor, and if we instantiate first object of sub class before accessing any static components of super/sub class and also before creating any objects for
*   super class, then SAP first executes static constructors from super class to sub class and then instance constructor of super class and from second object onwards, only instance constructor of super class will be executed.
*C)Hierarchy of constructor execution-scenario 3
*-  If a super class contains static and instance Constructor and subclass also with static and instance constructor, then it is mandatory for sub class instance constructor to call the super class instance constructor explicitly by using super keyword.
*-  In this case, if we instantiate first object of sub class before accessing any static components of super/sub class and before creating any objects for super class, then SAP first executes static constructors from super class to sub class (top to
*   bottom) and then instance constructors from sub class to super class (bottom to top) and from second object of sub class onwards, only instance constructors will be executed from sub class to super class.
*D)Hierarchy of constructor execution-scenario 4
*   If a super class contains instance constructor with mandatory parameters and sub class also contains instance constructor with mandatory parameters and whenever we instantiate the sub class, make sure that you pass values for the parameters of sub
*   class instance constructors and from sub class instance constructor implementation we need to call super class instance constructor by passing values for parameters of super class instance constructor.
*F)Hierarchy of constructor execution-scenario 5
*   If a super class contains instance constructor with mandatory parameters and sub class without any instance constructor and whenever we instantiate the sub class, make sure that you pass values for the parameters of super class instance constructors
*   while instantiating sub class object.








***************************************************************************************

"""" EXAMPLE OF METHOD OVERLOADING - NOT SUPPORTED IN ABAP.

*CLASS LCL_ABC DEFINITION.
*  PUBLIC SECTION.
*    METHODS : M1.
*    METHODS : M1 IMPORTING X TYPE I.
*    METHODS : M1 IMPORTING X TYPE C.
*    METHODS : M1 IMPORTING X TYPE I Y TYPE I.
*
*ENDCLASS.


"""" NOTE - ABAP SUPPORTS METHOD OVERIDING HENCE.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" METHOD OVERIDING EXAMPLE.

CLASS LCL_ABC DEFINITION.
  PUBLIC SECTION.
    METHODS M1.
    METHODS M2.
    METHODS M3.                             """" FINAL REDEFINITION - MEANS METHOD CAN BE INHERITED BUT CANNOT BE REDEFINED.

    """" DEFINING STATIC METHOD.
*    CLASS-METHODS M5.

*    METHODS M6.

    METHODS M7.


  PRIVATE SECTION.                                             """" NO POSSIBILITY OF REDEFINITION SINCE ITS POSSIBLE ONLY FOR INHERITED METHODS.
  """" REDEFITION IS POSSIBLE ONLY FOR INHERITED METHODS IT CAN BE EITHER PUBLIC OR PROTECTED.

*    METHODS M4.                                                """" FINAL METHOD CAN'T BE REDEINED HENCE FINAL KEYWORD NOOT USEFUL .
*     METHODS M4 FINAL REDEFINITION.                           """" SYNTAX ERROR ^

ENDCLASS.

CLASS LCL_ABC IMPLEMENTATION.
  METHOD M1.
    WRITE :/ 'INSIDE INSTANCE METHOD M1 OF SUPER CLASS ABC... '.
  ENDMETHOD.

  METHOD M2.
    WRITE :/ 'INSIDE INSTANCE METHOD M2 OF SUPER CLASS ABC... '.
  ENDMETHOD.

    METHOD M3.
    WRITE :/ 'INSIDE INSTANCE METHOD M3 OF SUPER CLASS ABC... '.
  ENDMETHOD.

*  METHOD M4.
*    WRITE :/ 'INSIDE INSTANCE METHOD M3 OF SUPER CLASS ABC... '.
*  ENDMETHOD.
*

*  METHOD M5.
*    WRITE :/ 'INSIDE STATIC METHOD M5 OF SUPER CLASS ABC... '.
*  ENDMETHOD.

*    METHOD M6.
*      WRITE :/ 'INSIDE INSTANCE METHOD M6 OF SUPER CLASS ABC... '.
*    ENDMETHOD.

  METHOD M7.
    WRITE :/ 'INSIDE INSTANCE PUBLIC METHOD M7 OF SUPER CLASS ABC... '.
  ENDMETHOD.





ENDCLASS.



CLASS LCL_PQR  DEFINITION INHERITING FROM LCL_ABC.   """" SO ACCORDING TO INHERITANCE PPRICIPLE ALL THE PUBLIC AND PROTECTED COMPONENTS WILL BE INHERITED TO THE SUBCLASS.
  PUBLIC SECTION.
*
*    METHODS M1.                              """" SYNTAX ERROR - M1 HAS ALREADY BEEN DECLARED.
     """" NOTE - M1 METHOD IS ALREADY IMPLEMENTED IN SUPER CLASS AND I WANT TO REIMPLEMENT THAT INSIDE SUBCLASS.
     """"        WHENEVER A SUBCLASS WANTS TO REIMPLEMENT THE METHODS OF THE SUPERCLASS THEN THE SUBCLASS HAS TO REDECLARE THAT NETHOD.

  METHODS M1 REDEFINITION.
  METHODS M2 REDEFINITION.
*  METHODS M3 REDEFINITION.                                        """" ERROR - FINAL METHOD M3 CANNOT BE REDEFINED.

*  CLASS-METHODS M5 REDEFINITION.                                   """" ERROR - EVEN THO STATIC METHODS ARE PUBLIC IT CANNOT BE REDEFINED IT CAN ONLY BE INHERITED.
                                                                   """"         ONLY INSTANCE METHODS CAN BE REDEFINED.
*  CLASS-METHODS M6 REDEFINITION.                                   """" ERROR - CANNOT CHANGE THE CATEGORY.

   """" TRYING TO REDEINE M7 INSIDE PROTECTED SECTION.
  PROTECTED SECTION.
*    METHODS M7 REDEFINITION.                                        """" ERROR - WHEN YOU REDEFINE A METHOD CANNOT CHANGE ITS VISIILITY.



ENDCLASS.


CLASS LCL_PQR IMPLEMENTATION.
  METHOD M1.                                                               """" SINCE WE HAVE NOT CALLED HERE "CALL METHOD M2 OF SUBCLASS IMPLEMENTATION WHEREAS IN M2 BOTH IS BEING EXECUTED."
    WRITE :/ 'INSIDE INSTANCE METHOD M1 REDEFINED IN SUB CLASS LCL_PQR'.

  ENDMETHOD.

    METHOD M2.
    WRITE :/ 'INSIDE INSTANCE METHOD M2 REDEFINED IN SUB CLASS LCL_PQR'.
*    CALL METHOD M2.                                                       """" THIS WILL CREATE RECURSION(RECURSIVE CALLS) WITH ENDLESS LOOP(INDEFINITE LOOP).

     CALL METHOD SUPER->M2.                                                """" WITH THIS WE WOULD COMPLETE THE BELOW REQUIREMENT AND GET THE IMPLEMENTATION OF
                                                                           """" BOTH SUPER CLASS AND SUB CLASS.


  ENDMETHOD.

ENDCLASS.


***********************************************************************************************
"""" CALLING METHODS.

START-OF-SELECTION.

DATA OB1 TYPE REF TO LCL_PQR.

CREATE OBJECT OB1.

CALL METHOD OB1->M1.


ULINE.
"""" NOTE - THE REDEINITION M1 OF CLASS LCL_PQR WILL BE EXECUTED AND SHOWN IN THE OUTPUT.
"""" PURPOSE OF REDEFINITION - WITHOUT DISTURBING THE EXISTING FUNCTIONALITY WE ARE PLUGGING ADDITIONAL FUNCTIONALITY.

CALL METHOD OB1->M2.


"""" REQ- FOR M2 METHOD I WANT TO ACCESS BOTH THE IMPLEMENTATION. SO WHAT I WILL DO IS IN THE SUBCLASS. OB1 IS OBJJECT OF PQR CLASS.


"""" NOTE - IT IS RECOMMENDED THAT WHEN WE REDEFINE A METHOD THEN ALSO CALL THE IMPLEMENTATION OF THE SUPERCLASS METHOD USING SUPER KEYWORD.S

ULINE.

CALL METHOD OB1->M3.


"""" NOTE - FINAL METHODS CAN BE INHERITED BUT CANNOT BE REDEFINED.

"""" NOTE - STATIC METHODS CAN BE ACCESSED EITHER BY USING OBJECT OR BY USING CLASS.

ULINE.

*CALL METHOD OB1->M5.
*CALL METHOD LCL_ABC=>M5.

"""" NOW REDEFINING ABOVE CLASS M5.

"""" DECLARING ANOTHER METHOD M6.
