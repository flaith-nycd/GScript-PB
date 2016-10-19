Procedure Main()
Protected script.s							        ; Nom du script à lancer !!!
Protected argc.l

;script = "then"
;Goto suite

  argc = GET_Argv()
    
  If argv(0) = ""                       ; Pas d'autres arguments
    print_usage()
    End
  Else                                  ; il y a d'autres arguments
    For i = 0 To argc
      If Left(argv(i),1) <> "-"         ; ce n'est pas une option
        Break
      EndIf
      Select LCase(Mid(argv(i),2,1))    ; c'est une option
        Case "d"
          _DEBUG = #True
        Case "v"
          print_version()
          End
        Case "h"
          print_usage()
          End
        Case "l"
          print_licence()
          End
        Default
          _BEEP()
          CompilerIf #__COLOR_ON__ = #True
            ConsoleColor(14,0)
          CompilerEndIf
            PrintN(">>> ERROR : Unknow option "+#QUOTE+Mid(argv(i),2,Len(argv(i))-1)+#QUOTE)
          CompilerIf #__COLOR_ON__ = #True
            ConsoleColor(15,0)
          CompilerEndIf
          print_usage()
          End
      EndSelect
	  Next i
  EndIf
  
  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(15,0)
  CompilerEndIf
  
  If _DEBUG = #True
    script = argv(1)
  Else
    script = argv(0)
  EndIf
  
;suite:
  _SCRIPT_LOADED = script               ;	Le faire la 1ère fois pour affichage
						 			                      ; du nom du script ou se trouve l'erreur
  If _run_script(script) = -1
    _ERROR(script,#ERR_LOAD_SCR)
  EndIf
; 
EndProcedure

; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 20
; FirstLine = 6
; Folding = -
; DisableDebugger