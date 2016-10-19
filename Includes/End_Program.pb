Procedure End_Program()
;   PrintN("Nb lines of the library = "+Str(_TOTAL_LINES_LIB))
; 
;   For i = 0 To _TOTAL_LINES_LIB
;     Print(RSet(Str(_library_line(i)\_num),6,"0"))
; 		PrintN(" - "+_library_line(i)\_line)
;   Next i
;   PrintN("Nb lines of the script loaded = "+Str(_TOTAL_LINES))
  
;   _ERROR("GE(26)",#ERR_VAR_NOTFOUND)    ; test affichage de l'erreur 

  CloseFile(#fdebug)
 
  ; ***************************************
  If _Function_file = #True
    CloseFile(#TMP_FILE)
  EndIf
  ; ***************************************
EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 18
; Folding = -
; DisableDebugger