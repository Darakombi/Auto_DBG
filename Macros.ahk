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
ClickDeathRevive() => SClick(DeathMenuRevive)

; Upgrade before rebirth
ClickStatMenu() => SClick(MenuStat)
ClickUpgradePre() => SClick(StatMap[CurrentPreStat])
Pre() {
    ClickStatMenu()
    ClickUpgradePre()
}

; Rebirth
ClickRebirthMenu() => SClick(MenuRebirth)
ClickRebirth() => SClick(RebirthRewind)
ClickConfirmRebirth() => SClick(RewindConfirm)
Rebirth() {
    ClickRebirthMenu()
    ClickRebirth()
    ; Sleep(100)
    ; if (IsDetectedArray(FlashbackIconCoords, FlashbackIconPath)) {
    ;     SClick(SkillUpgradeConfirm)
    ;     return
    ; }
    ClickConfirmRebirth()
}

; Level skill
ExecuteSkillMacro() => SkillMacros[CurrentSkill]()
ClickUpgradeSkill() => SClick(SkillMap[CurrentSkill])
ClickConfirmSkillUpgrade() => SClick(SkillUpgradeConfirm)
Skill() {
    ExecuteSkillMacro()
    ClickUpgradeSkill()
    ClickConfirmSkillUpgrade()
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
MinsToMs(mins) => mins * 60 * 10000
ChimeRemind() {
    SetTimer(() => SoundBeep(1000, 800), -209000,)
}
Campaign() {
    ClickOpenBattlePanel()
    ClickCampaign()
    ClickConfirmCampaign()
    ChimeRemind()
}

rewinding := false
Rewind(ReturnMethod := (*) => 0, preFunc := (*) => 0, postFunc := (*) => 0) {
    global rewindsUntilFlashback, flashbackCount, rewinding
    if (rewinding) {
        return
    }
    rewinding := true
    
    preFunc()
    ReturnMethod()
    Pre()
    ClickRebirthMenu()

    isFlashback := false
    if (IsDetected(FlashbackIconCoords, FlashBackIconPath)) {
        isFlashback := true
    }
    ClickRebirth()
    if (isFlashback) {
        ClickConfirmSkillUpgrade()
        rewindsUntilFlashback := defaultRewindsUntilFlashback
        flashbackCount.Value := rewindsUntilFlashback
        IniWrite(rewindsUntilFlashback, "Config.ini", "State", "RewindsUntilFlashback")
        return
    }
    flashbackCount.Value := --rewindsUntilFlashback
    IniWrite(rewindsUntilFlashback, "Config.ini", "State", "RewindsUntilFlashback")

    ClickConfirmRebirth()
    Skill()
    Post()
    Campaign()
    postFunc()

    rewinding := false
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

; !x::
