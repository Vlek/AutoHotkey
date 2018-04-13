; Copy/paste juggler
; A utility script for the clipboard that makes it more useful for 
; bouncing around several different copies at a time without having
; to re-copy each and every time. Using the macros Ctrl + Q / Ctrl + W,
; it's able to toggle between the saved past copied items.

pastes := []
clipboardIndex := 0

doCleanup() {
	if (pastes.length() > 25) {
		pastes.RemoveAt(0)
	}
}

; TODO: Consider having a double-tap rule that goes to the very end or 
; beginning of the pastes list depending on which macro is pressed
^q::
if (clipboardIndex > 1) {
	clipboardIndex--
	clipboard := pastes[clipboardIndex]
}
return

^w::
if (clipboardIndex < pastes.length()) {
	clipboardIndex++
	clipboard := pastes[clipboardIndex]
}
return

; TODO: Consider instead listening to the clipboard change event (if there is one)
; and having this portion of the script work off of that instead so that it works
; even with programs that directly manipulate the clipboard.
$^c::
; TODO: Consider iterating through pastes to see if the new value isn't already
; in our list. If that's the case, we can update the clipboardIndex var to that
; and change our clipboard without messing with pastes at all. May save memory
; at the expense of some processing speed*.
Send, ^c
pastes.Push(clipboard)
clipboardIndex := pastes.length()
doCleanup()
return
