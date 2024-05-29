;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ01_01000806 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Set Player has been to Diamond City
PlayerBeenToDiamondCity.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Start playing radio distress broadcast.
DLC01MQ01Radio.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Player is showing sympathy toward Ada for losing her friends.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Player is being heartless about Ada losing her friends
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Player agrees to help Ada on her mission against the Mechanist.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Player says this isn't their fight when Ada asks them for help against the Mechanist.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(2100) ; Listen to the Distress Call

If DLC01_CaravanSiteMarker.Is3DLoaded() == 0
   DLC01MQ01Caravan.SetStage(10)
   ;Alias_HostileRobots.AddRefCollection(DLC01MQ01Caravan.GetRefCollection(Alias_MechBots))
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
;Make this an active quest in the Pip-Boy.
SetActive()

SetObjectiveCompleted(2100)

;Before displaying objective to find the Caravan, make sure player hasn't triggered Rescue the Robot
;first
If IsObjectiveDisplayed(2300) == 0
   SetObjectiveDisplayed(2200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2200)
SetObjectiveDisplayed(2300)

;Set Stage on the radio quest to turn it off.
DLC01MQ01Radio.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_01
Function Fragment_Stage_2300_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(2100, False)
SetObjectiveDisplayed(2300)

;Set Stage on the radio quest to turn it off.
DLC01MQ01Radio.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2350_Item_00
Function Fragment_Stage_2350_Item_00()
;BEGIN CODE
;Start scene where Ada responds to player entering the area.
DLC01MQ01_2350_PlayerEnteredArea.Start()

;Set Stage 2300 if the player hasn't entered the trigger volume.
SetStage(2300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
;Set previous objectives to complete if the player bypassed them.
SetObjectiveCompleted(2100)
SetObjectiveCompleted(2200)
SetObjectiveCompleted(2300)
SetObjectiveDisplayed(2400)

;Enable random encounters and settlement attacks for the DLC.
DLC01RobotAttacksActive.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
;Give the player the Robot Workbench Schematic and display the unlock message.
DLC01MasterQuest.SetStage(320)

;Set Ada available as a companion.
Alias_Ada.GetActorRef().SetAvailableToBeCompanion()

;Also set actor values so Ada behaves appropriately
DLC01AdaRef.SetValue(DLC01RobotDefaultOff,1)
DLC01AdaRef.SetValue(DLC01PersonalityMode,1)
(DLC01AdaRef as Actor).AddToFaction(HasBeenCompanionFaction)
(DLC01AdaRef as Actor).RemoveFromFaction(DisallowedCompanionFaction)

SetObjectiveCompleted(2400)

;Startup next quest
DLC01MQ02.SetStage(10)

Game.AddAchievement(51)

;Allow mod unlocks for the Robot Workbench
DLC01AllowRobotModUnlocksGlobal.SetValue(1)

;Stop Quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC01MQ01Active Auto Const Mandatory
GlobalVariable Property PlayerBeenToDiamondCity Auto Const

ObjectReference Property CodsworthTalkMarker Auto Const
ObjectReference Property DLC01_CaravanSiteMarker Auto Const
ObjectReference Property DLC01AdaRef Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory
Faction Property DisallowedCompanionFaction Auto Const Mandatory
Faction Property CurrentCompanionFaction Auto Const

Quest Property Followers Auto Const
Quest Property DLC01MQ01Radio Auto Const Mandatory
Quest Property DLC01MQ01Caravan Auto Const
Quest Property DLC01MQ02 Auto Const Mandatory

ReferenceAlias Property Alias_Ada Auto Const Mandatory

Scene Property DLC01MQ01_2350_PlayerEnteredArea Auto Const Mandatory

ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory
ActorValue Property DLC01PersonalityMode Auto Const Mandatory

Message Property DLC01MQ01RobotWorkbenchUnlock Auto Const Mandatory

GlobalVariable Property DLC01AllowRobotModUnlocksGlobal Auto Const Mandatory

GlobalVariable Property DLC01RobotAttacksActive Auto Const Mandatory

Quest Property DLC01MasterQuest Auto Const Mandatory

RefCollectionAlias Property Alias_HostileRobots Auto Const Mandatory
