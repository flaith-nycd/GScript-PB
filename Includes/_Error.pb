Procedure _BEEP()
	Beep_(#SonAigue, #Duree)
	Delay(15)
	Beep_(#SonGrave, #Duree*2)
EndProcedure

Procedure _ERROR(_error_.s, _num_error_.l)
Protected msg.s, _BUF.s
  
  Select _num_error_
	  Case #ERR_JUMP_SUP
	    msg = "Jump over maxline"
	  Case #ERR_JUMP_ZERO
	    msg = "Jump to line < 0"
	  Case #ERR_JUMP_SIGN
	    msg = "Jump without +/-"
	  Case #ERR_DIVISION
	    msg = "Division by zero"
	  Case #ERR_STORE
	    msg = "Store error"
	  Case #ERR_IF
	    msg = "If error"
	  Case #ERR_THEN_NOIF
	    msg = "Then without if"
	  Case #ERR_ELSE_NOTH
	    msg = "Else without then"
    Case #ERR_NO_BRACKET
	    msg = "Bracket is missing"
	  Case #ERR_STACK_OVER
	    msg = "Stack overflow"
	  Case #ERR_STACK_ZERO
	    msg = "Stack reached top"

	  Case #ERR_LOAD_SCR
	    msg = "Unable to load script "+#QUOTE+_error_+#QUOTE+"."
	  Case #ERR_RUN_SCR
	    msg = "Unable to run script "+#QUOTE+_error_+#QUOTE+"."
	  Case #ERR_LOAD_LIB
	    msg = "Unable to load library "+#QUOTE+_error_+#QUOTE+"."
	  Case #ERR_VAR_NOTFOUND
	    msg = #QUOTE+_error_+#QUOTE+": variable undeclared"
	  Case #ERR_FUNCTION
	    msg = #QUOTE+_error_+#QUOTE+": function undeclared"
	  Case #ERR_LIB_ALLREADY
	    msg = #QUOTE+_error_+#QUOTE+": library allready loaded"
	  Case #ERR_LIB_NOTLOADED
	    msg = "No library loaded for the function "+#QUOTE+_error_+#QUOTE
	  Default
	    msg = "Unknown Error line "+_error_
  EndSelect
  
  _BUF = msg

  _BEEP()

  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(#BROWN,0)
  CompilerEndIf
  Print("["+#PROGNAME+" ERROR] "+_SCRIPT_LOADED+".gs("+RSet(Str(_EIP_ + 1),5,"0")+"): ")
  
  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(14,0)
  CompilerEndIf
  PrintN("*** Err#"+RSet(Str(_num_error_),5,"0")+": "+_BUF+". ***")

  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(15,0)
  CompilerEndIf
  
  If _DEBUG = #True
  	WriteStringN(#fdebug, #PROGNAME+" v"+#VERSION+" >>> [ ERROR ] - "+_SCRIPT_LOADED+".gs("+RSet(Str(_EIP_ + 1),5,"0")+"): *** Err#"+RSet(Str(_num_error_),5,"0")+": "+_BUF+". ***")

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

	  CloseFile(#fdebug)
  EndIf

  
  End
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 85
; FirstLine = 42
; Folding = -
; DisableDebugger