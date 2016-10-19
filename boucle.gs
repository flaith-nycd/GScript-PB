.D ON
.S boucle = Boucle de
.$ sample_lib
.P Boucle;
.P " 0 a 9
.S INDEX = 0
.I INDEX <= 9
.T P "Index = ;
.T P INDEX
.T S INDEX++
.T J -4
._
.!MORE
.P
.P Boucle;
.P " 15 a 5
.S INDEX = 15
.I INDEX >= 5
.T P "Index = ;
.T P INDEX
.T S INDEX--
.T J -4
.S L = 3
.S text(l) = 5
._
.D OFF
@@@@@
