;  ********************************************
;  ***                                      ***
;  *** PBGScript "ala" Mask Of The Sun Game ***
;  ***       Copyleft 2006 par Flaith       ***
;  ***                                      ***
;  ********************************************

IncludePath "Includes"
XIncludeFile "@_All_Includes.pb"

;/****************************************************************************
;-*** Main Program
;/****************************************************************************
OpenConsole()
EnableGraphicalConsole(1)               ; Obligé à cause du ClearConsole

  Init_Program()
  Main()
  End_Program()

CloseConsole()

; IDE Options = PureBasic v4.02 (Windows - x86)
; ExecutableFormat = Console
; CursorPosition = 7
; Folding = -
; UseIcon = nico.ico
; Executable = PBGscript.exe
; DisableDebugger