Procedure.l _if_compare(valeur.s)
Protected Pos.l = 0, Result.l = 0, i.l = 0, long.l = 0, lenVal.l = 0
Protected valA.s = "", valB.s = "", cmp.s = "", type.l = -1, WorkWith.l

Protected LeftVarCHAR.s = "", RightVarCHAR.s = ""
Protected LeftVarINT.l = 0, RightVarINT.l = 0

  For i = 0 To #MAX_CMP
    Result = FindString(valeur,_CMP(i),1)
    If Result > 0
      Pos = Result
      long = Len(_CMP(i))
      cmp = _CMP(i)
      type = i                                ; Permet de faire un case
      Break
    EndIf
  Next i

  ; on a trouvé de quoi faire une comparaison
  If Pos
    lenVal = Len(valeur) - (Pos+long)
    valA = Trim(Left(valeur, Pos-1))
    valB = Trim(Mid(valeur, Pos+long+1, lenVal))
;     MessageRequester("_If_Compare","Valeur Gauche:["+valA+"]"+#CRLF$+"Valeur Droite:["+valB+"]"+#CRLF$+"CMP:["+cmp+"]")
  Else
    _ERROR("",#ERR_IF)
  EndIf
  
  ; _Check_Array (Car parentheses)
  ; pour chaque variable (gauche et droite)
  If _Array(valA,#_CHECK) = "True"
    LeftVarCHAR = _Array(valA,#_GET)
  Else
    LeftVarCHAR = _GetValue(ValA, -1)
    If LeftVarCHAR = "NOTHING"
      _ERROR("VAR:"+ValA,#ERR_VAR_NOTFOUND)
    EndIf
  EndIf
  
  If _Array(valB,#_CHECK) = "True"
    RightVarCHAR = _Array(valB,#_GET)
  Else
    If _GetTypeVar(ValB, -1) >= 0             ; c'est une variable ?
      RightVarCHAR = _GetValue(ValB, -1)
    Else
      RightVarCHAR = ValB                     ; non c'est un chiffre ou du texte
    EndIf      
  EndIf

  _then_flag = #False
  _else_flag = #False

  If _IsDigitOrChar(RightVarCHAR) = #_INT
    RightVarINT = Val(RightVarCHAR)
    LeftVarINT = Val(LeftVarCHAR)
    WorkWith = #_INT
  Else
    WorkWith = #_CHAR
  EndIf
    
;   Print("LeftVar  = ["+leftvar+"] - ")
;   PrintN("RightVar = ["+rightvar+"]")

  ; maintenant on fait la comparaison pour faire un then ou un else
  If WorkWith = #_CHAR
    Select type
      Case 0                                    ; "<="
        If LeftVarCHAR <= RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf

      Case 1                                    ; ">="
        If LeftVarCHAR >= RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 2                                    ; "="
        If LeftVarCHAR = RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 3                                    ; "<>"
        If LeftVarCHAR <> RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 4                                    ; "<"
        If LeftVarCHAR < RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 5                                    ; ">"
        If LeftVarCHAR > RightVarCHAR
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Default
  
    EndSelect
  Else
    Select type
      Case 0                                    ; "<="
        If LeftVarINT <= RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf

      Case 1                                    ; ">="
        If LeftVarINT >= RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 2                                    ; "="
        If LeftVarINT = RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 3                                    ; "<>"
        If LeftVarINT <> RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 4                                    ; "<"
        If LeftVarINT < RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Case 5                                    ; ">"
        If LeftVarINT > RightVarINT
          _then_flag = #True
        Else
          _else_flag = #True
        EndIf
    
      Default
  
    EndSelect
  EndIf
  
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 5
; Folding = -
; DisableDebugger