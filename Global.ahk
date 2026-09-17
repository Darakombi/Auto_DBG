global ConfigFile := "Config.ini"
global Skill_Icons := "Resources\Icons\Skills\"

; Delay
global ClickDelay_Default := 220
global ClickDelay := IniRead(ConfigFile, "State", "ClickDelay", ClickDelay_Default)
global ClickDelay_Max := 5000
global LoadDelay_Default := 2000
global LoadDelay := IniRead(ConfigFile, "State", "LoadDelay", LoadDelay_Default)
global LoadDelay_Max := 20000

; Skills
global Skill_Points := Map()
Skill_Points["EM"] := [1600, 300]
Skill_Points["HL"] := [1600, 450]
Skill_Points["UP"] := [1600, 600]
Skill_Points["BD"] := [1600, 750]
Skill_Points["MS"] := [1600, 900]
Skill_Points["BS"] := [1600, 1050]
Skill_Points["None"] := [1, 1]

global Default_Skill := "EM"
global Current_Skill := IniRead(ConfigFile, "State", "LastSkill", Default_Skill)

; Stats
global Stats := Map()
Stats["Damage"] := [900, 220]
Stats["SpellDamage"] := [900, 800]
Stats["Gold"] := [900, 950]
Stats["Crit"] := [1750, 650]

global Default_Selected_Stat_Pre := "Crit"
global Default_Selected_Stat_Post := "Gold"
global Selected_Stat_Pre := "Crit"
global Selected_Stat_Post := "Gold"

; Spells
global Spells := Map()
Spells["Spell_One"] := [600, 1000]
Spells["Spell_Two"] := [750, 1000]
Spells["Spell_Three"] := [900, 1000]
Spells["Spell_Four"] := [1020, 1000]
Spells["Spell_Five"] := [1170, 1000]
Spells["Spell_Six"] := [1300, 1000]