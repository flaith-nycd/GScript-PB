;/****************************************************************************
;-*** Data
;/****************************************************************************
XIncludeFile "@Datasection.pb"

;/****************************************************************************
;-*** Defines & Declarations
;/****************************************************************************
XIncludeFile "@Defines.pb"
XIncludeFile "@Declare.pb"

;/****************************************************************************
;-*** Procedures diverses
;/****************************************************************************
IncludeFile "_Error.pb"
IncludeFile "_Stack.pb"
IncludeFile "_Check_division.pb"
IncludeFile "_Jump.pb"
IncludeFile "_If_compare.pb"
IncludeFile "_Var_Proc.pb"

;/****************************************************************************
;-*** Script & Lib
;/****************************************************************************
IncludeFile "_Load_library.pb"
IncludeFile "_Add_library.pb"
IncludeFile "_Check_LoadedLib.pb"
IncludeFile "_Seek_func.pb"
IncludeFile "_Load_script.pb"

;/****************************************************************************
;-*** Execution
;/****************************************************************************
IncludeFile "_Exec_line.pb"

;/****************************************************************************
;-*** Fin Procedure Execution
;/****************************************************************************
IncludeFile "_Run_script.pb"

;/****************************************************************************
;-*** Usage, Version & Licence
;/****************************************************************************
IncludeFile "Print_usage.pb"
IncludeFile "Print_version.pb"
IncludeFile "Print_licence.pb"

;/****************************************************************************
;-*** Lancement
;/****************************************************************************
IncludeFile "GET_Argv.pb"
IncludeFile "Main.pb"
IncludeFile "Init_Program.pb"
IncludeFile "End_Program.pb"

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 19
; Folding = -
; DisableDebugger