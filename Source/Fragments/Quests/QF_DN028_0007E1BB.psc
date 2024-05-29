;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN028_0007E1BB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DBTechBossReserveAlias.Clear()
DBTechReserveLocation.Clear()


Alias_Boss.GetReference().DisableNoWait()
Alias_BossMinion01.GetReference().DisableNoWait()
Alias_BossMinion02.GetReference().DisableNoWait()

DN028_RaiderBossRoomFaction.SetAlly(RaiderFaction, True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Boss.GetReference().EnableNoWait()
Alias_BossMinion01.GetReference().EnableNoWait()
Alias_BossMinion02.GetReference().EnableNoWait()
Alias_BossRoomTurrets.EnableAll()
DN028_BossScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
DN028_RaiderBossRoomFaction.SetEnemy(PlayerFaction, False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DBTechReserveLocation.Clear()
DBTechBossReserveAlias.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DNMasterQuest Auto Const

LocationAlias Property DBTechReserveLocation Auto Const

ReferenceAlias Property DBTechBossReserveAlias Auto Const

Scene Property DN028_BossScene Auto Const

ReferenceAlias Property Alias_Boss Auto Const

RefCollectionAlias Property Alias_BossRoomTurrets Auto Const

Faction Property DN028_RaiderBossRoomFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_BossMinion01 Auto Const

ReferenceAlias Property Alias_BossMinion02 Auto Const

Faction Property RaiderFaction Auto Const
