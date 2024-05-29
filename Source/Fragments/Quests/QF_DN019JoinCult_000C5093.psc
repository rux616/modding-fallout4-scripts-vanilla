;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN019JoinCult_000C5093 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
setStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DN019.SetStage(20)
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DN019.AttackOnWalkaway = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DN019JoinCultScript
Quest __temp = self as Quest
DN019JoinCultScript kmyQuest = __temp as DN019JoinCultScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartOfficeScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DN019JoinCultScript
Quest __temp = self as Quest
DN019JoinCultScript kmyQuest = __temp as DN019JoinCultScript
;END AUTOCAST
;BEGIN CODE
DN019.SetCultistHostility(true)
SetObjectiveCompleted(10)
kmyquest.StartOfficeScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DN019JoinCultScript
Quest __temp = self as Quest
DN019JoinCultScript kmyQuest = __temp as DN019JoinCultScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveAllItems(Alias_CultLeader.GetRef())
DN019.PlayerJoinedCult = true
DN019.PlayerAllowedEmogeneRoom = true
kmyQuest.StartOfficeScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
MS09.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Game.GetCaps(), 500, Alias_CultLeader.GetRef())
setStage(720)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetStage(720)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetStage(400)
DN019.PlayerAllowedEmogeneRoom = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
Alias_AmphitheaterDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DN019Script Property DN019 Auto Const

ReferenceAlias Property Alias_CultLeader Auto Const

ReferenceAlias Property Alias_AmphitheaterDoor Auto Const

Quest Property MS09 Auto Const

Faction Property PrewarCultistFriendFaction Auto Const
