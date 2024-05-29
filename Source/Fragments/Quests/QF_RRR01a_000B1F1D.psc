;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR01a_000B1F1D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR01aScript
Quest __temp = self as Quest
RRR01aScript kmyQuest = __temp as RRR01aScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Make the "Dead Drop" rail sign appear
Alias_QuestDeadDrop.GetReference().GetLinkedRef(pRRSign).Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Queue up "Mercer Station"
pRRR04.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Dead drop objective failsafe
SetStage(200)

; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)

; Make the "Dead Drop" rail sign disappear
Alias_QuestDeadDrop.GetReference().GetLinkedRef(pRRSign).Disable()

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)
Game.GivePlayerCaps(150)

; Increment the quest counter
pRRR01RadiantCounter.Mod(1)

; Butcher's Bill 2 is in pre-q (will start next time the PC returns to HQ)
pRRR01b.SetStage(25)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Fail objectives and end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property pDoctorCarrington Auto Const

ReferenceAlias Property Alias_QuestGiver Auto Const

GlobalVariable Property pRRR01RadiantCounter Auto Const

int Function QuestCount()
	int nQuestCount = pRRR01RadiantCounter.GetValueInt()
	return nQuestCount
EndFunction

GlobalVariable Property pXPRadiant Auto Const

Quest Property pRRR04 Auto Const

Quest Property pRRR01b Auto Const

ReferenceAlias Property Alias_QuestDeadDrop Auto Const

Keyword Property pRRSign Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const
