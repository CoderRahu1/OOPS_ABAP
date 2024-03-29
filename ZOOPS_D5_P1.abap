REPORT ZOOPS_D5_P1.


*****  DAY 5 PROGRAM 1 ******

"""" TOPICS - 1) FRIEND CLASS, 2) USING DEFERRED KEYWORD - TO INFORM THAT SOME CLASS HAS BEEN DECLARED IN THE BOTTOM.



"""" FRIEND CLASSES : USED TO ACCESS PROTECTED AND PRIVATE INSTANCE OBJECTS ANYWHERE AS NEEDED.this variant of the statement class is used to make the class class known, regardless of the location of the actual definition of the class in the program. it
does not introduce a declaration part and must not be ended using endclass.





"""" DEFINING LCL_PQR BEFORE LCL_ABC BECAUSE OF ERROR.
"""" NOTE - PRE DEFINING LCL_PQR CLASS BECAUSE OF THE ERRORS ITS CAUSING BELOW.
"""" HENCE USING THE DEFRED STATMENT TO AVOID THE ERROR.



"""" USING FORWARD DECLARATION - WHENEVER WE ARE GOING FOR FRIEND CLASS.
CLASS LCL_PQR DEFINITION DEFERRED.                     """" DEFERED MEANS DELAYED , THIS WE ARE INFORMAING THAT IT HAS BEEN DECLARED SOMEWHERE ELSE IN THE PROGRAM.



CLASS LCL_ABC DEFINITION FRIENDS LCL_PQR.                                    """" ADDING KEYWORD FRIENDS. SO ABC CLASS IS CONSIDERING PQR CLASS AS FRIENDS.
  PUBLIC SECTION.                                                            """" THIS MEANS INSIDE PQR CLASS I CAN ACCESS ALL THE COMPONENTS OF ABC CLASS IRRESPECTIVE OF THE VISIBILITY.
    METHODS M1.
  PROTECTED SECTION.
    METHODS M2.
  PRIVATE SECTION.
    METHODS M3.

 ENDCLASS.

 CLASS LCL_ABC IMPLEMENTATION.
   METHOD M1.
     WRITE :/ 'INSIDE INSTANCE PUBLIC METHOD M1 OF LCL_ABC'.
   ENDMETHOD.

   METHOD M2.
     WRITE :/ 'INSIDE INSTANCE PUBLIC METHOD M2 OF LCL_ABC'.
   ENDMETHOD.

   METHOD M3.
     WRITE :/ 'INSIDE INSTANCE PUBLIC METHOD M3 OF LCL_ABC'.
   ENDMETHOD.

 ENDCLASS.


 """" NOW CREATING ANOTHER CLASS.

"""" NOTE - MOVING THE CLASS PQR DEFINATION UP SINCE ERROR - TYPE LCL_PQR IS UNKNOWN AND LATER MOVING THE IMPLEMENTATION AS WELL TO THE TOP.
"""" STOPPED MOVING SINCE WE CAN FORWARD DECLARE THE FRONT CLASS TO AVOID THE ERRORS.

 CLASS LCL_PQR DEFINITION.
   PUBLIC SECTION.
    METHODS M4.


 ENDCLASS.

CLASS LCL_PQR IMPLEMENTATION.
   METHOD M4.
     WRITE :/ 'INSIDE INSTANCE PUBLIC METHOD M4 OF LCL_PQR'.
"""" NOW FOR ABC CLASS WE WILL CREATE THE OBJECT INSIDE THE METHOD M4 OF PQR CLASS.

     DATA K TYPE REF TO LCL_ABC.              """" THIS SHOWS WE CAN CREATE OBJECTS INSIDE OTHER CLASS METHODS ALSO.
     CREATE OBJECT K.

     CALL METHOD K->M1.
*     CALL METHOD K->M2.                       """" ERROR ACCESS TO PROTECTED METHOD M2 IS NOT ALLOWED.
*     CALL METHOD K->M3.                        """" ERROR ACCESS TO PRIVATE METHOD M3 IS NOT ALLOWED.

"""" NOW THE ABOVE CODE WILL WORK SINCE CLASS PQR IS FRIEND OF CLASS ABC.

     CALL METHOD K->M2.
     CALL METHOD K->M3.

   ENDMETHOD.

 ENDCLASS.

"""" NOW THE ABOVE 2 CLASSES ARE INDEPENDENT CLASSES AND THEY DON'T HAVE ANY RELATIONSHIP BETWEEN THEM.
"""" THE ONLY RELATIONSHIP IS BOTH THE CLASSES BELONGS TO SAME OBJECT OR REPORT.

START-OF-SELECTION.

"""" CREATING OBJECT FOR THE 2ND CLASS.

DATA OB1 TYPE REF TO LCL_PQR.
CREATE OBJECT OB1.

CALL METHOD OB1->M4.

"""" SO FAR WE ARE CREATING THE OBJECT OUTSIDE THE CLASS.
"""" NOW FOR ABC CLASS WE WILL CREATE THE OBJECT INSIDE THE METHOD M4 OF PQR CLASS.

"""" ABOVE IS THE ONE OF THE USE CASES FOR CREATING THE FRIEND CLASS FOR THE FRIEND CLASS
"""" BY DEFAULT OUSIDE THE CLASS A OBJECT CAN ACCESS ONLY THE PUBLIC COMPONENT. IN ORDER TO MAKE COMPONENTS ACCESIBLE IRRESPECTIVE OF THE VISIBILITY THEN WE WILL GO FOR FRIEND CLASSES.
"""" BUT IF THE LOCAL CLASS HAS TO CONSIDER THE OTHER CLASS AS FRIEND THAT FRIEND CLASS SHOULD BE DEFINED FIRST .

"""" NOW SINCE PLACING IMPLEMENTATION BELOW IS NOT A GOOD PRACTICE HENCE PLACING IMPLEMENTATION ALONG WITH DEFINITION.
"""" SINCE ITS RECOMMENDED TO PROVIDE .

"""" NOTE - WE CANNOT CONSIDER NON - EXISTING CLASS AS FRIEND ONLY KNOW PERSON CAN BE MADE AS FRIEND.




"""" DOING THE SAME CONCEPT IN THE GLOBAL CLASS WITH THE NAME ZCL_ABC AND CREATING EXECUTABLE PROGRAM .
