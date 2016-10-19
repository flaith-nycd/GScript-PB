.P "Sample program #4 loaded by sample program #3
.P "---------------------------------------------
.P
.P "Affichage de l'avatar via une fonction
.P
.!AVAT
.!MORE
.J +5
.J +9
.I _KEY_=KA_027
.T J +2
.E G test
.P
.P "You pushed the ";
.P _KEY_;
.P "" key
.J -8
.P "Valeur de OS(27) = ;
.P OS(27)
._
.W "Appuyez sur une touche quelconque : 
.C
.P "Bye bye !!!
.P
.P
.P _VER_
.P
.!BUNY
.P
.!MAGI
'.P "Test affichage d'une erreur
'.P "Le "Then" n'est pas encore defini
'.P "donc il y aura une erreur !!!
'.T G test
.!HELO
.!HACK
.P "Put Debug OFF
.D OFF
@@@@@
