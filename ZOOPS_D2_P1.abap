REPORT ZOOPS_D2_P1.


"""""""""""""" OOPS DAY 2 PROG 1 """""""""""""""""""

"""" TOPICS - 1)PUBLIC,PROTECTED,PRIVATE SECTIONS 2)INSTANCE METHOD 3)HANDLING REQUIREMENT(2 METHODS SETEMP AND GETEMP).



"""" REQUIREMENT - NEED 5 OBJECTS 3 INSTANCE ATTRIBUTES AND 2 METHODS. 3 ATTRIBUTES SHOULD BE EMPNO( EMPLOYEE ID), ENMAE (EMPLOYEE NAME), EMPDESIG(EMPLOYEEE DESIGNATION) AND ONE METHOD SHOULD SET THE VALUES FOR THE ATTRIBUTE AND THE OTHER SHOULD GET THE
*VALUES.


****Note: We Go For Instance Attributes Whenever We Need To Maintain Unique
****(Different) Values For Each Object. We Go For Static Attributes, Whenever We Need
****To Maintain A Common (Same) Value For All The Objects Of The Class. We Go For
****Constant Attributes, Whenever We Need To Maintain A Fixed Value For All The
****Objects Of The Class



CLASS LCL_EMP DEFINITION.
  """" NOTE - THE SECTIONS SHOULD BE IN THE ORDER OF PUBLIC, PROTECTED AND PRIVATE.
    PUBLIC SECTION.
   METHODS : SETEMP,      """" NOTE - ANYTHING DECLARED BY USING METHODS KEYWORD IS INSTANCE METHODS.
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

   METHOD GETEMP.  """" NOTE- IF YOU OPEN AND CLOSE THE METHOD IT IS KNOWN AS NULL IMPLEMENTATION.
     WRITE : / EMPNO, ENAME, EMPDESIG. """ HERE WE DON'T NEED TO CREATE OBJECT FOR INSTANCE ATTRIBUTE SINCE ITS IN THE SAME CLASS AND NOT OUTSIDE.
   ENDMETHOD.

   METHOD SETEMP.
     EMPNO = 5.
     ENAME = 'RAJU'.
     EMPDESIG = 'MANAGER'.
   ENDMETHOD.


ENDCLASS.


"""" ERROR - STATEMENT NOT ACCESSIBLE.


DATA OB1 TYPE REF TO LCL_EMP.
START-OF-SELECTION.                                """" CAN DO THIS ELSE ADD IMPLEMENTATION STATEMENT AFTER IT.
CREATE OBJECT OB1.                                  """" WHENEVER AN OBJECT IS CREATED IT ALLOCATES MEMORY FOR INSTANCE ATTRIBUTES & NOT FOR NETHODS.



*CALL METHOD OB1->SETEMP.        """" (OR)
OB1->SETEMP( ).

CALL METHOD OB1->GETEMP.


ULINE.

FORMAT COLOR 1.
WRITE :/ 'SECOND OBJECT OB2'.

DATA OB2 TYPE REF TO LCL_EMP.

CREATE OBJECT OB2.

CALL METHOD OB2->GETEMP.

FORMAT COLOR OFF.

ULINE.

FORMAT COLOR 2.

WRITE :/ 'NOW ASSIGING OB1 TO OB2(OB2 = OB1)'.

OB2 = OB1.

CALL METHOD OB2->GETEMP.                           """" SO CAN ASSIGN ONE OBJECT TO ANOTHER. SINCE BOTH THE OBJECT BELONGS TO SAME CLASS.

FORMAT COLOR OFF.