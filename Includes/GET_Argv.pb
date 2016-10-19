Procedure.l GET_Argv()
Protected txt.s, i.l

  i = 0
  txt = ProgramParameter()

  While txt <> ""
    argv(i) = txt
    i+1
    txt = ProgramParameter()
  Wend
  ProcedureReturn i
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; Folding = -
; DisableDebugger