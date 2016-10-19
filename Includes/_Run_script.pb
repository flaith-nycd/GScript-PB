Procedure _run_script(name_script.s)
Protected i.l = 0, nb_line_script.l
  
  nb_line_script = _load_script(name_script)
  
 	_EIP_ = 0
;  	While i < nb_line_script
;  		_exec_line(_EIP_)
;  		_EIP_ + 1
;  		i = _EIP_
;  	Wend
 	Repeat
 		_exec_line(_EIP_)
 		_EIP_ + 1
  ForEver
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; Folding = -
; DisableDebugger