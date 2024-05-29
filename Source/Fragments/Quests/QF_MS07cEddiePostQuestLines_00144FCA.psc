;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07cEddiePostQuestLines_00144FCA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor EddieWinter = Alias_EddieWinter.GetActorRef()

EddieWinter.SetValue(Game.GetAggressionAV(), 2)
EddieWinter.SetValue(Game.GetConfidenceAV(), 3)
EddieFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EddieWinter Auto Const

Faction Property EddieFaction Auto Const

Faction Property PlayerFaction Auto Const
