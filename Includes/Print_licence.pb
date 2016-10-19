Procedure print_licence()
  CompilerIf #__COLOR_ON__ = #True
    ConsoleColor(#BROWN,0)
  CompilerEndIf
  
  Print(Chr(218)):For i = 1 To 69:Print(Chr(196)):Next i:PrintN(Chr(191))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" Copyright (c) 2006-2007 by Flaith (Nicolas Djurovic)              "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" This software is provided 'as-is', without any express or implied "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" warranty. In no event will the author be held liable for any      "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" damages arising from the use of this software.                    "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" Permission is granted to anyone to use this software for any      "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" purpose, including commercial applications, and to alter it and   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print(" redistribute it freely, subject to the following restrictions:    "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("     1. The origin of this software must not be misrepresented;    "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        you must not claim that you wrote the original software.   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        If you use this software in a product, an acknowledgment   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        in the product documentation would be appreciated but is   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        not required.                                              "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("     2. Altered source versions must be plainly marked as such,    "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        and must not be misrepresented as being the original       "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        software.                                                  "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("     3. This notice may not be removed or altered from any source  "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("        distribution.                                              "):PrintN(" "+Chr(179))
  Print(Chr(179)+" "):Print("                                                                   "):PrintN(" "+Chr(179))
  Print(Chr(192)):For i = 1 To 69:Print(Chr(196)):Next i:PrintN(Chr(217))

  CompilerIf #__COLOR_ON__ = #True
  	ConsoleColor(15,0)
  CompilerEndIf
EndProcedure

; IDE Options = PureBasic v4.02 (Windows - x86)
; CursorPosition = 7
; Folding = -
; DisableDebugger