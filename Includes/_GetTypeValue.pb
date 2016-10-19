Procedure.l _GetTypeValue(valeur.s)
Protected i.l = 0, the_type.l = 0, result.l = 0, car.s

  For i = 1 To Len(valeur)
    car = Mid(valeur, i, 1)
    
    If Asc(car) >= 48 And Asc(car) <= 57
      the_type = 0
    Else
      the_type = 1
    EndIf
    
    result + the_type
  Next i
  
  If result = 0
    the_type = 0
  Else
    the_type = 1
  EndIf
    
  ProcedureReturn the_type

EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 5
; Folding = -
; DisableDebugger