;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor02_0010B654 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;display objective unless the player already did the quest
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
EndIf

;always give player book regardless of if he did it earlier or not
Game.GetPlayer().AddItem(DN011OverdueBook, 1)

Alias_BostonLibraryMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set from DN011OverdueBookVendingMachineSCRIPT, when any book is returned
;   and this quest is waiting for this objective to be completed.

SetObjectiveCompleted(20)

; Only show "Kill all Supermutants" objective if the player hasn't already killed them all.
if DN011.GetStageDone(1000)
	SetObjectiveDisplayed(40)
else
	; If we haven't killed the supermutants, they haven't spawned, and the bots think we are the mayor...
	; ...then tell the player to explore the library.
	if DN011.GetStageDone(400) && DN011.GetStageDone(600) == FALSE
		SetObjectiveDisplayed(25)
	else
		SetObjectiveDisplayed(30)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Called from DN011 Stage 600

if IsObjectiveDisplayed(25)
	SetObjectiveCompleted(25)
	SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set from DN011 quest, stage 1000

; If we have already returned the book when the supermutants have died, then complete the "Kill supermutants" objective and tell
; ... the player to "Return to Daisy".
if GetStageDone(30)
	SetObjectiveCompleted(30)
	SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor02Script
Quest __temp = self as Quest
FFGoodneighbor02Script kmyQuest = __temp as FFGoodneighbor02Script
;END AUTOCAST
;BEGIN CODE
;make sure stage 10 is set so Daisy doesn't offer the quest again
SetStage(10)
CompleteAllObjectives()

;reward XP
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;hand out money
Actor PlayerREF = Game.GetPlayer()
If kmyquest.var_reward == 0
  PlayerREF.AddItem(Caps001, 200)
ElseIf kmyquest.var_reward == 1
  PlayerREF.AddItem(Caps001, 250)
ElseIf kmyquest.var_reward == 2
  PlayerREF.AddItem(Caps001, 300)
ElseIf kmyquest.var_reward == 3
  PlayerREF.AddItem(Caps001, 400)
EndIf

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

MiscObject Property DN011OverdueBook Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_BostonLibraryMapMarker Auto Const

GlobalVariable Property XPRadiant Auto Const

Quest Property DN011 Auto Const Mandatory
