;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FreeformDiamondCity01_0001D727 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Player has refused the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Player accepts the quest 
SetObjectiveDisplayed(10)

;complete misc objective pointer
pFFDiamondCity01Misc.SetStage(100)

Alias_HardwareTownMapMarker.GetRef().AddToMap()

Alias_PaintTarget.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; Player acquires the paint
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(20)

;disable green paint stroke at wall by enabling its parent marker
GreenPaintStrokeEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; Player mixes the right shade of green
SetObjectiveCompleted(30)
SetObjectiveDisplayed(20, abforce = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;complete misc objective pointer
pFFDiamondCity01Misc.SetStage(100)

; Player is asked to apply a paint to the Wall
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Player can now activate the Wall
Alias_PaintWallTrigger.GetRef().Enable()
Alias_Abbot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Player paints the Wall green
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Player paints the Wall blue
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Player paints the Wall yellow
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DiamondCityQuest01Script
Quest __temp = self as Quest
DiamondCityQuest01Script kmyQuest = __temp as DiamondCityQuest01Script
;END AUTOCAST
;BEGIN CODE
; quest is complete
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

Actor PlayerREF = Game.GetPlayer()

;hand out rewards
If GetStageDone(100) == 1
	If kmyquest.AbbotReward == 1
	  PlayerREF.AddItem(caps001, 225)
	ElseIf kmyquest.AbbotReward == 2
	  PlayerREF.AddItem(caps001, 250)
	ElseIf kmyquest.AbbotReward == 3
	  PlayerREF.AddItem(caps001, 300)
	Else
	  PlayerREF.AddItem(caps001, 200)
	EndIf
Else
	If kmyquest.AbbotReward == 1
	  PlayerREF.AddItem(caps001, 125)
	ElseIf kmyquest.AbbotReward == 2
	  PlayerREF.AddItem(caps001, 150)
	ElseIf kmyquest.AbbotReward == 3
	  PlayerREF.AddItem(caps001, 200)
	Else
	  PlayerREF.AddItem(caps001, 100)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; swap out the Wall if we need to

If GetStageDone(110) == 1
  TheWallGreenREF.Disable()
  TheWallBlueREF.Enable()
ElseIf GetStageDone(120) == 1
  TheWallGreenREF.Disable()
  TheWallYellowREF.Enable()
EndIf

; Wall has been swapped out, shut down the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;fail misc objective pointer
pFFDiamondCity01Misc.SetStage(500)

; Abbot is dead, fail quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TheWallGreenREF  Auto  Const

ObjectReference Property TheWallBlueREF  Auto  Const

ObjectReference Property TheWallYellowREF  Auto  Const

ReferenceAlias Property Alias_Abbot Auto Const ; Legacy alias property
ReferenceAlias Property Alias_PaintWallTrigger Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Mixer Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Player Auto Const ; Legacy alias property
ReferenceAlias Property Alias_TheWall Auto Const ; Legacy alias property

Quest Property pFFDiamondCity01Misc Auto Const

ReferenceAlias Property Alias_HardwareTownMapMarker Auto Const

MiscObject Property Caps001 Auto Const

ObjectReference Property GreenPaintStrokeEnableMarker Auto Const

ObjectReference Property BluePaintStrokeEnableMarker Auto Const

ObjectReference Property YellowPaintStrokeEnableMarker Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_PaintTarget Auto Const
