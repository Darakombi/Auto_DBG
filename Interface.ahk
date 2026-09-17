global Interface_Width := 1000
global Interface_Height := 800

global Skill_Buttons := Map()

GetSkillNames(skillNameOnly := true) {
    SkillNames := []
    if (skillNameOnly) {
        loop files, SkillIconsPath . "Disabled\*.*", "F" {
            cleanName := RegExReplace(A_LoopFileName, "^.*_|\.[^.]+$")
            Skillnames.Push(cleanName)
        }
        else {
            loop files, SkillIconsPath . "Disabled\*.*", "F" {
                SkillNames.Push(A_LoopFilePath)
            }
        }
    }

    return SkillNames
}

global SkillNames := GetSkillNames()

Interface := Gui("+Resize SysMenu", "Auto DBG Interface")
Interface.IsOpen := false
Interface.BackColor := "1e1e1e"
Interface.SetFont("cFFFFFF s20", "Maple Mono")

width := 96
height := 96
cols := 4
for skillName in SkillNames {
    i := A_Index - 1

    col := Mod(i, cols)
    row := Floor(i / cols)

    skillIcon := Interface.Add("Picture", "x" . (width * col) . " y" . (height * row) . " w" . width . " h" .
    height, SkillIconsPath . "Disabled\" . skillName . ".png")

    skillIcon.OnEvent("Click", OnSkillIconClick.Bind(skillName))
    skillIcon.OnEvent("DoubleClick", OnSkillIconClick.Bind(skillName))

    Skill_Buttons[skillName] := skillIcon
}

OnSkillIconClick(clickedSkill, control, info) {
    if (CurrentSkill == clickedSkill) {
        DisableSkill(clickedSkill)
    }
    else {
        if (CurrentSkill != "None") {
            DisableSkill(CurrentSkill)
        }
        EnableSkill(clickedSkill)
    }

    IniWrite(CurrentSkill, ConfigFilePath, "State", "LastSkill")
    Info1.Text := "Enabled Skill: " . CurrentSkill
}

DisableSkill(skillName, updateCurrent := true) {
    Skill_Buttons[skillName].Value := SkillIconsPath . "Disabled\" . skillName . ".png"
    if (updateCurrent) {
        global CurrentSkill := "None"
    }
}

DisableAllSkills(updateCurrent := true) {
    for skill in SkillNames {
        Skill_Buttons[skill].Value := SkillIconsPath . "Disabled\" . skill . ".png"
    }
    if (updateCurrent) {
        global CurrentSkill := "None"
    }
}

EnableSkill(skillName, updateCurrent := true) {
    if (skillName != "None") {
        Skill_Buttons[skillName].Value := SkillIconsPath . "Enabled\" . skillName . ".png"
    }
    if (UpdateCurrent) {
        global CurrentSkill := skillName
    }
}

EnableSkill(CurrentSkill)

Info1 := Interface.Add("Text", "x0 y+12 w400 h50 -Wrap", "Enabled Skill: " . CurrentSkill)

ClickDelay := IniRead(ConfigFilePath, "State", "ClickDelay", ClickDelayDefault)

ClickDelayLabel := Interface.Add("Text", "x0 y+20 w200 h40", "Click Delay:")
ClickDelayInput := Interface.Add("Edit", "x+0 yp w150 h40 -E0x200 Center -Tabstop", ClickDelay)
ClickDelayInput.Opt("BackgroundBlack")
ClickDelayInput.OnEvent("Change", OnClickDelayInputChange)
ClickDelayInput.OnEvent("LoseFocus", OnClickDelayInputLoseFocus)

ClickDelayUpDown := Interface.Add("UpDown", "Range0-" . ClickDelayMax . " 0x80", ClickDelay)
ClickDelayReset := Interface.Add("Button", "x+0 w40 h40 -E0x200 -Border -Tabstop center", "⟳")
ClickDelayReset.OnEvent("Click", (*) => (ClickDelayInput.Value := ClickDelayDefault, OnClickDelayInputChange(
    ClickDelayInput)))
OnClickDelayInputChange(con, *) {
    if (!IsNumber(con.Value)) {
        con.SetFont("cFFA500")
        return
    }

    parsed := Integer(con.Value || ClickDelayDefault)
    global ClickDelay := Clamp(parsed, 0, ClickDelayMax)

    con.SetFont((parsed > ClickDelayMax || parsed < 0) ? "cRed" : "cWhite")
    IniWrite(ClickDelay, ConfigFilePath, "State", "ClickDelay")
}

OnClickDelayInputLoseFocus(con, *) {
    if (!IsNumber(con.Value) || con.Value > ClickDelayMax || con.Value < 0) {
        con.SetFont("cWhite")
        con.Value := ClickDelay
    }
}

LoadDelay := IniRead(ConfigFilePath, "State", "LoadDelay", LoadDelayDefault)

LoadDelayLabel := Interface.Add("Text", "x0 y+10 w200 h40", "Load Delay:")

LoadDelayInput := Interface.Add("Edit", "x+0 yp w150 h40 -E0x200 Center -Tabstop", LoadDelay)
LoadDelayInput.Opt("BackgroundBlack")
LoadDelayInput.OnEvent("Change", OnLoadDelayInputChange)
LoadDelayInput.OnEvent("LoseFocus", OnLoadDelayInputLoseFous)

LoadDelayUpDown := Interface.Add("UpDown", "Range0-" . LoadDelayMax . " 0x80", LoadDelay)
LoadDelayReset := Interface.Add("Button", "x+0 w40 h40 -E0x200 -Border -Tabstop center", "⟳")
LoadDelayReset.OnEvent("Click", (*) => (LoadDelayInput.Value := LoadDelayDefault, OnLoadDelayInputChange(
    LoadDelayInput)))

OnLoadDelayInputChange(con, *) {
    if (!IsNumber(con.Value)) {
        con.SetFont("cFFA500")
        return
    }

    parsed := Integer(con.Value || LoadDelayDefault)
    global LoadDelay := Clamp(parsed, 0, LoadDelayMax)

    con.SetFont((parsed > LoadDelayMax || parsed < 0) ? "cRed" : "cWhite")
    IniWrite(LoadDelay, ConfigFilePath, "State", "LoadDelay")
}

OnLoadDelayInputLoseFous(con, *) {
    if (!IsNumber(con.Value) || con.Value > LoadDelayMax || con.Value < 0) {
        con.SetFont("cWhite")
        con.Value := LoadDelay
    }
}
