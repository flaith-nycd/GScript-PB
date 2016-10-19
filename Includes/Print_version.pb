Procedure print_version()
  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(#LIGHTGREEN,0)
  CompilerEndIf
  
  PrintN(#PROGNAME+" by Flaith V"+#VERSION+"-"+#DATE_VERSION)
  
  CompilerIf #__COLOR_ON__ = #True
	  ConsoleColor(15,0)
  CompilerEndIf
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; Folding = -
; DisableDebugger