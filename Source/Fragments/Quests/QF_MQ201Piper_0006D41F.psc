;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ201Piper_0006D41F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Piper.GetActorRef().SetAvailableToBeCompanion()

;if player is still on FFDiamondCity07, let the conversation happen anywhere now
If FFDiamondCity07.GetStageDone(20) == 0
  FFDiamondCity07.SetStage(17)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Piper Auto Const

Quest Property Followers Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Quest Property FFDiamondCity07 Auto Const

Quest Property MQ201 Auto Const
