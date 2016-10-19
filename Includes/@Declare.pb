;/****************************************************************************
;-*** Déclarations
;/****************************************************************************
Declare _BEEP()
Declare _ERROR(_error_.s, _num_error_.l)
Declare _PUSH(_valstack.s)
Declare.s _POP()
Declare.l _check_division(val.d)
Declare.l _jump(valeur.s)
Declare.l _if_compare(valeur.s)
Declare _Store(Valeur.s)
Declare _StoreVar(varname.s, valeur.s, indice.l)
Declare.s _GetValue(valeur.s, indice.l)
Declare.l _IsDigitOrChar(valeur.s)
Declare.l _GetTypeVar(valeur.s, indice.l)
Declare.s _Array(valeur.s, type.l = #_CHECK)
Declare.l _load_library(_lib.s)
Declare _add_library(_lib.s)
Declare.l _check_LoadedLib(_lib.s)
Declare.l _seek_func(_func.s)
Declare.l _load_script(_script.s)
Declare _run_script(name_script.s)
Declare.l _exec_line(numline.l)
Declare print_usage()
Declare print_version()
Declare print_licence()
Declare GET_Argv()
Declare Init_Program()
Declare Main()
Declare End_Program()

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 15
; Folding = -
; DisableDebugger