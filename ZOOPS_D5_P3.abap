REPORT ZOOPS_D5_P3.

********* DAY 5 PROGRAM 3 *************

"""" TOPICS - 1) LOAD KEYWORD.


"""" USING STATIC AND INSTANCE COMPONENTS.
"""" USE IMPLIES OPERATOR WHEN REFERING TO CLASS.
ZCL_MNR2=>X = 10.

CALL METHOD ZCL_MNR2=>M1.


""" NOW THERE USED TO BE ERROR EARLIER WHILE ACCESSING OBJEKT WITHOUT DECLARING CLASS THEREFORE NEED TO ADD THE BELOW CODE AT THE TOP.
*CLASS ZCL_MNR2 DEFINITION LOAD.                      """" IN FUTURE VERSION WILL BE REMOVED.
