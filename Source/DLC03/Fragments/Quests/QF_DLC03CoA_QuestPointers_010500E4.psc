;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_QuestPointers_010500E4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;Turn on Sister Mai's repair note
Alias_MaiRepairNote.GetRef().Enable()

if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  SetObjectiveDisplayed(10)

  ;Throw the Grand Zealot's objective
  if !Alias_GrandZealot.GetActorRef().IsDead() && !DLC03AtomM02.GetStageDone(700)
    SetStage(100)
  endif

  ;Throw the High Confessor's objective
  if !Alias_HighConfessor.GetActorRef().IsDead() && !DLC03CoA_DialogueNucleus.GetStageDone(60) && !DLC03CoA_DialogueNucleus.GetStageDone(55)
    SetStage(200)
  else
    SetStage(240) 
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;Throw the Grand Zealot's objective
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_GrandZealot.GetActorRef().IsDead() && !DLC03AtomM02.GetStageDone(700)
    SetObjectiveDisplayed(100)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;If they haven't already gotten it, throw GZ's objective
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_GrandZealot.GetActorRef().IsDead() && !DLC03AtomM02.GetStageDone(700)
    SetStage(100)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)

kmyquest.CheckForAllQuestsCompletedAndSetStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;Throw the High Confessor's objective
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_HighConfessor.GetActorRef().IsDead() && !DLC03CoA_DialogueNucleus.GetStageDone(60) && !DLC03CoA_DialogueNucleus.GetStageDone(55)
    SetObjectiveDisplayed(200)
  else
    SetStage(240) 
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

;Mark that this objective has been handled
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, false)

;Set stage to let quest know this objective is done
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;Check for quest completion
kmyquest.CheckForAllQuestsCompletedAndSetStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_ZealotWare.GetActorRef().IsDead() && !DLC03CoA_FFNucleus01.GetStageDone(200)
    SetObjectiveDisplayed(300)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;If player hasn't already picked up objective, throw it now
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_ZealotWare.GetActorRef().IsDead() && !DLC03CoA_FFNucleus01.GetStageDone(200)
    SetStage(300)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)

kmyquest.CheckForAllQuestsCompletedAndSetStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_HighConfessor.GetActorRef().IsDead() && !DLC03CoA_FFNucleus02.GetStageDone(500) && !GetStageDone(420)
    SetObjectiveDisplayed(400)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400, false)

;Set stage to let quest know this objective is done
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;If the player hasn't already finished or failed out of FFNuc02, test to throw the objective
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_HighConfessor.GetActorRef().IsDead() && !DLC03CoA_FFNucleus02.GetStageDone(500) && !GetStageDone(420)
    SetStage(400)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

;Set stage to let quest know this objective is done
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckForAllQuestsCompletedAndSetStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_SisterMai.GetActorRef().IsDead() && !DLC03CoA_FFNucleus03.GetStageDone(50)
    SetObjectiveDisplayed(500)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
;If player hasn't already picked up objective, throw it now
if DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && !kmyquest.CheckForAllQuestsCompletedAndSetStage()
  if !Alias_SisterMai.GetActorRef().IsDead() && !DLC03CoA_FFNucleus03.GetStageDone(50)
    SetStage(500)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_PointerQuestScript
Quest __temp = self as Quest
DLC03:DLC03CoA_PointerQuestScript kmyQuest = __temp as DLC03:DLC03CoA_PointerQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)

kmyquest.CheckForAllQuestsCompletedAndSetStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus01 Auto Const Mandatory

ReferenceAlias Property Alias_GrandZealot Auto Const Mandatory

ReferenceAlias Property Alias_HighConfessor Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

ReferenceAlias Property Alias_SisterMai Auto Const Mandatory

ReferenceAlias Property Alias_ZealotWare Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus02 Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03 Auto Const Mandatory

ReferenceAlias Property Alias_MaiRepairNote Auto Const Mandatory
