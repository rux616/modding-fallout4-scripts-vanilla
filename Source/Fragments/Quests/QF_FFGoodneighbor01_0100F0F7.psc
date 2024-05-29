;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor01_0100F0F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01Script
Quest __temp = self as Quest
FFGoodneighbor01Script kmyQuest = __temp as FFGoodneighbor01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)

;lock controls
kmyquest.myEnableLayer = InputEnableLayer.Create()
kmyquest.myEnableLayer.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ105.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01Script
Quest __temp = self as Quest
FFGoodneighbor01Script kmyQuest = __temp as FFGoodneighbor01Script
;END AUTOCAST
;BEGIN CODE
;if we stop this quest for any reason, pull the objectives
SetObjectiveDisplayed(10, abDisplayed = False)

;delete the input layer so we aren't locking any controls
kmyquest.myEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105 Auto Const
