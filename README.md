# GScript-PB
Interpreter based on the Apple II game "Mask of the Sun"
made with purebasic (www.purebasic.com)

## Usage
```
PBGscript [options] [script_without_extension].
Available options are:
  -d       force debug mode
  -h       show this help
  -v       show version information
  -l       show licence information
```
## "boucle.gs"
```
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
```
## Example
```
$ pgscript boucle
Boucle de 0 a 9
Index = 0
Index = 1
Index = 2
Index = 3
Index = 4
Index = 5
Index = 6
Index = 7
Index = 8
Index = 9
[ Waiting ]

Boucle de 15 a 5
Index = 15
Index = 14
Index = 13
Index = 12
Index = 11
Index = 10
Index = 9
Index = 8
Index = 7
Index = 6
Index = 5
THE END FOLKS !!!
```
