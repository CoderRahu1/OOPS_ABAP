REPORT ZOOPS_D6_P1.

********** DAY 6 PROGRAM 1 ****************


"""" TOPICS - 1) CONSTRUCTORS


"""" CONSTRUCTOR - IT IS ALSO A TYPE OF METHOD, BUT IT IS A SPECIAL METHOD, FOR NORMAL METHOD WE USE THE KEYWORD CALL METHOD FOR CALLING THE METHOD WHEREAS
""""               FOR CONSTRUCTOR IT WILL BE CALLED AUTOMATICALLY WHEN AN OBJECT IS CREATED.
""""               IN C++ AND JAVA IF THE CLASS NAME AND THE METHOD NAME IS SAME THEN WE CALL IT AS CONSTRUTOR.
""""               IN ABAP CONSTRUCTORS ARE CLASSIFIED INTO 2 TYPES INSTANCE CONSTUCTOR AND STATIC CONSTRUCTOR.
""""               INSTANCE CONSTRUCTOR NAME WILL ALWAYS BE CONSTRUCTOR.
""""               CONSTRUCTORS ARE ALWAYS DECLARED IN PUBLIC SECTION.
""""               INSTANCE CONSTRUCTOR WILL BE EXECUTED ONCE IN THE LIFETIME OF EACH OBJECT.
""""               NORMAL METHOD CAN CONTAIN 4 TYPES OF PARAMETERS (IMPORTING, EXPORTING, CHANGING, RETURNING), INSTANCE CONSTRUCTOR CAN CONTAIN ONLY IMPORTING PARAMETERS.
""""               WITHIN SAME CLASS WE CANNOT HAVE MORE THAT ONE INSTANCE CONSTRUCTOR AND ONE STATIC CONSTRUCTOR.
""""               WHEN DO WE GO FOR CONSTRUCTOR? - WHEN WE CREATE OBJECT WE WANT SOME INITIALIZATION TO TAKE PLACE.



"""" Q - WHEN DO WE GO FOR CONSTRUCTOR?
"""" A - WHEN WE WANT SOME INITIALIZATION OF VALUES TO TAKE PLACE BEFORE WE CREATE THE OBJECT.











""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" COPYING BELOW CODE FROM DAY 2 PROGRAM 1.


CLASS LCL_EMP DEFINITION.
  """" NOTE - THE SECTIONS SHOULD BE IN THE ORDER OF PUBLIC, PROTECTED AND PRIVATE.
    PUBLIC SECTION.
   METHODS : CONSTRUCTOR,      """" INSTANCE CONSTRUCTOR - SPECIAL METHOD.              """" EARLIER THIS WAS SETEMP WHICH WAS INSTANCE METHOD.
             GETEMP.

  PROTECTED SECTION.                     """" NOTE - GENERALLY WE DECLARE ATTRIBUTES AS PROTECTED OR PRIVATE WHILE METHODS AS PUBLIC.
  DATA: EMPNO TYPE I,                    """" INSTANCE ATTRIBUTES.
        ENAME(20) TYPE C,
        EMPDESIG(25) TYPE C.

  """" NOW FOR CREATING LOCAL METHOD THE STEPS ARE -
*******************************Declaration (Method prototype declaration) --> Inside Class definition
*******************************Implementation --> Inside Class Implementation
*******************************Calling --> outside class / inside other method implementation


 ENDCLASS.

CLASS LCL_EMP IMPLEMENTATION.

   """" NOTE - IF THERE IS 100 METHOD DEFINITION THEN THERE SHOULD ALSO BE 100 METHOD IMPLEMENTATION.

   """" THIS BELOW METHOD SHOULD BE EXCECUTED ONLY WHEN IT IS CALLED. IF YOU DON'T CALL THE SUBROUTINE IT WILL NOT BE EXECUTED. HENCE ITS NOT ABLE TO UNDERSTAND FROM WHERE IT HAS TO START THE PROGRAM EXECUTION.
   """" ITS LIKED FORM ENDFORM HENCE SAP IS NOT ABLE TO UNDERSTAND SINCE IT WAS CALLED BEFORE LIKE PERFORM IS ACTUALLY CALLED AFTER FORM AND ENDFORM

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   METHOD GETEMP.  """" NO
     WRITE : / EMPNO, ENAME, EMPDESIG. """ HERE WE DON'T NEED TO CREATE OBJECT FOR INSTANCE ATTRIBUTE- IF YOU OPEN AND CLOSE THE METHOD IT IS KNOWN AS NULL IMPLEMENTATION.TE SINCE ITS IN THE SAME CLASS AND NOT OUTSIDE.
   ENDMETHOD.


   METHOD CONSTRUCTOR.
     EMPNO = 1.
     ENAME = 'RAHUL PILLAI'.
     EMPDESIG = 'MANAGER'.

   ENDMETHOD.


ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

START-OF-SELECTION.

FORMAT COLOR 1.
WRITE :/ 'FIRST OBJECT OB1...'.


DATA OB1 TYPE REF TO LCL_EMP.
CREATE OBJECT OB1.                     """" WHENEVER WE CREATE OBJECT.... MEMORY WILL BE ALLOCATED TO INSTANCE ATTRIBUTES AND THEY GET INITIALIZED TO DEFAUT VALUE.
"""" NOTE - APPART FROM THIS WHENEVER WE CREATE THE OBJECT IT
""""        CREATES MEMEORY AND THEY GET INITIALIZED TO DEFAULT VALUES AND IT CHHECKS IF THE CLASS CONTAINS ANY INSTANCE CONSTRUCTORS.
""""        SO IF THE CLASS CONTAINS ANY INSTANCE CONSTRUCTOR THAT CONSTRCUTOR GETS EXECUTED.
CALL METHOD OB1->GETEMP.
"""" NOTE - CONSTRUCTOR WILL BE AUTOMATICALLY CALLED. SO WE CREATE 100 OBJECTS THEN THE CONSTRUCTOR WILL BE CALLED 100 TIMES.

ULINE.
FORMAT COLOR OFF.

FORMAT COLOR 2.
WRITE :/ 'SECOND OBJECT OB2....'.
DATA OB2 TYPE REF TO LCL_EMP.
CREATE OBJECT OB2.

CALL METHOD OB2->GETEMP.

"""" SO THE ABOVE CODE SHOWS THAT EVEN ON THE SECOND OBJECT THE CONSTRUCTOR GOT EXECUTED.
ULINE.
FORMAT COLOR OFF.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
