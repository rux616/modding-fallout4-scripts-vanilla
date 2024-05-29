;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity07_000456E8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
If GetStageDone(15) == 0
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(15)
EndIf

;if Piper Nat scene isn't done, shut it down
If DialogueDiamondCityEntrance.GetStageDone(100) == 0
  DialogueDiamondCityEntrance.SetStage(97)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, abdisplayed = False)
SetObjectiveDisplayed(15)

SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
pMQ04.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;piper is now a companion
Alias_Piper.GetActorRef().SetAvailableToBeCompanion()

;player can now take things in Publick Occurrences
Game.GetPlayer().AddToFaction(DmndPublickOwnerFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ04 Auto Const

GlobalVariable Property XPRadiant Auto Const

Quest Property MQ201 Auto Const

Quest Property MQ201Piper Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

Faction Property HasBeenCompanionFaction Auto Const

ReferenceAlias Property Alias_Piper Auto Const

Faction Property DmndPublickOwnerFaction Auto Const Mandatory
