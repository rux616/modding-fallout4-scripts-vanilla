;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF03a_0100A990 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; The Mirelurk Queen has to be dealt with before she'll offer this quest
pDLC03MQ02.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Make the power tools box interactible
Alias_PowerTools.GetRef().Enable()

; Kill the pointer quest
pDLC03FarHarborFF03a_Misc.SetStage(100)

; Update the master quest
pDLC03FarHarborM02.SetStage(450)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(450)
endif

; Add a map marker
Alias_MapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Enable Machete Mike and get him headed to the player
actor aTarg = Alias_MacheteMike.GetActorRef()
aTarg.Enable()
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Figure out how much the player was offered
int nCapsOffered = 2000

if ( GetStageDone(230) )
  nCapsOffered = 2750
endif

; Remove the tools
Game.GetPlayer().RemoveItem(Alias_PowerTools.GetRef())

; Now pay out
Game.GivePlayerCaps(nCapsOffered)
Alias_MacheteMike.GetActorRef().RemoveItem(pCaps001, nCapsOffered)

; Update the master quest
pDLC03FarHarborM02.SetStage(490)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(490)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Alias_MacheteMike.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
; Block off all further "Hull Breaches"
; NOTE: The Mariner can react to this down the line
pDLC03FarHarborFF03b.SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03aScript
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF03aScript kmyQuest = __temp as DLC03:DLC03FarHarborFF03aScript
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

; Give reward
Game.GivePlayerCaps(450)

; Extra reward
if ( GetStageDone(125) )
  Game.GetPlayer().AddItem(pLL_CombatShotgun)
endif

; Remove the tools
Game.GetPlayer().RemoveItem(Alias_PowerTools.GetRef())

; Register for change location so the defenses can be fortified
;kmyQuest.RegisterLocation()

; Update the master quest
pDLC03FarHarborM02.SetStage(475)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(475)
endif

; Keeping track of deeds for "Rite of Passage"
pDLC03DialogueFarHarbor.SetStage(700)

; Disappear Machete Mike
Alias_MacheteMike.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; This will be checked elsewhere

; Disappear Machete Mike
Alias_MacheteMike.GetActorRef().Disable()

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Disappear Machete Mike
Alias_MacheteMike.GetActorRef().Disable()

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
; Enable the level 1 defenses
pLevel1.Enable()

; Queue up next part of the rebuilding
pDLC03FarHarborFF03b.SetStage(50)

; Close quest
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()
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

ReferenceAlias Property Alias_PowerTools Auto Const Mandatory

Quest Property pDLC03MQ02 Auto Const Mandatory
Quest Property pDLC03FarHarborFF03a_Misc Auto Const Mandatory
Quest Property pDLC03FarHarborFF03b Auto Const Mandatory

ReferenceAlias Property Alias_MacheteMike Auto Const Mandatory

MiscObject Property pCaps001 Auto Const Mandatory

LeveledItem Property pLL_CombatShotgun Auto Const Mandatory

ObjectReference Property pLevel1 Auto Const Mandatory


Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
