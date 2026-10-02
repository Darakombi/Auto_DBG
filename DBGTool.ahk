#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Global.ahk
#Include Helper.ahk
#Include ScreenMap.ahk
#Include MacroMap.ahk
#Include Macros.ahk
#Include Overlay.ahk
#Include ScreenDetect.ahk


; Misc
!F1:: ShowMousePos()
!F2:: ShowFocusedWindow()
; ^x::

#HotIf InEmulator() || InEditor() || InOverlay()
; Script related
^s:: Reload()
^q:: ToggleOverlay()

#HotIf InEmulator()
; Rewind
^1:: Rewind(ClickDeathMenuReturn,, AltTab)
^2:: Rewind(ClickWinMenuReturn,, AltTab)
^3:: Rewind(PauseReturn,, AltTab)

; Rewind from main menu
^r:: Rewind(,, AltTab)
; !+r:: PreRebirthCampaign()

; Navigation
^c:: Campaign()
!^2:: PauseRestart()
!^3:: PauseReturn

^f:: RebirthOverviewFlashbacks()
+f:: CampaignRebirthOverviewFlashbacks()

#HotIf InEditor()

#HotIf InOverlay()