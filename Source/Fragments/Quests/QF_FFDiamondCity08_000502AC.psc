;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity08_000502AC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;sheffield takes the drink
Game.GetPlayer().RemoveItem(NukaCola, 1)
Alias_Sheffield.GetActorRef().AddItem(NukaCola, 1)
FollowersScript.SendAffinityEvent(self, Game.GetCommonProperties().CA__Event_DonateItem)
Alias_Sheffield.GetActorRef().EvaluatePackage()

;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sheffield Auto Const

ReferenceAlias Property Alias_QuestItem Auto Const

Potion Property pLiquor01 Auto Const

LeveledItem Property pCapsRewardSmall Auto Const

Potion Property NukaCola Auto Const

GlobalVariable Property XPRadiant Auto Const
