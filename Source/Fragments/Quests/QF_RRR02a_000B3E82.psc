;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR02a_000B3E82 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR02a
Quest __temp = self as Quest
RRR02a kmyQuest = __temp as RRR02a
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(300) )
  SetObjectiveDisplayed(200)
else
  SetObjectiveDisplayed(300)
endif
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
; Objectives
if ( GetStageDone(100) )
  SetObjectiveCompleted(200)
  SetObjectiveDisplayed(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)
Game.GivePlayerCaps(150)
Game.GetPlayer().AddItem(pStimpak, 4)

; Increment the quest counter
pRRR01RadiantCounter.Mod(1)

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

ReferenceAlias Property Alias_QuestDeadDrop Auto Const

Keyword Property pRRSign Auto Const

Potion Property pStimpak Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const
