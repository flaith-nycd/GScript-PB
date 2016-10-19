Procedure.l _load_script(_script.s)
Protected ligne.s, script_file.s
Protected numligne.l = 0, fd.l
  
  _TOTAL_LINES = 0                      ; on commence le script à la 1ère ligne

  script_file = _script + ".gs"

  fd = ReadFile(#fscript,script_file)
  
  If fd
  	While Eof(#fscript) = 0             ; Tant que la 'fin de fichier' n'est pas atteinte
  	  ligne = ReadString(#fscript)
		  _script_line(numligne)\_num = numligne
		  _script_line(numligne)\_line = ligne
		  numligne+1
	  Wend
	Else
    _ERROR(script_file, #ERR_LOAD_SCR)	
	EndIf
	
	CloseFile(#fscript)
	_TOTAL_LINES = numligne
	_SCRIPT_LOADED = _script
	
; 	WriteStringN(#fdebug, "Nb of line for the script : "+script_file+" = "+Str(numligne))
	
	ProcedureReturn numligne
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 29
; Folding = -
; DisableDebugger