;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborS02_0100AEC3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Set global that flags it's ready
pDLC03FarHarborBerthaReady.SetValue(1)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Make it so that Bertha's intro scene doesn't play
; REASON: If you've missed the establishing shot by now, it's too late. She's got quest duties to perform.
pDLC03IntroSceneSmallBertha.SetStage(200)

; If Echo Mill is already cleared, let the quest know
if ( Alias_EnemyBosses.GetCount() == 0 )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Close pointer quest
pDLC03FarHarborS02_Misc.SetStage(100)

; Update "Changing Tide"
pDLC03FarHarborM03.SetStage(850)

; Add a map marker
Alias_EchoLakeMapMarker.GetRef().AddToMap()

; If you've already cleared things, update the objectives
if ( GetStageDone(200) )
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(100) )
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(200)
endif

; Make the Trapper appear (if you're on the quest)
if ( GetStageDone(100) )
  Alias_Malcolm.GetActorRef().Enable()
  Alias_Malcolm.GetActorRef().EvaluatePackage()
endif

; Make sure Avery isn't talking with Pearl from now on
pDLC03_V118_MiscObjectives.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Make Malcolm attack
actor aMalcolm = Alias_Malcolm.GetActorRef()
aMalcolm.AddToFaction(pPlayerEnemyFaction)
aMalcolm.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
; The player gets a bribe
Game.GivePlayerCaps(615)

SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Make sure Avery is cleared for duty here
pDLC03ConvFarHarborChildrenExecution.SetStage(300)   ; If you've missed the execution so far, it goes away
if ( pDLC03FarHarborS03.GetStageDone(100) )  ; If the Great Hunt is running
  pDLC03FarHarborS03.SetStage(150)   ; Make it so Avery doesn't say her thing
endif

; Teleport Captain Avery to Teddy Wright
Alias_CaptainAvery.GetActorRef().MoveTo(pS02CaptainMarker)

; Play the walking over to Captain scene
pDLC03FarHarborS02_300b_WalkingToCaptain.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; Clean up objectives
SetObjectiveDisplayed(200, FALSE)
CompleteQuest()

; Close off "Changing Tide"
pDLC03FarHarborM03.SetStage(9000)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)

; Play the finale scene
;pDLC03FarHarborS02_300c_BigQuestTurnIn.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; If you didn't make a deal with Malcolm OR warned Bertha OR Malcolm was killed
actor aMalcolm = Alias_Malcolm.GetActorRef()
if ( !GetStageDone(230) || GetStageDone(310) || aMalcolm.IsDead() )
  SetStage(425)
endif

Game.GivePlayerCaps(410)

; Update "Changing Tide"
pDLC03FarHarborM03.SetStage(875)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
; workshop owned by player
DLC03EchoLakeLumberWorkshopRef.SetOwnedByPlayer(true)
; enable fog condensers
DLC03EchoLakeEnableMarker.Enable()
; enable and assign NPCs
; enable and assign settlers
WorkshopNPCScript npc01 = Alias_EchoLakeNPC01.GetActorRef() as WorkshopNPCScript
WorkshopNPCScript npc02 = Alias_EchoLakeNPC02.GetActorRef() as WorkshopNPCScript
WorkshopNPCScript npc03 = Alias_EchoLakeNPC03.GetActorRef() as WorkshopNPCScript
npc01.Enable()
npc02.Enable()
npc03.enable()

DLC03EchoLakeLumberWorkshopRef.WorkshopParent.AddActorToWorkshop(npc01, DLC03EchoLakeLumberWorkshopRef)
DLC03EchoLakeLumberWorkshopRef.WorkshopParent.AddActorToWorkshop(npc02, DLC03EchoLakeLumberWorkshopRef)
DLC03EchoLakeLumberWorkshopRef.WorkshopParent.AddActorToWorkshop(npc03, DLC03EchoLakeLumberWorkshopRef)

; Flag for the DLC03 workshop achievement
pDLC03_Achievements.SetStage(673)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Alias_SmallBertha.GetActorRef().Disable()   ; Bertha & Tony disappear
Alias_Tony.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; If you made a deal with Malcolm AND didn't warn Bertha
if ( GetStageDone(230) && !GetStageDone(310) )
  SetStage(440)
endif

; Close the quest
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_Malcolm.GetActorRef().Disable()
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

GlobalVariable Property pDLC03FarHarborBerthaReady Auto Const Mandatory

Quest Property pDLC03IntroSceneSmallBertha Auto Const Mandatory

Scene Property pDLC03FarHarborS02_300b_WalkingToCaptain Auto Const Mandatory

Scene Property pDLC03FarHarborS02_300c_BigQuestTurnIn Auto Const Mandatory

workshopscript Property DLC03EchoLakeLumberWorkshopRef Auto Const Mandatory

ObjectReference Property DLC03EchoLakeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_EchoLakeNPC01 Auto Const Mandatory

ReferenceAlias Property Alias_EchoLakeNPC02 Auto Const Mandatory

ReferenceAlias Property Alias_EchoLakeNPC03 Auto Const Mandatory

Quest Property pDLC03FarHarborS02_Misc Auto Const Mandatory

ReferenceAlias Property Alias_Malcolm Auto Const Mandatory

Faction Property pPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_SmallBertha Auto Const Mandatory

ReferenceAlias Property Alias_Tony Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Quest Property pDLC03_V118_MiscObjectives Auto Const Mandatory

ReferenceAlias Property Alias_CaptainAvery Auto Const Mandatory

ObjectReference Property pS02CaptainMarker Auto Const Mandatory

ReferenceAlias Property Alias_EchoLakeMapMarker Auto Const Mandatory

Quest Property pDLC03_Achievements Auto Const Mandatory

RefCollectionAlias Property Alias_EnemyBosses Auto Const Mandatory

Quest Property pDLC03ConvFarHarborChildrenExecution Auto Const Mandatory

Quest Property pDLC03FarHarborS03 Auto Const Mandatory
