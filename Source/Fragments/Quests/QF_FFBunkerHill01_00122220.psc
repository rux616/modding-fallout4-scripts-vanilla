;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFBunkerHill01_00122220 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Enable the hat
Alias_GrandpaSavoldiHat.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

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
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

; Give the PC money
if ( BunkerHillQuest.GetStageDone(301) )   
   Game.GivePlayerCaps(200)    ; Asked for more reward
else
   Game.GivePlayerCaps(150)
endif

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)

; If the PC isn't in the Minutemen, Tony takes the hat
if ( pPlayerMinutemen_JoinedFaction.GetValue() == 0 )
  Alias_TonySavoldi.GetReference().AddItem(Alias_GrandpaSavoldiHat.GetReference())
else
  SetStage(500)   ; In this case, the player gets to keep the hat
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Give the player the hat
Game.GetPlayer().AddItem(Alias_GrandpaSavoldiHat.GetReference())

; Close the quest
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
STOP()
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

ReferenceAlias Property Alias_GrandpaSavoldiHat Auto Const

GlobalVariable Property pPlayerMinutemen_JoinedFaction Auto Const

ReferenceAlias Property Alias_TonySavoldi Auto Const

GlobalVariable Property pXPRadiant Auto Const

Armor Property pFFBK01GrandpaHat Auto Const

Quest Property BunkerHillQuest Auto Const
