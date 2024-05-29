;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFBunkerHill03_0012221F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Make the prisoners show up
Alias_CaravanPrisoner01.GetActorRef().Enable()
Alias_CaravanPrisoner02.GetActorRef().Enable()
Alias_CaravanPrisoner03.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(200)
SetObjectiveDisplayed(300)

; If the PC negotiated for more pay, then give it right away
if ( GetStageDone(101) )
  Game.GetPlayer().AddItem(pAmmo5mm, 24)
  Game.GetPlayer().AddItem(pSuperStimpak, 2)
  Game.GetPlayer().AddItem(pMedX, 2)
endif

; Enable Zeller
Alias_Zeller.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
if ( GetStageDone(300) )    ; If you've done the other objective report back
  SetObjectiveDisplayed(400)
  SetStage(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
; Variable 1 is used to change prisoner's package
Alias_CaravanPrisoner01.GetActorRef().SetValue(Variable01, 1)
Alias_CaravanPrisoner01.GetActorRef().EvaluatePackage()

bool nPrisoner2 = GetStageDone(202) || GetStageDone(212)
bool nPrisoner3 = GetStageDone(203) || GetStageDone(213)

; Have I rescued everyone?
if ( nPrisoner2 && nPrisoner3 )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
; Variable 1 is used to change prisoner's package
Alias_CaravanPrisoner02.GetActorRef().SetValue(Variable01, 1)
Alias_CaravanPrisoner02.GetActorRef().EvaluatePackage()

bool nPrisoner1 = GetStageDone(201) || GetStageDone(211)
bool nPrisoner3 = GetStageDone(203) || GetStageDone(213)

; Have I rescued everyone?
if ( nPrisoner1 && nPrisoner3 )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
; Variable 1 is used to change prisoner's package
Alias_CaravanPrisoner03.GetActorRef().SetValue(Variable01, 1)
Alias_CaravanPrisoner03.GetActorRef().EvaluatePackage()

bool nPrisoner1 = GetStageDone(201) || GetStageDone(211)
bool nPrisoner2 = GetStageDone(202) || GetStageDone(212)

; Have I rescued everyone?
if ( nPrisoner1 && nPrisoner2 )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
; If all the prisoners were killed then end the quest
if ( GetStageDone(212) && GetStageDone(213) )
  SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
; If all the prisoners were killed then end the quest
if ( GetStageDone(211) && GetStageDone(213) )
  SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
; If all the prisoners were killed then end the quest
if ( GetStageDone(211) && GetStageDone(212) )
  SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
; PATCH 1.3 - 84002 - If all the prisoners have been killed, end the quest
if ( Alias_CaravanPrisoner01.GetActorRef().IsDead() ) 
  SetStage(211)
endif

if ( Alias_CaravanPrisoner02.GetActorRef().IsDead() ) 
  SetStage(212)
endif

if ( Alias_CaravanPrisoner03.GetActorRef().IsDead() ) 
  SetStage(213)
endif

bool nPrisoner1 = GetStageDone(201) || GetStageDone(211)
bool nPrisoner2 = GetStageDone(202) || GetStageDone(212)
bool nPrisoner3 = GetStageDone(203) || GetStageDone(213)
bool nPrisonerAllKilled = GetStageDone(211) && GetStageDone(212) && GetStageDone(213)

; Have I rescued everyone?
if ( nPrisoner1 && nPrisoner2 && nPrisoner3 && !nPrisonerAllKilled )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
if ( GetStageDone(200) )    ; If you've done the other objective report back
  SetObjectiveDisplayed(400)
  SetStage(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)

; Give the PC money
Game.GivePlayerCaps(400)

; Upgrade the Caravans
pCaravanUpgrade02.SetValue(0)

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Safety net to clean up prisoners (in case they didn't path to the exit and disable)
Alias_CaravanPrisoner01.GetActorRef().Disable()
Alias_CaravanPrisoner02.GetActorRef().Disable()
Alias_CaravanPrisoner03.GetActorRef().Disable()

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

Ammo Property pAmmo5mm Auto Const

Potion Property pSuperStimpak Auto Const

Potion Property pMedX Auto Const

ReferenceAlias Property Alias_CaravanPrisoner01 Auto Const

ReferenceAlias Property Alias_CaravanPrisoner02 Auto Const

ReferenceAlias Property Alias_CaravanPrisoner03 Auto Const

ActorValue Property Variable01 Auto Const

GlobalVariable Property pCaravanUpgrade02 Auto Const

ReferenceAlias Property Alias_Zeller Auto Const Mandatory
