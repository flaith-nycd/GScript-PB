Procedure.l _exec_line(numline.l)
Protected nb_len.l, flag_value.l = 0, flag_continous.l = 0, tmp_line.l = 0
Protected cmd.s = "", valeur.s = "", valeur_tmp.s = "", var.s = ""
Protected line.s = "", c.s
Protected cont.l = #False
  
  ; pour Debug
  Protected _BUF.s
  Protected tm_date.s, tm_hour.s
  ; **********
  
again:									                ; après une fonction

  Select _WHAT_TO_EXECUTE
    Case #EXEC_SCRIPT
      line = _script_line(numline)\_line
    Case #EXEC_LIB
      line = _library_line(numline)\_line
  EndSelect


;******  
Repeat
  Cont = #False                         ; on revient ici après un
										                    ; T(hen) ou E(lse)
;******

  line = Trim(line)
  nb_len = Len(line)

  If Mid(line,1,1) = "."
  	If Mid(line,2,1) <> "!"
	    cmd = Mid(line,2,1)
  	  If nb_len > 2
	  	  flag_value = 1                  ; il y a qqchose à afficher
		    valeur = Mid(line,4,nb_len)     ;	après .X<space>valeur
		    nb_len - 4                      ; Utile pour les print
	    Else 
	      flag_value = 0
	    EndIf
	  EndIf
	  If Mid(line,2,1) = "!"              ; Appel d'une fonction
	    cmd = Mid(line,2,1)
  	  valeur = Mid(line,3,nb_len-2)
  	EndIf
  Else 
    cmd = Left(line,1)
    If cmd = "!"                        ; Retour d'une Fonction
      If _FUNC_CALL > 0
        _EIP_ = Val(_POP()) + 1
        _FUNC_CALL - 1
        If _FUNC_CALL = 0
          _WHAT_TO_EXECUTE = #EXEC_SCRIPT
        EndIf
        numline = _EIP_
        Goto again                      ; Et on continue ...
      Else
        _WHAT_TO_EXECUTE = #EXEC_SCRIPT
      EndIf
    EndIf

  	; ***************************
  	; * Ici on indique que le   *
  	; * script est fini dès que *
  	; * l'on a "@@@@@"          *
  	; ***************************

  	If Left(line,5) = #END_SCRIPT
  	  PrintN("THE END FOLKS !!!")
  	  End
    EndIf

  	; ***************************
  EndIf
  
  ; Début Debug
  If _DEBUG = #True
    tm_date = FormatDate("%dd/%mm/%yy", Date())
    tm_hour = FormatDate("%hh:%ii", Date())
    tmp1$   = RSet(Str(_EIP_ + 1),5,"0")
    tmp2$   = RSet(Str(_KEY_),3,"0")
    ;tmp3$   = _script_line(_EIP_)\_line
	  ;_BUF = ">>>["+tm_date+"]-["+tm_hour+"]-["+_SCRIPT_LOADED+".gs]-EIP["+tmp1$+"]-KEY["+tmp2$+"]-["+tmp3$+"]"
	  _BUF = ">>>["+tm_date+"]-["+tm_hour+"]-["+_SCRIPT_LOADED+".gs]-EIP["+tmp1$+"]-KEY["+tmp2$+"]-CMD["+cmd+"]-VALUE["+Valeur+"]"
	  WriteStringN(#fdebug, _BUF)
  EndIf
  ; Fin Debug
  
  
  Select UCase(cmd)
 	  Case "C"    ;/* Clear Screen */
 		   ClearConsole()
	  Case "D"    ;/* Mode Debug ON/OFF */
		   If UCase(valeur) = "ON"  : _DEBUG = #True  : EndIf
		   If UCase(valeur) = "OFF" : _DEBUG = #False : EndIf
	  Case "G"    ;/* Go script */
		   _run_script(valeur)
  	Case "H"    ;/* HTab */
	  Case "I"    ;/* If */
		   _if_flag = #True

       _if_compare(valeur)

;        _then_flag = #True                     ; cas ou résultat du if est true
; 		   _else_flag = #False                    ; donc c'est "Then"
		   
;        _then_flag = #False                    ; cas ou résultat du if est false
; 		   _else_flag = #True                     ; donc c'est "Else"
		   
		   
	  Case "J"    ;/* Jump */
		   _PUSH(valeur)                          ; Obligatoire, car on récupère le signe
		   _jump(valeur)                          ; car possibilité de	.J +LL(5)
		   					                              ; ou 					        .J +7 
							                                ; ou        					.J -2
		   					                              ; ou encore	      		.J +L+L
	  Case "S"    ;/* Store val */
;  	     PrintN("Store Valeur : "+valeur)
       _Store(valeur)
	  Case "T"    ;/* THEN */
		   If _if_flag = #False And _then_flag = #False
		     _ERROR("",#ERR_THEN_NOIF)
		   EndIf

       If _then_flag = #True
         line = "."+valeur
		     _if_flag = #False
         cont = #True                         ; On refait un select avec nouvel valeur et cmd
       EndIf
	  Case "E"    ;/* Else */
		   If _then_flag = #False And _else_flag=#False
		     _ERROR("",#ERR_ELSE_NOTH)
		   EndIf

       If _else_flag = #True
         line = "."+valeur
         _then_flag = #False
         cont = #True                         ; On refait un select avec nouvel valeur et cmd
       EndIf
	  Case "P"    ;/* Print */
		   If Left(valeur,1) = #QUOTE             ; ya du texte (commence par ")
		   	 If flag_value			                  ; on est sur qu'il y en a
		   		 If Right(valeur,1) = ";"           ; il y a un ';' à la fin
		   			 flag_continous = 1               ; donc pas de saut de ligne
		   			 valeur = Mid(line,5,nb_len-1)
  		   	 Else                               ; on sélectionne entre les '"'
		   			 flag_continous = 0               ; on sélectionne entre les '"' aussi
		   			 valeur = Mid(line,5,nb_len)
		   		 EndIf
           If flag_continous
             Print(valeur)
		   	   Else 
		   	     PrintN(valeur)                   ; et on affiche
		   	   EndIf
		   	 Else 
		   	   PrintN("")                         ; sinon saut de ligne
		   	 EndIf
		   ; recherche une variable et l'affiche
		   ElseIf flag_value                      ; il n'y a pas de '"' mais qqchose
		   	 If Right(valeur,1) = ";"             ; kif kif, saut de ligne ?
		   	   flag_continous = 1                 ; yen a un donc pas de saut
		   		 valeur = Mid(line,4,nb_len)        ; nb_len déjà décrémenté
         Else
		   		 flag_continous = 0                 ; pas de saut
		   		 valeur = Mid(line,4,nb_len+1)      ; ajout de 1 car il n'y a pas de #QUOTE
		   	 EndIf
         		 	   
		 	   If valeur = "_VER_"                  ; affiche la version
		       print_version()
		     EndIf
		     
; 		     If valeur = "_KEY_"                  ; affiche la touche saisie
; 	   		   CompilerIf #__COLOR_ON__ = #True
; 				     ConsoleColor(#LIGHTGREEN,0)
;   			   CompilerEndIf
; ; 		   	   If _KEY_ > 32 And _KEY_ < 128
; ; 		   		   If flag_continous
; ; 		   			   Print("KC_" + UCase(Chr(_KEY_)))
; ; 		   		   Else 
; ; 		   			   PrintN("KC_" + UCase(Chr(_KEY_)))
; ; 		   		   EndIf
; ; 		   	   ElseIf flag_continous
;            If flag_continous
; 		   		   Print("KA_" + RSet(Str(_KEY_),3,"0"))
; 		   		 Else 
; 		   		   PrintN("KA_" + RSet(Str(_KEY_),3,"0"))
; 		   	   EndIf
; 		     EndIf

		   	 ; On ckeck les variables définies
		   	 ; et on les affiche si on les trouve
		   	 If _Array(valeur,#_CHECK) = "True"
           Var = _Array(valeur,#_GET)
         Else
           Var = _GetValue(Valeur, -1)
           If Var = "NOTHING"
             _ERROR("VAR:"+Valeur,#ERR_VAR_NOTFOUND)
           EndIf
         EndIf
		   	 If var
		   	   If flag_continous
		   	     Print(var)
		   	   Else
		   	     PrintN(var)
		   	   EndIf
		   	 EndIf

         ;****
         
		   Else                                   ; sinon du elseif flag_value = 1
		     PrintN("")
		   EndIf
	   	 
	   	 CompilerIf #__COLOR_ON__ = #True
    		 ConsoleColor(15,0)
		   CompilerEndIf
	  Case "V"    ;/* VTab */
	     ;; on check que valeur est bien un chiffre
	     ;; ou une variable definie, puis :
	     ; i = 0
	   	 ; var = _GetValue(Valeur, -1)
	   	 ; if not var
	   	 ;   if _IsDigitOrChar(valeur) = #_INT
	   	 ;     i = val(valeur)
	   	 ;   else
	   	 ;     _ERROR(valeur,#ERR_VAR_NOTDIGIT)
	   	 ;   endif
	   	 ; else
	   	 ;   i = val(var)
	   	 ; endif
	   	 ; if i
	   	 ;   for t = 1 to i : printn("") : next t
	   	 ; endif
	  Case "W"    ;/* Wait */
		   If flag_value = 1
			   valeur = Mid(line,5,nb_len)
			   Print(valeur)
		   EndIf
		   Repeat
		     c = Inkey()
		     _KEY_ = RawKey()                     ; on conserve la clé dans une var
		   Until c <> ""
		   _Store("_KEY_ = "+"KA_"+RSet(Str(_KEY_),3,"0"))
		   PrintN("")
		Case "$"                                  ; include file lib
		   If Not _check_LoadedLib(valeur)        ; Verif si la lib est déjà chargé
		     _add_Library(valeur)
		   Else
		     _ERROR(valeur,#ERR_LIB_ALLREADY)
		   EndIf
		Case "'"                            	    ; rien c'est un commentaire
		
		
		Case "!"                                  ; appel d'une fonction
		   If _TOTAL_LINES_LIB > 0
		     _FUNC_CALL + 1
	       _PUSH(Str(_EIP_))                    ; Sauvegarde du point d'appel du script
	       _WHAT_TO_EXECUTE = #EXEC_LIB         ; On va maintenant executer dans la librarie
	       tmp_line = _seek_func(valeur)
	       If tmp_line
	         _EIP_ = tmp_line
	         _exec_line(_EIP_)
	       Else
	         _ERROR(valeur,#ERR_FUNCTION)
	       EndIf
	     Else
	       _ERROR(valeur,#ERR_LIB_NOTLOADED)
	     EndIf

    Case "_"	     
       ; on trie par indice
       SortStructuredList(The_Var(), 0, OffsetOf(_VAR\_indice), #PB_Sort_Long)
  	
       WriteStringN(#fdebug,"- VAR ---------!- VAL ---------!- INDEX -!- TYPE -")
       ForEach The_Var()
         WriteString(#fdebug," "+LSet(The_Var()\_variable,13," ")+" ! ")
         WriteString(#fdebug,LSet(The_Var()\_valeur,13," ")+" ! ")
         WriteString(#fdebug,LSet(Str(The_Var()\_indice),7," ")+" ! ")
  
         Select The_Var()\_type
           Case 0
             WriteStringN(#fdebug,"INT")
           Case 1
             WriteStringN(#fdebug,"CHAR")
         EndSelect

       Next
;        ; on trie par indice
;        SortStructuredList(The_Var(), 0, OffsetOf(_VAR\_indice), #PB_Sort_Long)
;        PrintN("- VAR ---------!- VAL ---------!- INDEX -!- TYPE -")
;        ForEach The_Var()
;          Print(" "+LSet(The_Var()\_variable,13," ")+" ! ")
;          Print(LSet(The_Var()\_valeur,13," ")+" ! ")
; 
;          Print(LSet(Str(The_Var()\_indice),7," ")+" ! ")
; 
;          Select The_Var()\_type
;            Case 0
;              PrintN("INT")
;            Case 1
;              PrintN("CHAR")
;          EndSelect
;        Next

		Default
		   _ERROR(Str(_EIP_+1),99999)             ; 99999 car n'exite pas donc erreur par défaut
  EndSelect
Until Not cont
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 94
; FirstLine = 63
; Folding = -
; DisableDebugger