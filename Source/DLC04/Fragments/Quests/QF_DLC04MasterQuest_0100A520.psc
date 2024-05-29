;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MasterQuest_0100A520 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_DLC04RaiderOverboss.TryToDisable()
DLC04ArenaCombatantsCount.SetValue(5)
DLC04_NUK001_ArenaManager.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Ryan Jenkins script fracgments
NUK016TraderFaction.SetAlly(PlayerFaction, True, True)

;Justin Schram script fracgments
PDLC04SafariCitoFaction.SetAlly(PlayerFaction, True, True)

;SC script fragments.
DLC04EyebotRadio.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property NUK016TraderFaction Auto Const

Faction Property PlayerFaction Auto Const

Faction Property PDLC04SafariCitoFaction Auto Const Mandatory

GlobalVariable Property DLC04ArenaCombatantsCount Auto Const Mandatory

ReferenceAlias Property Alias_DLC04RaiderOverboss Auto Const Mandatory

Quest Property DLC04_NUK001_ArenaManager Auto Const Mandatory

Scene Property DLC04EyebotRadio Auto Const Mandatory
