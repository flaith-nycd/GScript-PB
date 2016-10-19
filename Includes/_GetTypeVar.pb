Procedure.l _GetTypeVar(valeur.s)
  ResetList(The_Var())                        ; on commence par le début
  
  While NextElement(The_Var())
    If The_Var()\_variable = UCase(valeur)    ; si on trouve la variable
      ProcedureReturn The_Var()\_type
    EndIf
  Wend

  ProcedureReturn -1
EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 1
; Folding = -
; DisableDebugger