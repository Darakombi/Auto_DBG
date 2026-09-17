; Rewind related
; On Pause
ClickPauseResume() => PauseMenuResume
ClickPauseRestart() => SClick(PauseMenuRestart)
ClickPauseReturn() => SClick(PauseMenuReturn)
PauseRestart() {
    SClick(PauseMenu)
    ClickPauseRestart()
    SClick(PauseMenuPromptConfirm)
}
PauseReturn() {
    SClick(PauseMenu)
    ClickPauseReturn()
    SClick(PauseMenuPromptConfirm, LoadDelay)
}

; On Win
ClickWinMenuContinue() => SClick(WinMenuContinue)
ClickWinMenuReturn() => SClick(WinMenuReturn, LoadDelay)

; On Death
ClickDeathMenuRestart() => SClick(DeathMenuRestart)
ClickDeathMenuReturn() => SClick(DeathMenuReturn, LoadDelay)
ClickDeathRevive() => SClick(DeathMenuReturn)

; Upgrade before rebirth
ClickUpgradePre() => SClick(StatMap[CurrentPreStat])

; Rebirth
ClickRebirthMenu() => SClick(MenuRebirth)
ClickRebirth() => SClick(RebirthRewind)
; ---> Handle flashbacks here <---
ClickConfirmRebirth() => SClick(RewindConfirm)
Rebirth() {
    ClickRebirthMenu()
    ClickRebirth()
    ; flashbacks
    ClickConfirmRebirth()
}

; Level skill
ExecuteSkillMacro() => SkillMacros[CurrentSkill]()
ClickUpgradeSkill() => SClick(SkillMap[CurrentSkill])
ClickConfirmUpgrade() => SClick(SkillUpgradeConfirm)
Skill() {
    ExecuteSkillMacro()
    ClickUpgradeSkill()
    ClickConfirmUpgrade()
}

; Upgrade after rebirth
ClickOpenStatMenu() => SClick(MenuStat)
ClickUpgradePost() => SClick(StatMap[CurrentPostStat])
Post() {
    ClickOpenStatMenu()
    ClickUpgradePost()
}

; Enter campaign
ClickOpenBattlePanel() => SClick(PanelBattle)
ClickCampaign() => SClick(GamemodeCampaign)
ClickConfirmCampaign() => SClick(CampaignConfirm)
Campaign() {
    ClickOpenBattlePanel()
    ClickCampaign()
    ClickConfirmCampaign()
}

; Bundles
PreRebirth() {
    ClickUpgradePre()
    Rebirth()
}

RebirthSkill() {
    Rebirth()
    Skill()
}

PreRebirthSkill() {
    PreRebirth()
    Skill()
}

PostCampaign() {
    Post()
    Campaign()
}

RebirthPostCampaign() {
    Rebirth()
    PostCampaign()
}

RebirthSkillPostCampaign() {
    Rebirth()
    Skill()
    PostCampaign()
}

PreRebirthCampaign() {
    PreRebirth()
    Campaign()
}

PreRebirthSkillCampaign() {
    PreRebirth()
    Skill()
    Campaign()
}

PreRebirthPostCampaign() {
    PreRebirth()
    PostCampaign()
}

PreRebirthSkillPostCampaign() {
    PreRebirth
    Skill()
    PostCampaign()
}

FullRewind(ReturnMethod) {
    ReturnMethod()
    PreRebirthSkillPostCampaign
}

NoSkillRewind(ReturnMethod) {
    ReturnMethod()
    PreRebirthPostCampaign()
}

NoPostRewind(ReturnMethod) {
    ReturnMethod()
    PreRebirthSkillCampaign()
}

NoSkillNoPostRewind(ReturnMethod) {
    ReturnMethod
    PreRebirthCampaign()
}

; Menu related
ClickEncyclopedia() => SClick(Encyclopedia)
ClickFlashbacks() => SClick(EncyclopediaFlashbacks)

OverviewFlashbacks() {
    ClickEncyclopedia()
    ClickFlashbacks()
}

RebirthOverviewFlashbacks() {
    ClickRebirthMenu()
    OverviewFlashbacks()
}

CampaignRebirthOverviewFlashbacks(ReturnMethod := PauseReturn) {
    ReturnMethod()
    RebirthOverviewFlashbacks()
}
