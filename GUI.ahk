global Win_Width := 1000
global Win_Height := 800

global Skill_Buttons := Map()

GetSkillNames(skillNameOnly := true) {
    SkillNames := []
    if (skillNameOnly) {
        loop files, Skill_Icons . "Disabled\*.*", "F" {
            cleanName := RegExReplace(A_LoopFileName, "^.*_|\.[^.]+$")
            Skillnames.Push(cleanName)
        }
        else {
            loop files, Skill_Icons . "Disabled\*.*", "F" {
                SkillNames.Push(A_LoopFilePath)
            }
        }
    }

    return SkillNames
}

global SkillNames := GetSkillNames()

Win := Gui("+Resize SysMenu", "DBG Util")
Win.IsOpen := false
Win.BackColor := "1e1e1e"
Win.SetFont("cFFFFFF s20", "Maple Mono")

width := 96
height := 96
cols := 4
for skill in SkillNames {
    i := A_Index - 1

    col := Mod(i, cols)
    row := Floor(i / cols)

    button := Win.Add("Picture", "x" . (width * col) . " y" . (height * row) . " w" . width . " h" .
    height, Skill_Icons . "Disabled\" . skill . ".png")

    button.OnEvent("Click", On_ButtonClick.Bind(skill))
    button.OnEvent("DoubleClick", On_ButtonClick.Bind(skill))

    Skill_Buttons[skill] := button
}

On_ButtonClick(clickedSkill, control, info) {
    if (Current_Skill == clickedSkill) {
        DisableSkill(clickedSkill)
    }
    else {
        if (Current_Skill != "None") {
            DisableSkill(Current_Skill)
        }
        EnableSkill(clickedSkill)
    }

    IniWrite(Current_Skill, ConfigFile, "State", "LastSkill")
    Info1.Text := "Enabled Skill: " . Current_Skill
}

DisableSkill(skill_name, updateCurrent := true) {
    Skill_Buttons[skill_name].Value := Skill_Icons . "Disabled\" . skill_name . ".png"
    if (updateCurrent) {
        global Current_Skill := "None"
    }
}

DisableAllSkills(updateCurrent := true) {
    for skill in SkillNames {
        Skill_Buttons[skill].Value := Skill_Icons . "Disabled\" . skill . ".png"
    }
    if (updateCurrent) {
        global Current_Skill := "None"
    }
}

EnableSkill(skill_name, updateCurrent := true) {
    Skill_Buttons[skill_name].Value := Skill_Icons . "Enabled\" . skill_name . ".png"
    if (UpdateCurrent) {
        global Current_Skill := skill_name
    }
}

EnableSkill(Current_Skill)

Info1 := Win.Add("Text", "x0 y+12 w400 h50 -Wrap", "Enabled Skill: " . Current_Skill)

ClickDelay := IniRead(ConfigFile, "State", "ClickDelay", ClickDelay_Default)

ClickDelay_Label := Win.Add("Text", "x0 y+20 w200 h40", "Click Delay:")
ClickDelay_Input := Win.Add("Edit", "x+0 yp w150 h40 -E0x200 Center -Tabstop", ClickDelay)
ClickDelay_Input.Opt("BackgroundBlack")
ClickDelay_Input.OnEvent("Change", OnChange_ClickDelay_Input)
ClickDelay_Input.OnEvent("LoseFocus", OnLoseFocus_ClickDelay_Input)

ClickDelay_UpDown := Win.Add("UpDown", "Range0-" . ClickDelay_Max . " 0x80", ClickDelay)
ClickDelay_Reset := Win.Add("Button", "x+0 w40 h40 -E0x200 -Border -Tabstop center", "⟳")
ClickDelay_Reset.OnEvent("Click", (*) => ClickDelay_Input.Value := ClickDelay_Default)

OnChange_ClickDelay_Input(con, *) {
    if (!IsNumber(con.Value)) {
        con.SetFont("cFFA500")
        return
    }

    parsed := Integer(con.Value || ClickDelay_Default)
    global ClickDelay := Clamp(parsed, 0, ClickDelay_Max)

    con.SetFont((parsed > ClickDelay_Max || parsed < 0) ? "cRed" : "cWhite")
    IniWrite(ClickDelay, ConfigFile, "State", "ClickDelay")
}

OnLoseFocus_ClickDelay_Input(con, *) {
    if (!IsNumber(con.Value) || con.Value > ClickDelay_Max || con.Value < 0) {
        con.SetFont("cWhite")
        con.Value := ClickDelay
    }
}

LoadDelay := IniRead(ConfigFile, "State", "LoadDelay", LoadDelay_Default)

LoadDelay_Label := Win.Add("Text", "x0 y+10 w200 h40", "Load Delay:")

LoadDelay_Input := Win.Add("Edit", "x+0 yp w150 h40 -E0x200 Center -Tabstop", LoadDelay)
LoadDelay_Input.Opt("BackgroundBlack")
LoadDelay_Input.OnEvent("Change", OnChange_LoadDelay_Input)
LoadDelay_Input.OnEvent("LoseFocus", OnLoseFocus_LoadDelay_Input)

LoadDelay_UpDown := Win.Add("UpDown", "Range0-" . LoadDelay_Max . " 0x80", LoadDelay)
LoadDelay_Reset := Win.Add("Button", "x+0 w40 h40 -E0x200 -Border -Tabstop center", "⟳")
LoadDelay_Reset.OnEvent("Click", (*) => LoadDelay_Input.Value := LoadDelay_Default)

OnChange_LoadDelay_Input(con, *) {
    if (!IsNumber(con.Value)) {
        con.SetFont("cFFA500")
        return
    }

    parsed := Integer(con.Value || LoadDelay_Default)
    global LoadDelay := Clamp(parsed, 0, LoadDelay_Max)

    con.SetFont((parsed > LoadDelay_Max || parsed < 0) ? "cRed" : "cWhite")
    IniWrite(LoadDelay, ConfigFile, "State", "LoadDelay")
}

OnLoseFocus_LoadDelay_Input(con, *) {
    if (!IsNumber(con.Value) || con.Value > LoadDelay_Max || con.Value < 0) {
        con.SetFont("cWhite")
        con.Value := LoadDelay
    }
}