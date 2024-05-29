;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DialogueHarvey_010243A5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Move Harvey and add his collar.
Alias_DLC04Harvey.GetActorRef().MoveTo(DLC04MHubMarketCenterMarker)
Alias_DLC04Harvey.GetActorRef().AddItem(DLC04_ShockCollar)
Alias_DLC04Harvey.GetActorRef().EquipItem(DLC04_ShockCollar, True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by trigger box DLC04DialogueHarveySetStage100Ref in NukaWorldNukaTownUSA01.

If DLC04MQ00.GetStageDone(800) == 0 && DLC04MQ01.GetStageDone(1000) == 1
   SetObjectiveDisplayed(100)
EndIf

Alias_DLC04Harvey.GetActorRef().EquipItem(DLC04_ShockCollar, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;Companion Affinity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
;Companion Affinity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
;Companion Affinity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC04HarveyHostileFaction.SetEnemy(PlayerFaction)
DLC04HarveyHostileFaction.SetEnemy(DLC04SettlementGuardFaction)
Alias_DLC04Harvey.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Disables Harvey because player let him go and stops this quest.
;Set in Package DLC04REObjectCT03TravelTransitStation.
Alias_DLC04Harvey.GetRef().Disable(True)
DLC04REObjectCT03.SetStage(1000)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04MHubMarketCenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_DLC04Harvey Auto Const Mandatory

Quest Property DLC04MQ00 Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

Faction Property DLC04HarveyHostileFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property DLC04SettlementGuardFaction Auto Const Mandatory

Quest Property DLC04REObjectCT03 Auto Const Mandatory

Armor Property DLC04_ShockCollar Auto Const Mandatory
