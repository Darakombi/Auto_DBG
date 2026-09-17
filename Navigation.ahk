; Pause actions
Do_Pause_Resume() => Pause_Resume
Do_Pause_Restart() {
    SClick(Pause_Escape)
    SClick(Pause_Restart)
    SClick(Pause_Prompt_Confirm)
}
Do_Pause_Return() {
    SClick(Pause_Escape)
    SClick(Pause_Return)
    SClick(Pause_Prompt_Confirm, LoadDelay)
}

; Win actions
Do_Win_Continue() => SClick(Win_Continue)
Do_Win_Return() => SClick(Win_Return, LoadDelay)

; Death actions
Do_Death_Restart() => SClick(Death_Restart)
Do_Death_Return() => SClick(Death_Return, LoadDelay)
Do_Death_Revive() => SClick(Death_Revive)

; Upgrade before rebirth
Do_UpgradePre() => SClick(Stats[Selected_Stat_Pre])

; Rebirth
Do_OpenRebirthMenu() => SClick(Menu_Rebirth)
Do_Rebirth() => SClick(Rebirth_Rewind)
Do_ConfirmRebirth() => SClick(Rewind_Confirm)

; Level skill
Do_UpgradeSkill() => SClick(Skill_Points[Current_Skill])
Do_ConfirmUpgrade() => SClick(Skill_Upgrade_Confirm)

; Upgrade after rebirth
Do_OpenStatMenu() => SClick(Menu_Stat)
Do_UpgradePost() => SClick(Stats[Selected_Stat_Post])

; Enter campaign
Do_OpenBattlePanel() => SClick(Panel_Battle)
Do_Campaign() => SClick(Gamemode_Campaign)
Do_ConfirmCampaign() => SClick(Campaign_Confirm)

; Bundles
Pre_RebirthMenu() {
    Do_UpgradePre()
    Do_OpenRebirthMenu()
}

Pre_Rebirth() {
    Do_UpgradePre()
    Do_OpenRebirthMenu()
    Do_Rebirth()
    Do_ConfirmRebirth()
}

Rebirth_Skill() {
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
}

Pre_Rebirth_Skill() {
    Do_UpgradePre()
    Do_OpenRebirthMenu()
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
}

StatMenu_Post() {
    Do_OpenStatMenu()
    Do_UpgradePost()
}

EnterCampaign() {
    Do_OpenBattlePanel()
    Do_Campaign()
    Do_ConfirmCampaign()
}

Rebirth_Skill_Campaign() {
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
    Do_OpenBattlePanel()
    Do_Campaign()
    Do_ConfirmCampaign()
}

Rebirth_Skill_Post_Campaign() {
    Do_OpenRebirthMenu()
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
    Do_OpenStatMenu()
    Do_UpgradePost()
    Do_OpenBattlePanel()
    Do_Campaign()
    Do_ConfirmCampaign()
}

StatMenu_Post_Campaign() {
    Do_OpenStatMenu()
    Do_UpgradePost()
    Do_OpenBattlePanel()
    Do_Campaign()
    Do_ConfirmCampaign()
}

Dump() {
    Do_UpgradePre()
    Do_OpenRebirthMenu()
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
    Do_OpenStatMenu()
    Do_UpgradePost()
}

Dump_Campaign() {
    Do_UpgradePre()
    Do_OpenRebirthMenu()
    Do_Rebirth()
    Do_ConfirmRebirth()
    Do_UpgradeSkill()
    Do_ConfirmUpgrade()
    Do_OpenStatMenu()
    Do_UpgradePost()
    Do_OpenBattlePanel()
    Do_Campaign()
    Do_ConfirmCampaign()
}

Rewind(ReturnMethod) {
    ReturnMethod()
    Dump_Campaign()
}
