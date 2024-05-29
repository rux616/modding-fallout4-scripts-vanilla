;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR01b_000B1F1C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR01bScript
Quest __temp = self as Quest
RRR01bScript kmyQuest = __temp as RRR01bScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Disable the holotape in the Dead Drop for now
Alias_QuestDeadDropHolotape.GetRef().Disable()

Utility.Wait(0.1)

; Kill Blackbird as soon as the quest starts
Alias_QuestDeadCaptive.GetActorRef().SetOutfit(pResidentSurveyor)
Alias_QuestDeadCaptive.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
; Quest will start once the player re-enters HQ
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Let Drummer Boy know about the quest
pRRQuestsAvailable.Mod(1)
pRRQuestCarrington.SetValue(1)

; Make the "Dead Drop" rail sign appear
Alias_QuestDeadDrop.GetReference().GetLinkedRef(pRRSign).Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Drummer Boy no longer bothers PC
pRRQuestsAvailable.Mod(-1)
pRRQuestCarrington.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Move the holotape in the Dead Drop
Alias_QuestDeadDropHolotape.GetRef().Enable()
Alias_QuestDeadDrop.GetRef().AddItem(Alias_QuestDeadDropHolotape.GetRef())

; Enable Blackbird
Alias_QuestDeadCaptive.GetActorRef().Enable()
SetStage(75)    ; Clean up Drummer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

SetStage(75)    ; Clean up Drummer
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

SetStage(75)    ; Clean up Drummer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)

; Make the "Dead Drop" rail sign appear
Alias_QuestDeadDrop.GetReference().GetLinkedRef(pRRSign).Disable()

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)
Game.GivePlayerCaps(175)
Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)

; Flag Desdemona as busy - Unflagged in RRM02
pRRDesdemonaBusy.SetValue(1)

; Increment the quest counter
pRRR01RadiantCounter.Mod(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Drummer Boy no longer bothers PC
pRRQuestsAvailable.Mod(-1)
pRRQuestCarrington.SetValue(0)

; Make the "Dead Drop" rail sign disappears
Alias_QuestDeadDrop.GetReference().GetLinkedRef(pRRSign).Disable()

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

ReferenceAlias Property Alias_QuestDeadCaptive Auto Const

GlobalVariable Property pXPRadiant Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestCarrington Auto Const

Quest Property pRRM02 Auto Const

ReferenceAlias Property Alias_QuestDeadDrop Auto Const

Keyword Property pRRSign Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

ReferenceAlias Property Alias_QuestDeadDropHolotape Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory

Outfit Property pResidentSurveyor Auto Const Mandatory

GlobalVariable Property pRRDesdemonaBusy Auto Const Mandatory
