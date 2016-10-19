Procedure.l _seek_func(_func.s)               ; on recherche la fonction dans la liste chainée
  ResetList(The_Function())                   ; on commence par le début
  
  While NextElement(The_Function())
    If The_Function()\_name = _func           ; si on trouve la même fonction
      ProcedureReturn The_Function()\_line  ; on renvoi le numéro de la ligne qui se trouve
    EndIf                                     ; dans la librarie
  Wend

  ProcedureReturn -1
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 1
; Folding = -
; DisableDebugger