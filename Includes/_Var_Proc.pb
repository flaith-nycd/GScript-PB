Procedure.l _IsDigitOrChar(valeur.s)
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

Procedure.l _GetTypeVar(valeur.s, indice.l)
  ResetList(The_Var())                        ; on commence par le début
  
  While NextElement(The_Var())
    If The_Var()\_variable = UCase(valeur) And The_Var()\_indice = indice
      ProcedureReturn The_Var()\_type         ; si on trouve la variable
    EndIf
  Wend

  ProcedureReturn -1
EndProcedure

Procedure.s _GetValue(valeur.s, indice.l)
  ResetList(The_Var())                        ; on commence par le début
  
  While NextElement(The_Var())
    If The_Var()\_variable = UCase(valeur) And The_Var()\_indice = indice
      ProcedureReturn The_Var()\_valeur       ; si on trouve la variable
    EndIf
  Wend

  ProcedureReturn "NOTHING"
EndProcedure

Procedure _Store(Valeur.s)
Protected result.l, ind.l, pos_droite.l, pos_gauche.l, pos.l
Protected pos_incr.l, pos_decr.l, pos_add.l, pos_sub.l
Protected lenVal.l = 0, ValINT.l = 0
Protected array_tab.s = "", valeur_inside.s = "", val_inside_tmp.s = ""
Protected ValA.s = "", ValB.s = "", val_tmp.s = ""

  Pos = FindString(valeur,"=",1)
  Pos_incr = FindString(valeur,"++",1)
  Pos_decr = FindString(valeur,"--",1)
  
  If Not pos_incr Or Not pos_decr
    Pos_add = FindString(valeur,"+",1)
    Pos_sub = FindString(valeur,"-",1)
  EndIf

  ; on a trouvé le signe d'affectation "="
  If Pos
    lenVal = Len(valeur) - Pos
    valA = Trim(Left(valeur, Pos-1))
    valB = Trim(Mid(valeur, Pos+1, lenVal))
  Else
    If pos_incr
      lenVal = Len(valeur) - Pos_incr
      valA = Trim(Left(valeur, Pos_incr-1))
    Else
      If pos_decr
        lenVal = Len(valeur) - Pos_decr
        valA = Trim(Left(valeur, Pos_decr-1))
      Else
      ; faire recherche sur +/- valeur
        If pos_add
          lenVal = Len(valeur) - Pos_add
          valA = Trim(Left(valeur, Pos_add-1))
          valB = Trim(Mid(valeur, Pos_add+1, lenVal))
        Else
          If pos_sub
            lenVal = Len(valeur) - Pos_sub
            valA = Trim(Left(valeur, Pos_sub-1))
            valB = Trim(Mid(valeur, Pos_sub+1, lenVal))
          Else
            _ERROR("",#ERR_STORE)
          EndIf
        EndIf
      EndIf
    EndIf
  EndIf
  
  If _Array(ValB,#_CHECK) = "True"            ; La valeur d'affectation est un tableau
    val_tmp = _Array(ValB, #_GET)
  Else
    If _GetTypeVar(ValB, -1) >= 0             ; La valeur d'affectation est une variable
      val_tmp = _GetValue(ValB, -1)
    Else
      val_tmp = ValB
    EndIf
  EndIf
  
  If _Array(ValA,#_CHECK) = "True"
    ; y-a-t'il une parenthèse ?
    result = FindString(valA,"(",1)
  
    ; oui !
    If result
      Pos_Gauche = result + 1
      result = FindString(valA,")",Pos_Gauche)
      If result
        Pos_Droite = result - 1
      Else
        _ERROR("",#ERR_NO_BRACKET)
      EndIf

      array_tab = Left(valeur,pos_gauche-2)
      If FindString(array_tab," ",1) 
        _ERROR("ARRAY:"+array_tab,#ERR_VAR_NOTFOUND)
      EndIf
      valeur_inside = Mid(valeur,pos_gauche,pos_droite-pos_gauche+1)
      
      If _GetTypeVar(Valeur_inside, -1) >=0   ;si valeur inside est une variable
        val_inside_tmp = _GetValue(Valeur_inside, -1)
      Else
        val_inside_tmp = Valeur_inside
      EndIf
    EndIf
    _StoreVar(array_tab, val_tmp, Val(val_inside_tmp))
  Else
  
;     MessageRequester("STORE","ValA ="+valA+" - Val_tmp = "+val_tmp)
    If pos_incr
      val_tmp = _GetValue(ValA, -1)
      ValINT = Val(val_tmp)
      valINT+1
      val_tmp = Str(valINT)
    Else
      If pos_decr
        val_tmp = _GetValue(ValA, -1)
        ValINT = Val(val_tmp)
        valINT-1
        val_tmp = Str(valINT)
      EndIf
    EndIf
    
    _StoreVar(ValA, val_tmp, -1)
  EndIf
    
EndProcedure

Procedure _StoreVar(varname.s, valeur.s, indice.l)
  If _GetTypeVar(varname, indice) = -1        ; verifie si la variable existe déjà
  							   		                        ; si = -1 pas trouvé donc on créer
    AddElement(The_Var())
    If _IsDigitOrChar(valeur) = #_INT
      The_Var()\_type = #_INT
    Else
      The_Var()\_type = #_CHAR
    EndIf
    The_Var()\_indice = indice
    The_Var()\_valeur = valeur
    The_Var()\_variable = UCase(varname)
    If indice >= 0                            ; initialise le tableau en faisant attention
                                              ; de vérifier de ne pas écraser les zones du
                                              ; tableau déjà initialisées
      val_tmp.l = The_Var()\_type
      For i = indice To 0 Step -1
        If _GetTypeVar(varname, i) = -1
          AddElement(The_Var())
          The_Var()\_type = val_tmp
          The_Var()\_indice = i
          Select val_tmp
            Case #_INT
              The_Var()\_valeur = "0"
            Case #_CHAR
              The_Var()\_valeur = ""
          EndSelect
          The_Var()\_variable = UCase(varname)
        EndIf
      Next i
    
    EndIf
  Else                                        ; Mettre à jour la valeur
    The_Var()\_valeur = valeur
    The_Var()\_indice = indice
  EndIf
  ; on trie par variable
  SortStructuredList(The_Var(), 0, OffsetOf(_VAR\_variable), #PB_Sort_String)
;   ; on trie par indice
;   SortStructuredList(The_Var(), 0, OffsetOf(_VAR\_indice), #PB_Sort_Long)
EndProcedure

Procedure.s _Array(valeur.s, type.l = #_CHECK)        ; ou #_GET
Protected result.l, ind.l, pos_gauche.l, pos_droite.l
Protected array_tab.s = "", valeur_inside.s = ""

  ; y-a-t'il une parenthèse ?
  result = FindString(valeur,"(",1)
  
  ; oui !
  If result
    Pos_Gauche = result + 1
    result = FindString(valeur,")",Pos_Gauche)
    If result
      Pos_Droite = result - 1
      If type = #_CHECK : ProcedureReturn "True" : EndIf
    Else
      _ERROR("",#ERR_NO_BRACKET)
    EndIf

    array_tab = Left(valeur,pos_gauche-2)
    If FindString(array_tab," ",1) 
      _ERROR("ARRAY:"+array_tab,#ERR_VAR_NOTFOUND)
    EndIf
    valeur_inside = Mid(valeur,pos_gauche,pos_droite-pos_gauche+1)
    
    ; MessageRequester("Tableau","Variable Tableau:["+array_tab+"]"+#CRLF$+"Valeur Inside:["+valeur_inside+"]")

    If _IsDigitOrChar(valeur_inside) = #_INT
      ind = Val(valeur_inside)
      ProcedureReturn _GetValue(array_tab, ind)
    Else
      ind = Val(_GetValue(valeur_inside, -1))
      If ind
        ProcedureReturn _GetValue(array_tab, ind)
      Else
        _ERROR("INDEX:"+valeur_inside,#ERR_VAR_NOTFOUND)
      EndIf
    EndIf
    
  EndIf
EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 58
; FirstLine = 52
; Folding = --
; DisableDebugger