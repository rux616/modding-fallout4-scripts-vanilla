;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFBunkerHill02_00122221 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(100) )   ; You could clear these guys before you have the quest
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)

; Give the PC money
if ( BunkerHillQuest.GetStageDone(304) )   
   Game.GivePlayerCaps(150)    ; Rejected barter
elseif ( BunkerHillQuest.GetStageDone(303) )   
   Game.GivePlayerCaps(300)    ; Max barter
elseif ( BunkerHillQuest.GetStageDone(302) )   
   Game.GivePlayerCaps(225)    ; Barter 2
elseif ( BunkerHillQuest.GetStageDone(301) )   
   Game.GivePlayerCaps(175)    ; Barter 1
else
   Game.GivePlayerCaps(150)
endif

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)

; Upgrade the Caravans
pCaravanUpgrade01.SetValue(0)

; Queue up "Prep School"
pFFBunkerHill03.SetStage(50)

; Close off the quest
;SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Pause a little then close the quest
Utility.Wait(0.1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pXPRadiant Auto Const

Quest Property BunkerHillQuest Auto Const

Quest Property pFFBunkerHill03 Auto Const

GlobalVariable Property pCaravanUpgrade01 Auto Const
