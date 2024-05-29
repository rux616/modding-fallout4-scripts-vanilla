;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR08_0013A33D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE RRR08Script
Quest __temp = self as Quest
RRR08Script kmyQuest = __temp as RRR08Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Set up the quest
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Let Drummer Boy know about the quest
pRRQuestsAvailable.Mod(1)
pRRQuestDesdemona.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Drummer Boy no longer points to quest
pRRQuestsAvailable.Mod(-1)
pRRQuestDesdemona.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(200) )   ; Is the target still alive? If so, get an objective to kill it
if ( pRRR08DisplayNumber.GetValue() == 1 )
 SetObjectiveDisplayed(101)
elseif pRRR08DisplayNumber.GetValue() == 2
 SetObjectiveDisplayed(102)
elseif pRRR08DisplayNumber.GetValue() == 3
 SetObjectiveDisplayed(103)
elseif pRRR08DisplayNumber.GetValue() == 4
 SetObjectiveDisplayed(104)
elseif pRRR08DisplayNumber.GetValue() == 5
 SetObjectiveDisplayed(105)
elseif pRRR08DisplayNumber.GetValue() == 6
 SetObjectiveDisplayed(106)
endif
endif

SetStage(75)    ; Clean up Drummer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)
SetObjectiveDisplayed(200)

SetStage(75)    ; Clean up Drummer
; Is this the final iteration of RRR08?
if ( pRRR08DisplayNumber.GetValue() == 6 )
 SetStage(250)  ; If so play the custom log
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

CompleteAllObjectives()

; Is this the final iteration of the quest?
if ( pRRR08DisplayNumber.GetValue() == 6 )
 SetStage(350)  ; If so play the custom log
endif

; Give other rewards
if ( !GetStageDone(350) )
  int nCaps = 150 + Utility.RandomInt(0, 20)*10   ; Anywhere from 150-350 caps
  Game.GivePlayerCaps(nCaps)
  if ( Utility.RandomInt(0,100) < 33 )    ; 1/3 chance of getting some loot
    Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)
  endif
else
  Game.GivePlayerCaps(450)
  Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable, 2)
endif

; Increment the tracker for the number of times the quest has been completed
pRRR08DisplayNumber.Mod(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

; End quest
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
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

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestDesdemona Auto Const

GlobalVariable Property pXPRadiant Auto Const

GlobalVariable Property pRRR08DisplayNumber Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory
