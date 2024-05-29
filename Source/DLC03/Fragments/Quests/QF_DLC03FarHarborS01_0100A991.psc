;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborS01_0100A991 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC03IntroSceneLastPlank.SetStage(200)   ; Kill the intro scene in the Last Plank
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Update "Changing Tide"
pDLC03FarHarborM03.SetStage(750)

; Enable Uncle Ken
Alias_UncleKen.GetActorRef().Enable()

; start defend quest
DLC03FarHarborS01Defend.SetStage(50)

; Kill pointer quest
pDLC03FarHarborS01_Misc.SetStage(100)

; Check to see if the player bargained for more pay
if ( GetStageDone(125) )
  Game.GetPlayer().AddItem(pStimpak, 3)
  Game.GetPlayer().AddItem(pRadAway, 2)
endif

; Add a map marker
Alias_MapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pWhiskey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
; set defend stage on defend quest
DLC03FarHarborS01Defend.SetStage(100)

; Track for the workshop achievement
pDLC03_Achievements.SetStage(671)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
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
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborS01Script
Quest __temp = self as Quest
DLC03:DLC03FarHarborS01Script kmyQuest = __temp as DLC03:DLC03FarHarborS01Script
;END AUTOCAST
;BEGIN CODE
; Also flag that you've talked with Uncle Ken
SetStage(400)

WorkshopNPCScript aKen = Alias_UncleKen.GetActorRef() as workshopNPCScript
pWorkshopParent.RemoveActorFromWorkshopPUBLIC(aKen)

; Register for the Change Location event
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Teleport Uncle Ken to the Last Plank
Alias_UncleKen.GetActorRef().MoveTo(pUncleKenAtLastPlankMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)

; Give a reward
Game.GetPlayer().AddItem(pDLC03FarHarborS01_FireInTheBellyRecipe)
Game.GivePlayerCaps(610)

; enable and assign settlers
WorkshopNPCScript npc01 = Alias_VisitorsCenterNPC01.GetActorRef() as WorkshopNPCScript
WorkshopNPCScript npc02 = Alias_VisitorsCenterNPC02.GetActorRef() as WorkshopNPCScript
npc01.Enable()
npc02.Enable()

WorkshopScript workshopRef = alias_workshop.GetRef() as workshopScript

workshopRef.WorkshopParent.AddActorToWorkshop(npc01, workshopRef)
workshopRef.WorkshopParent.AddActorToWorkshop(npc02, workshopRef)

; Update "Changing Tide"
pDLC03FarHarborM03.SetStage(775)

; End quest
SetStage(600)
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

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; If you fail here - you have to fail Changing Tide, too
pDLC03FarHarborM03.SetStage(9000)

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_UncleKen Auto Const Mandatory

Potion Property pStimpak Auto Const Mandatory

Potion Property pRadAway Auto Const Mandatory

Quest Property DLC03FarHarborS01Defend Auto Const Mandatory

Quest Property pDLC03FarHarborS01_Misc Auto Const Mandatory

Quest Property pDLC03IntroSceneLastPlank Auto Const Mandatory

workshopparentscript Property pWorkshopParent Auto Const Mandatory

ObjectReference Property pUncleKenAtLastPlankMarker Auto Const Mandatory

ReferenceAlias Property Alias_VisitorsCenterNPC01 Auto Const Mandatory

ReferenceAlias Property Alias_VisitorsCenterNPC02 Auto Const Mandatory

ReferenceAlias Property Alias_Workshop Auto Const Mandatory

Book Property pDLC03FarHarborS01_FireInTheBellyRecipe Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Potion Property pDLC03Vim_CaptainsBlend Auto Const Mandatory

Quest Property pDLC03_Achievements Auto Const Mandatory

Potion Property pWhiskey Auto Const Mandatory
