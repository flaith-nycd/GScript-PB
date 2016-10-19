;/****************************************************************************
;-*** General Define
;/****************************************************************************
#PROGNAME     = "PBGscript"
#VERSION      = "1.3.2"
#DATE_VERSION = "(200705.140407)"             ; 1ere version - dernière version

#BROWN        = 6
#LIGHTGREEN   = 10

#CRLF         = Chr(13) + Chr(10)
#QUOTE        = Chr(34)
#SonAigue     = 250
#SonGrave     = 150
#Duree        = 100

#__COLOR_ON__ = #True                         ; Certains affichages en couleur ou non

#MAX_CMP      = 5                             ; 6 comparaisons maxi
#MAX_CALC     = 3                             ; 4 fonctions arithmétiques
#STACKMAX     = 256                           ; nb max stack
#LONGMAX      = 80                            ; nb max char by line
#LINEMAX      = 10000                         ; nb line max
#LIBMAX       = 20                            ; nb max library to load
#END_SCRIPT   = "@@@@@"                       ; End of a script

;/****************************************************************************
;-*** Files Define
;/****************************************************************************
Enumeration
  #fdebug
  #flibrary
  #fscript
  #TMP_FILE
EndEnumeration

Enumeration
  #EXEC_SCRIPT
  #EXEC_LIB
EndEnumeration

;/****************************************************************************
;-*** Errors,Types,Etc... Define
;/****************************************************************************
;-> Var types
#_INT         = 0
#_CHAR        = 1
#_HEX         = 2
#_BIN         = 3

;-> Array
#_CHECK       = 0
#_GET         = 1

; #INF          = 1
; #SUP          = 2
; #EQU          = 3
; #DIF          = 4

;-> Errors
Enumeration 101
  #ERR_JUMP_SUP                         ; jump To long (> _TOTAL_LINES)
  #ERR_JUMP_ZERO
  #ERR_JUMP_SIGN
  #ERR_DIVISION
  #ERR_IF
  #ERR_THEN_NOIF
  #ERR_ELSE_NOTH
  #ERR_NO_BRACKET
  #ERR_STORE
  #ERR_STACK_OVER
  #ERR_STACK_ZERO
EndEnumeration

Enumeration 501
  #ERR_LOAD_SCR                         ; unable To load script
  #ERR_RUN_SCR                          ; unable To run script
  #ERR_FUNCTION                         ; Function Not found
  #ERR_VAR_NOTFOUND                     ; Var Not found
  #ERR_VAR_NOTDIGIT                     ; Var is not a digit
  #ERR_LOAD_LIB                         ; unable to load library
  #ERR_LIB_ALLREADY                     ; Lib allready loaded
  #ERR_LIB_NOTLOADED                    ; Lib not loaded
EndEnumeration

;/****************************************************************************
;-*** Structures
;/****************************************************************************
Structure _LINE
	_num.l
	_line.s                               ;[#LONGMAX]
EndStructure

Structure _STA
	_val.s
EndStructure

Structure _VAR
	_variable.s                           ;[#LONGMAX]
	_valeur.s                             ;[#LONGMAX]
	_indice.l                             ; cas ou il y a un tableau, sinon tjrs à -1
	_type.l                               ; 0:int, 1:char
EndStructure

Structure _FONCTION
	_line.l
	_name.s
EndStructure

Global NewList The_Function._FONCTION()
Global NewList The_Var._VAR()

Global Dim	_script_line._LINE(#LINEMAX)
Global Dim	_library_line._LINE(#LINEMAX)

;-> STACK
Global Dim _STACK._STA(#STACKMAX)       ; conserve adr (numligne) lors
	   									                  ; d'appel à des fonctions ou lors
										                    ; de jump (+/- nbligne)
Global Dim _STACK_LIB._STA(#STACKMAX)

;/****************************************************************************
;-*** Global variables
;/****************************************************************************
;-> Arguments
Global Dim argv.s(15)
Global Dim _CMP.s(#MAX_CMP)
Global Dim _CALC.s(#MAX_CALC)

;-> For lib & script
Global _WHAT_TO_EXECUTE.l = #EXEC_SCRIPT
Global _FUNC_CALL.l       = 0
Global _EIP_.l            = 0           ; Instruction en cours d'execution
Global _KEY_.l
Global _POS_STACK.l	      = 0           ; ligne du stack : augmente/diminue
					  					                  ; si PUSH/POP
Global _SCRIPT_LOADED.s
Global _TOTAL_LINES.l     = 0           ; Nbre total de ligne dans le script
					  					                  ; en cours
Global _fonction_flag.l   = 0

;-> Library
Global _TOTAL_LINES_LIB.l = 0
Global _EIP_LIB_.l        = 0
Global _POS_STACK_LIB.l   = 0
Global _TOTAL_LINES_LIB.l = 0

Global Dim LoadedLib.s(#LIBMAX)         ; Max #LIBMAX Libs
Global indice_libloaded.l = 0

;-> FLAGS
Global _DEBUG.l           = #False
Global _Function_file     = #False
Global _if_flag.l         = #False
Global _then_flag.l       = #False
Global _else_flag.l       = #False

; IDE Options = PureBasic v4.02 (Windows - x86)
; Folding = -
; DisableDebugger