Procedure.l _jump(valeur.s)
Protected signe.s
Protected nb_lignes.l

	nb_lignes = Abs(Val(valeur))                ; Si pas func ABS, on conserve le signe,
	                                            ; faut pas conserver le signe

	signe = Left(_POP(),1)                      ; Recup du signe

  Select signe
    Case "-"
      _EIP_ - nb_lignes
	  Case "+"
	    _EIP_ + nb_lignes
	  Default
	    _ERROR("",#ERR_JUMP_SIGN)
	EndSelect

	If _EIP_ > _TOTAL_LINES
	  _ERROR("",#ERR_JUMP_SUP)
	EndIf
	If _EIP_ < 0
	  _ERROR("",#ERR_JUMP_ZERO)
	EndIf

 	_exec_line(_EIP_)
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 27
; Folding = -
; DisableDebugger