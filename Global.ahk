; Files
global ConfigFilePath := "Config.ini"
global SkillIconsPath := "Resources\Icons\Skills\"

; Delays
global ClickDelayDefault := 220
global ClickDelayMax := 5000
global LoadDelayDefault := 2000
global LoadDelayMax := 20000
global ClickDelay := IniRead(ConfigFilePath, "State", "ClickDelay", ClickDelayDefault)
global LoadDelay := IniRead(ConfigFilePath, "State", "LoadDelay", LoadDelayDefault)

; Skills
global DefaultSkill := "EM"
global CurrentSkill := IniRead(ConfigFilePath, "State", "LastSkill", DefaultSkill)

; Stats
global DefaultPreStat := "Crit"
global DefaultPostStat := "Gold"
global CurrentPreStat := "Crit"
global CurrentPostStat := "Gold"
