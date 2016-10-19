'.D ON
.$ sample_lib
.C
.P "Test de if, then, else
.P "----------------------
.P
.P "A = 45
.S A = 45
.P "B = 10
.S B = 10
.P
.P "IF A > 45
.P "  A = 45
.P "  B = 12
.P "ELSE
.P "  A = 35
.P "  B = 20
.P "ENDIF
.P
.!MORE
.I A > 45
.T S A = 45
.T S B = 12
.E S A = 35
.E S B = 20
.P
.P "Resultat :
.P
.P "--> A = ;
.P A
.P "--> B = ;
.P B
'.D OFF
@@@@@
