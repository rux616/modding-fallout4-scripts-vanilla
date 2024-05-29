;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborS03_0102399F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; End the main quest that could screw with this one
pDLC03MQ02.Stop()

; End FF03a
pDLC03FarHarborFF03a.Stop()

; Queue up this quest
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Create the Harbormen clothing reward
ObjectReference oItem = Alias_Mariner.GetActorRef().PlaceAtMe(pDLC03_MarinerReward)
oItem.AttachMod(pmod_Legendary_Armor_LessDMGBugs)
Alias_HarbormenClothing.ForceRefTo(oItem)
oItem.Disable()

; Make sure Avery isn't talking with Pearl from now on
pDLC03_V118_MiscObjectives.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Update "Changing Tide"
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Close off the pointer quest
pDLC03FarHarborS03c_Misc.SetStage(100)

; Update "Changing Tide"
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(950)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Called from script - DLC03NakanoShipWheelACTScript

; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Make the Red Death spawn
Alias_RedDeath.GetActorRef().Enable()
Alias_RedDeath.GetActorRef().SetValue(pHealth, 10.0)

; Start the Mariner using the radio to talk to the player
pDLC03FarHarborS03_200a_LeavingDocks.Start()

; Teleport the Mariner behind the player in the boat
;Alias_Mariner.GetActorRef().MoveTo(Game.GetPlayer(), 3.0, 3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Play the scene
pDLC03FarHarborS03_200_ShipScene.Start()

; Teleport the Mariner to the island
Alias_Mariner.GetActorRef().MoveTo(pFHS03MarinerAtRedMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Teleport the Mariner to the island
Alias_Mariner.GetActorRef().MoveTo(pFHS03MarinerAtRedMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
if ( GetStageDone(400) )
  SetObjectiveCompleted(350)
  SetObjectiveDisplayed(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
if ( GetStageDone(350) )    ; Different objectives depending on whether the Red Death is killed
  SetObjectiveDisplayed(400)
else
  SetObjectiveDisplayed(350)
endif

; Player gets custom outfit reward
ObjectReference oItem = Alias_HarbormenClothing.GetRef()
oItem.Enable()
Game.GetPlayer().AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(450)

; Teleport the Mariner to the dock
Alias_Mariner.GetActorRef().MoveTo(pS03MarinerDockSceneMarker)
Alias_Crowd01.GetActorRef().MoveTo(pS03Crowed01DockSceneMarker)
Alias_Crowd02.GetActorRef().MoveTo(pS03Crowed02DockSceneMarker)

; Start the Crowd scene
pDLC03FarHarborS03_500a_HomecomingIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(450)

; Disable the start scene trigger
pDLC03FHS03EndSceneTrigger.Disable()

; Update "Changing Tide"
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(975)
endif

; If the Mariner is dealing with cancer with the player, there's another beat
; (and Avery is still alive)
if ( pDLC03MarinerSupportedByPC.GetValue() == 0 && pDLC03AveryDeposedOrDead.GetValue() == 0 )
  SetStage(560)
  SetStage(600)
else
  SetObjectiveDisplayed(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
CompleteAllObjectives()

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
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

Quest Property pDLC03MQ02 Auto Const Mandatory

ReferenceAlias Property Alias_Mariner Auto Const Mandatory

ObjectReference Property pFarHarborS03MarinerIslandBoatMarker Auto Const Mandatory

Scene Property pDLC03FarHarborS03_200_ShipScene Auto Const Mandatory

Quest Property pDLC03FarHarborS03c_Misc Auto Const Mandatory

GlobalVariable Property pDLC03MarinerSupportedByPC Auto Const Mandatory

GlobalVariable Property pDLC03AveryDeposedOrDead Auto Const Mandatory

ReferenceAlias Property Alias_RedDeath Auto Const Mandatory

ObjectReference Property pFHS03MarinerAtRedMarker Auto Const Mandatory

Scene Property pDLC03FarHarborS03_200a_LeavingDocks Auto Const Mandatory

Quest Property pDLC03FarHarborFF03a Auto Const Mandatory

ObjectReference Property pS03MarinerDockSceneMarker Auto Const Mandatory

Scene Property pDLC03FarHarborS03_500a_HomecomingIntro Auto Const Mandatory

ObjectReference Property pS03Crowed02DockSceneMarker Auto Const Mandatory

ObjectReference Property pS03Crowed01DockSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_Crowd01 Auto Const Mandatory

ReferenceAlias Property Alias_Crowd02 Auto Const Mandatory

Armor Property pDLC03_MarinerReward Auto Const Mandatory

ObjectMod Property pmod_Legendary_Armor_LessDMGBugs Auto Const Mandatory

ReferenceAlias Property Alias_HarbormenClothing Auto Const Mandatory

ActorValue Property pHealth Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Quest Property pDLC03_V118_MiscObjectives Auto Const Mandatory

ObjectReference Property PDLC03FHS03EndSceneTrigger Auto Const Mandatory
