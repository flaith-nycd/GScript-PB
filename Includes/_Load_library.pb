Procedure.l _load_library(_lib.s)
Protected ligne.s, lib_file.s
Protected numligne.l = 0, fl.l

  numligne = _TOTAL_LINES_LIB           ; on récupère la fin pour ajout
  lib_file = _lib + ".gsi"

  fl = ReadFile(#flibrary,lib_file)

  If fl
    While Eof(#flibrary) = 0            ; Tant que la 'fin de fichier' n'est pas atteinte
      ligne = ReadString(#flibrary)
	  	_library_line(numligne)\_num = numligne
		  _library_line(numligne)\_line = ligne
		  a$ = Left(ligne,1)
		  b$ = Left(ligne,2)
		  If a$ = "!" And b$ <> "!!"              ; On ajoute la liste des fonctions dans une
		    AddElement(The_Function())            ; liste chainée pour ensuite permettre une
        The_Function()\_line = numligne+1     ; recherche rapide d'une fonction lorsque
        The_Function()\_name = Mid(ligne,2,4) ; celle-ci sera appelée
                                              ; NB: numligne+1 car la fonction commence à
                                              ; la ligne du dessous
        ; *************************
        If _Function_file = #True
          WriteStringN(#TMP_FILE, The_Function()\_name + RSet(Str(The_Function()\_line),5,"0"))
        EndIf
        ; *************************
        
		  EndIf
		  numligne+1
		Wend
	Else
	  _ERROR(_lib, #ERR_LOAD_LIB)
	EndIf

	CloseFile(#flibrary)
	ProcedureReturn numligne              ; -1
EndProcedure

; IDE Options = PureBasic v4.01 (Windows - x86)
; CursorPosition = 27
; Folding = -
; DisableDebugger