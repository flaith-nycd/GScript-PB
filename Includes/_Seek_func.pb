Procedure.l _seek_func(_func.s)               ; on recherche la fonction dans la liste chain�e
  ResetList(The_Function())                   ; on commence par le d�but
  
  While NextElement(The_Function())
    If The_Function()\_name = _func           ; si on trouve la m�me fonction
      ProcedureReturn The_Function()\_line  ; on renvoi le num�ro de la ligne qui se trouve
    EndIf                                     ; dans la librarie
  Wend

  ProcedureReturn -1
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 1
; Folding = -
; DisableDebugger