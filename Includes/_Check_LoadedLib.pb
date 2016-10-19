Procedure.l _check_LoadedLib(_lib.s)
Protected i.l

  For i = 0 To #LIBMAX
    If LoadedLib(i) = _lib
      ProcedureReturn 1
    EndIf
  Next i

  ProcedureReturn 0
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; Folding = -
; DisableDebugger