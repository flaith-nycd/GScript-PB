Procedure _PUSH(_valstack.s)
	_STACK(_POS_STACK)\_val = _valstack
	_POS_STACK+1
; 	PrintN("--PUSH : pos_stack = "+Str(_POS_STACK))
	If _POS_STACK > #STACKMAX
	  _ERROR("",#ERR_STACK_OVER)
	EndIf
EndProcedure

Procedure.s _POP()
	_POS_STACK-1
	If _POS_STACK < 0
	  _ERROR("",#ERR_STACK_ZERO)
	Else 
;    	PrintN("---POP : pos_stack = "+Str(_POS_STACK))
	  ProcedureReturn _STACK(_POS_STACK)\_val
	EndIf
EndProcedure
; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 17
; Folding = -
; DisableDebugger