#NoEnv
#Persistent
#SingleInstance Force
SetBatchLines, -1
#Include Class_ImageButton.ahk

global PBM_SETSTATE          := WM_USER + 16
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
global PBS_VERTICAL          := 0x00000004
global PBST_NORMAL           := 0x00000001
global PBST_ERROR            := 0x00000002
global PBST_PAUSE            := 0x00000003
global STAP_ALLOW_NONCLIENT  := 0x00000001
global STAP_ALLOW_CONTROLS   := 0x00000002
global STAP_ALLOW_WEBCONTENT := 0x00000004
global WM_THEMECHANGED       := 0x0000031A

; ----------------------------------------------------------------------------------------------------------------------
Gui, DummyGUI:Add, Pic, hwndHPIC, PIC1.jpg
SendMessage, 0x0173, 0, 0, , ahk_id %HPIC% ; STM_GETIMAGE
HPIC1 := ErrorLevel
; ----------------------------------------------------------------------------------------------------------------------

;Big font
Gui, Font, s18

;Name labels
Gui, Add, Text,, Name1:
Gui, Add, Text,, Name2:
Gui, Add, Text,, Name3:
Gui, Add, Text,, Name4:
Gui, Add, Text,, Name5:
;Gui, Add, Text,, Name6:
;Gui, Add, Text,, Name7:

;Name Text Boxes
Gui, Add, Edit, vName1 ym  ; The ym option starts a new column of controls.
Gui, Add, Edit, vName2
Gui, Add, Edit, vName3
Gui, Add, Edit, vName4
Gui, Add, Edit, vName5
;Gui, Add, Edit, vName6
;Gui, Add, Edit, vName7

;Default Names (Rome)
GuiControl,, Name1, Bobby
GuiControl,, Name2, Jimmy
GuiControl,, Name3, Stewart
GuiControl,, Name4, Phillip
GuiControl,, Name5, Susan
;GuiControl,, Name6,	McKenzie
;GuiControl,, Name7, Peggie

;Add the GO button, no need for exit button (window X can be used)
;Gui, Add, Button, default w250, GO    ;The label ButtonOK (if it exists) will be run when the button is pressed.

Gui, Add, Button, vBT1 w200 hwndHBT1, GO
Opt1 := [0, 0x80CF0000, , "White", "H", , "Red", 4]         ; normal flat background & text color
Opt2 := [ , "Red"]                                          ; hot flat background color
Opt5 := [ , , ,"Gray"]                                      ; defaulted text color -> animation
If !ImageButton.Create(HBT1, Opt1, Opt2, , , Opt5)
   MsgBox, 0, ImageButton Error Btn1, % ImageButton.LastError

;Gui, Add, Button, default, EXIT 
Gui, Show,, Name Temp1at0r 3000
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
;ButtonExit:
ExitApp
ButtonGO:
Gui, Submit, NoHide  ; Save the input from the user to each control's associated variable.
;MsgBox You entered "%Name1% %Name2%".


FileRead, TheText, template.svg
StringReplace, TheText, TheText, $1, %Name1%, All
StringReplace, TheText, TheText, $2, %Name2%, All
StringReplace, TheText, TheText, $3, %Name3%, All
StringReplace, TheText, TheText, $4, %Name4%, All
StringReplace, TheText, TheText, $5, %Name5%, All
;StringReplace, TheText, TheText, $6, %Name6%, All
;StringReplace, TheText, TheText, $7, %Name7%, All
FileDelete, work.svg
FileAppend, %TheText%, work.svg

;Bring window to the front
WinActivate K40 Whisperer
Sleep 500

;Hide the wrong laser buttons
GuiControl, Hide, Button18

;Click refresh design file
WinActivate K40 Whisperer ;else a double click on the go buttons breaks it
MouseMove, 193, 138, K40 Whisperer

;this works
WinActivate K40 Whisperer ;else a double click on the go buttons breaks it
MouseClick, left, 193, 138, K40 Whisperer

;x298 y597 #CCCCCC

;attempts to make sexy progress bars failed, using normal boringones
;Gui, 2:+AlwaysOnTop
;Gui, 2:-Caption
;Gui, 2:Add, Progress, w300 h20 hwndMARQ4 -%PBS_SMOOTH% +%PBS_MARQUEE%, 50
;DllCall("User32.dll\SendMessage", "Ptr", MARQ4, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)

;Gui, 2:Add, Progress, w300 h40 BackgroundC9C9C9 hwndMARQ1 +%PBS_MARQUEE%, 50
;DllCall("User32.dll\SendMessage", "Ptr", MARQ1, "Int", PBM_SETMARQUEE, "Ptr", 1, "Ptr", 50)
;Gui, 2:Show, AutoSize

Progress, b w400 h80,Flubbing Dubbers...,Please Wait, 
Progress, 99.9

Sleep, 500

Loop
{	
	Sleep, 50
	WinActivate K40 Whisperer ;else a double click on the go buttons breaks it
	PixelGetColor, Color, 298, 507

	if Color = 0xCCCCCC
	{		 
	} 
	else {
		Progress Off
		break
	}
}

;None of these work :(
;ControlFocus, Button14, ahk_class TkTopLevel ; Focus on the control
;ControlSend, Button14, {enter}, K40 Whisperer

;ControlFocus, Button14, ahk_class TkTopLevel ; Focus on the control
;ControlClick, Button14, ahk_class TkTopLevel ; Click the control

;ControlClick, Button14, K40 Whisperer  ;WTFF 
;ControlClick, Button14                 ;WTFF WHY
;ControlClick, X193 Y138, K40 Whisperer ;WTFF OMFG WHYY


;Sleep and Click raster engrave (start lasererering)
;Sleep 7500
;MouseMove, 81, 824
;MouseClick, left, 81, 824