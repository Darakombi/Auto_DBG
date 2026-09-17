#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Global.ahk
#Include Helper.ahk
#Include ScreenMap.ahk
#Include Macros.ahk
#Include Interface.ahk


; Misc
!F1:: ShowMousePos()
!F2:: ShowFocusedWindow()

#HotIf InEmulator() || InEditor() || InInterface()
; Script related
^s:: Reload
^q:: ToggleInterface()
; ^x:: 

#HotIf InEmulator()
; Rewind from gamemode
^1:: FullRewind(ClickDeathMenuReturn)
^2:: FullRewind(ClickWinMenuReturn)
^3:: FullRewind(PauseReturn)

+1:: NoSkillRewind(ClickDeathMenuReturn)
+2:: NoSkillRewind(ClickWinMenuReturn)
+3:: NoSkillRewind(PauseReturn)

!1:: NoPostRewind(ClickDeathMenuReturn)
!2:: NoPostRewind(ClickWinMenuReturn)
!3:: NoPostRewind(PauseReturn)

!+1:: NoPostRewind(ClickDeathMenuReturn)
!+2:: NoPostRewind(ClickWinMenuReturn)
!+3:: NoPostRewind(PauseReturn)

; Rewind from main menu
^r:: PreRebirthSkillPostCampaign()
+r:: PreRebirthPostCampaign()
!r:: PreRebirthSkillCampaign()
!+r:: PreRebirthCampaign()

; Navigation
^c:: Campaign()
!^2:: PauseRestart()
!^3:: PauseReturn()

^f:: RebirthOverviewFlashbacks()
+f:: CampaignRebirthOverviewFlashbacks()

#HotIf InEditor()

#HotIf InInterface()