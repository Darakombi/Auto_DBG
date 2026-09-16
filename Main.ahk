#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Global.ahk
#Include Helper.ahk
#Include Layout.ahk
#Include Navigation.ahk
#Include GUI.ahk


!1:: GetMouse()
!2:: GetFocusedWindow()

^q:: {
    if (Win.IsOpen) {
        Win.Hide()
        Win.IsOpen := false
    }
    else {
        Win.Show("x300 y150 w" . Win_Width . " h" . Win_Height)
        Win.IsOpen := true
    }
}


^1:: Rewind(Do_Death_Return)
^2:: Rewind(Do_Win_Return)
^3:: Rewind(Do_Pause_Return)
^4:: Rebirth_Skill_Post_Campaign()
^5:: EnterCampaign()

; ^+1:: Do_Death_Restart()
^+2:: Do_Pause_Restart()
^+3:: Do_Pause_Return()

^s:: Reload
