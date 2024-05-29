;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleus01_0101055C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Set appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(10, false, false)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_FFNucleus01Script
Quest __temp = self as Quest
DLC03:DLC03CoA_FFNucleus01Script kmyQuest = __temp as DLC03:DLC03CoA_FFNucleus01Script
;END AUTOCAST
;BEGIN CODE
;Complete objective
SetObjectiveCompleted(20)

;Give player hood and CoA rags
Actor Player = Game.GetPlayer()

Player.AddItem(Alias_CoARags.GetRef())
Player.AddItem(Alias_SackHood.GetRef())

;If player doesn't have the rags equipped, display the objective
if !kmyquest.PlayerHasRagsEquipped()
  SetObjectiveDisplayed(30)
else
  (Alias_Player as DLC03:FFNucleus01_PlayerAliasScript).bRagsEquippedOnce = true
   SetObjectiveDisplayed(30)
   Utility.Wait(1.5)
   SetObjectiveCompleted(30)
endif

;If player doesn't have the hood equipped, display the objective
if !kmyquest.PlayerHasHoodEquipped()
  SetObjectiveDisplayed(35)
else
  (Alias_Player as DLC03:FFNucleus01_PlayerAliasScript).bHoodEquippedOnce = true
   SetObjectiveDisplayed(35)
   Utility.Wait(1.5)
   SetObjectiveCompleted(35)
endif

;If player has less than 750 rads, display objective
if Game.GetPlayer().GetValue(Rads) < DLC03_FFNucleus01_RadThreshold.GetValue()
  SetObjectiveDisplayed(40)
else
   SetObjectiveDisplayed(40)
   Utility.Wait(1.5)
   SetObjectiveCompleted(40)
endif

;Start Rads timer to watch for AV changes
kmyquest.StartRadsTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_FFNucleus01Script
Quest __temp = self as Quest
DLC03:DLC03CoA_FFNucleus01Script kmyQuest = __temp as DLC03:DLC03CoA_FFNucleus01Script
;END AUTOCAST
;BEGIN CODE
;Kill the rads timer
kmyquest.CancelRadsTimer()

;Complete objectives
SetObjectiveCompleted(10)
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveCompleted(40)

;Show new obj
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC03CoA_QuestsCompleted.SetValue(DLC03CoA_QuestsCompleted.GetValue() + 1)

DLC03CoA_QuestPointers.SetStage(350)

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_FFNucleus01Script
Quest __temp = self as Quest
DLC03:DLC03CoA_FFNucleus01Script kmyQuest = __temp as DLC03:DLC03CoA_FFNucleus01Script
;END AUTOCAST
;BEGIN CODE
;Kill the rads timer
kmyquest.CancelRadsTimer()

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Rads Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus01_RadThreshold Auto Const Mandatory

ReferenceAlias Property Alias_CoARags Auto Const Mandatory

ReferenceAlias Property Alias_SackHood Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory
