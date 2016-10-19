Procedure Init_Program()
  _DEBUG            = #False
  _Function_file    = #True
  _if_flag          = #False
  _then_flag        = #False
  _else_flag        = #False
  _WHAT_TO_EXECUTE  = #EXEC_SCRIPT
  _FUNC_CALL        = 0
  
  Restore Data_CMP
  For i.l = 0 To #MAX_CMP
    Read _CMP(i)
  Next i

  Restore Data_CALC
  For i.l = 0 To #MAX_CALC
    Read _CALC(i)
  Next i

  ; Toujours créer ce fichier
  CreateFile(#fdebug,"GS_DEBUG.LOG")

  ; ***************************************
  If _Function_file = #True
    CreateFile(#TMP_FILE,"GS_FUNCT.LOG")
  EndIf
  ; ***************************************
  
  _Store("_KEY_ = ")
  _Store("_VER_ = ")

;   For i = 0 To 255
;     _Store("KA_"+RSet(Str(i),3,"0")+" = "+RSet(Str(i),3,"0"))
;   Next i
  
  
EndProcedure

; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 3
; Folding = -
; DisableDebugger