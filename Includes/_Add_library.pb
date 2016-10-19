Procedure _add_library(_lib.s)

  _TOTAL_LINES_LIB = _load_library(_lib)
  
  LoadedLib(indice_libloaded) = _lib
  indice_libloaded + 1
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 7
; Folding = -
; DisableDebugger