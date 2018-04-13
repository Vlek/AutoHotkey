;By Vlek
;Useful information:
; #: Windows key, !: Alt, ^:Control, +:Shift, &:Combination of two hotkeys
; 'n: Enter, 't: Tab, http://www.autohotkey.com/docs/KeyList.htm

; --------------- Functions --------------

clipsend(statement){
  ; hijacks the clipboard, prints statement, and resets the clipboard
  OldClipboard := Clipboard
  clipboard := statement
  Sleep 75
  Send ^v
  clipboard := Oldclipboard
  OldClipboard := ""
  return
}

; -------------- Programs ------------

^!n::
  ; Start Notepad++
  Run, C:\Program Files (x86)\Notepad++\notepad++.exe
return

^!t::
  ; Run ubuntu shell
  Run, C:\Users\Vlek\AppData\Local\Microsoft\WindowsApps\ubuntu.exe
return

^#t::
  ; Run console
  IfWinExist C:\WINDOWS\system32\cmd.exe
    WinActivate
  else
    Run, cmd /K "cd /d C:\Windows\System32\"
return

^!w::
  IfWinExist Microsoft Word
    WinActivate
  else
    Run,C:\Program Files\Microsoft Office\Office12\winword.exe
return

^!e::
  run explorer.exe /root`,C:\`
return

; --------------- Macros --------------

; ---- Misc ----

#q::
  Shutdown,5
return

#x::
  ; Alt+F4's
  WinGetTitle,Title,A
  WinClose, %Title%
  ;Send !{F4}
return

^Space::
  Suspend
return

^+r::
  Reload
return

^=::
  Run, C:\Program Files (x86)\Notepad++\notepad++.exe %A_ScriptFullPath%
return

^l::
  Send ^c
  Sleep, 100
  Run www.dictionary.com/browse/%clipboard%
return
