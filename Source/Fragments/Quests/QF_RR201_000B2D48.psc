;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR201_000B2D48 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Enable the worker synths in the tunnel
Alias_G981.GetActorRef().Enable()
Alias_GenericRebelSynths.EnableAll()

; Make the quest active by default
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Setting up necessary values to simulate getting to the Institute naturally
pPlayerBeenToInstitute.SetValueInt(1)
Game.GetPlayer().AddToFaction(pInstituteFaction)

; Close off Railroad Intro quests
pRR101.Stop()
pRR102.Stop()

SetStage(5)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(5)
SetStage(150)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetStage(5)
SetStage(10)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(5)
SetStage(10)
SetStage(15)
SetStage(350)
SetStage(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetStage(5)
SetStage(10)
SetStage(15)
SetStage(20)

SetStage(400)
SetStage(410)
SetStage(425)
SetStage(450)
SetStage(500)
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; This is called from RRAct3NonRR 
; This is the pointer to Underground Undercover if you went the Institute with the BoS or MM

; Objectives
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; Called from "MQ206RR_007_TeleportationScene" - get the encrypted holotape
pMQ206.SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Move Tinker and Dez back to the Railroad
Alias_Desdemona.GetActorRef().EvaluatePackage()
Alias_TinkerTom.GetActorRef().EvaluatePackage()
Utility.Wait(0.1)
Alias_Desdemona.GetActorRef().MoveTo(pDesdemonaHomeMarker)
Alias_TinkerTom.GetActorRef().MoveTo(pTinkerHomeMarker)

; Mark Desdemona as busy for now
pRRDesdemonaBusy.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Move Patriot to the meeting spot
Alias_Patriot.GetActorRef().MoveToPackageLocation()

; Objectives
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Start some banter
Alias_Patriot.GetActorRef().EvaluatePackage()
pRR201_Ambient_LiamWalk.Start()

; Enable Z1-14
Alias_Z114.GetActorRef().Enable()

; Have you finished the Institute infiltration already?
if ( pRR201InfiltrationComplete.GetValue() == 1 )
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(325)

; Start the conversation
pRR201_0350_MeetZ1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(325)
SetObjectiveCompleted(350)
SetObjectiveDisplayed(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(375)
SetObjectiveDisplayed(400)

; Flag that you talked with Dez, as well
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(425)

; Display a message box confirming what the player did
;pRR201ReportEntered.Show()

; Teleport Dez to near the terminal
Alias_Desdemona.GetActorRef().MoveTo(pRRM02_DezMarker)
Alias_PAM.GetActorRef().MoveTo(pRRM02_CarringtonMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(425)
SetObjectiveDisplayed(450)

; Desdemona is no longer busy
pRRDesdemonaBusy.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)

; Get the password note
Actor aPlayer = Game.GetPlayer()
ObjectReference oItem = aPlayer.PlaceAtMe(pRR201CodeDPassword)
aPlayer.AddItem(oItem)
Alias_CodeDefenderPassword.ForceRefTo(oItem)   ; Make it a quest object
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
if ( !GetStageDone(600) )   ; If you've already turned in the password, no objective for it
  SetObjectiveDisplayed(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(550)

; Give some XP
;Game.RewardPlayerXP(pXPActThreeSmall.GetValue() as int)

; Remove the password note
Game.GetPlayer().RemoveItem(pRR201CodeDPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Start a timer
kmyQuest.StartZ1Timer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(700)
SetObjectiveDisplayed(725)

; End the timer
kmyQuest.CancelZ1Timer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(725)
SetObjectiveDisplayed(750)

; Make the tunnel guards appear
Alias_TunnelGuards.EnableAll()
Debug.Trace("In the right place.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(775)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(775)

; Give final XP
;Game.RewardPlayerXP(pXPFactionSmall.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
; Check to see if X6-88 is loaded
if ( Alias_X688.GetActorRef().Is3DLoaded() )
  pInstKickOut.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(750)
SetObjectiveDisplayed(800)

; Ambient scene with the Tunnel synths
pRR201_0800_DeadOverseers.Start()

; Check to see if the player has already done Mass Fusion
if ( pInst306.GetStageDone(20) )
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
; Has Mass Fusion been completed?
if ( GetStageDone(1000) )
  SetStage(850)   ; If so a messenger is running up
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Spawn the messenger and have him run to Z1-14 to deliver his message
Actor aMessenger = Alias_SynthMessenger.GetActorRef()
aMessenger.Enable()
aMessenger.MoveTo(pRR201MessengerZ1SpawnMarker)
aMessenger.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)

if ( !GetStageDone(1000) )   ; Have you done the last Institute mission?
  SetObjectiveDisplayed(900)   ; If not - maintain cover
else
  SetObjectiveDisplayed(910)   ; If so, wait a day
  ; Start a timer
  kmyQuest.StartZ1Timer(910)
endif

; Make it so you can't go back to the tunnels - door inaccessible
pRR201ToCaveDoor.SetDestroyed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE RR201Script
Quest __temp = self as Quest
RR201Script kmyQuest = __temp as RR201Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(910)
SetObjectiveDisplayed(915)

; Enable the Synth Messenger
Alias_SynthMessenger.GetActorRef().Enable()

; End the timer
kmyQuest.CancelZ1Timer(910)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Enable the Synth Messenger
; (Only if the player was waiting on this.)
if ( GetStageDone(900) )
  Alias_SynthMessenger.GetActorRef().Enable()
  Alias_Z114.GetActorRef().MoveTo(pRR201Z1AtPlayerMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1025_Item_00
Function Fragment_Stage_1025_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(900)
SetObjectiveCompleted(915)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)

; If filling the armory isn't completed - remove that objective
if ( !IsObjectiveCompleted(775) )
  SetObjectiveDisplayed(775, FALSE, FALSE)
endif

; Enable "Precipice of War"
pRR304.SetStage(100)

; If Operation Ticonderoga is still running - fail it, too late, player
pRR301.SetStage(9000)

; Make it so you can't go back to the tunnels - door inaccessible
pRR201ToCaveDoor.SetDestroyed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

; Players gets RAILWAY RIFLE
Game.GetPlayer().AddItem(pLL_RailwayRifle)
Game.GetPlayer().AddItem(pAmmoRailwayRifle, 100)
pRRVendorRailwayRfileGiven.SetValue(0)   ; Used for Tinker Tom's shop (levelled list)
pLegendaryRailwayRifle.SetValue(0)           ; Legendary Railway Rifles can now be found

; Objectives
SetObjectiveCompleted(1100)
SetObjectiveFailed(775)      ; If you haven't given the rebels guns yet, it's too late

; Add an achievement
Game.AddAchievement(20)

; Disable the Synth Messenger
Alias_SynthMessenger.GetActorRef().Disable()

; End the quest
SetStage(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
; If filling the armory isn't completed - remove that objective
if ( !IsObjectiveCompleted(775) )
  SetObjectiveDisplayed(775, FALSE, FALSE)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
; Fire up the lost Act 3 quest
pRRAct3Lost.SetStage(100)

; Then fail quest
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Disable a bunch of people that aren't relevant
if ( !Game.GetPlayer().IsInLocation(pInstituteLocation) )
  if ( !Alias_Z114.GetActorRef().Is3DLoaded() )
    Alias_Z114.GetActorRef().Disable()
  endif
  Alias_G981.GetActorRef().Disable()
  Alias_SynthMessenger.GetActorRef().Disable()
  Alias_GenericRebelSynths.DisableAll()
  Alias_TunnelGuards.DisableAll()
endif

; Fail objectives and end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pRR201TomsHolotape Auto Const

ReferenceAlias Property Alias_Patriot Auto Const

GlobalVariable Property pPlayerBeenToInstitute Auto Const

Scene Property pRR201_0800_DeadOverseers Auto Const

ReferenceAlias Property Alias_Z114 Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

RefCollectionAlias Property Alias_TunnelGuards Auto Const

Faction Property pInstituteFaction Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

Message Property pRR201ReportEntered Auto Const

ObjectReference Property pRRM02_DezMarker Auto Const

Book Property pRR201CodeDPassword Auto Const

ReferenceAlias Property Alias_SynthMessenger Auto Const

Quest Property pRR303 Auto Const

ObjectReference Property pRR201ToCaveDoor Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

Ammo Property pAmmoRailwayRifle Auto Const

Quest Property pRR304 Auto Const

ReferenceAlias Property Alias_G981 Auto Const

RefCollectionAlias Property Alias_GenericRebelSynths Auto Const

Quest Property pRRAct3Lost Auto Const

Scene Property pRR201_Ambient_LiamWalk Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ObjectReference Property PRRM02_CarringtonMarker Auto Const

ReferenceAlias Property Alias_PAM Auto Const

Quest Property pRR301 Auto Const

GlobalVariable Property pRRVendorRailwayRfileGiven Auto Const

ObjectReference Property pRR201MessengerZ1SpawnMarker Auto Const

ObjectReference Property pDesdemonaHomeMarker Auto Const

ObjectReference Property pTinkerHomeMarker Auto Const

Quest Property pMQ206 Auto Const

Scene Property pRR201_0350_MeetZ1 Auto Const

GlobalVariable Property pLegendaryRailwayRifle Auto Const

ObjectReference Property pRR201Z1AtPlayerMarker Auto Const

Quest Property pInst305 Auto Const Mandatory

Quest Property pInst306 Auto Const Mandatory

GlobalVariable Property pRR201InfiltrationComplete Auto Const Mandatory

GlobalVariable Property pRRDesdemonaBusy Auto Const Mandatory

ReferenceAlias Property Alias_CodeDefenderPassword Auto Const Mandatory

LeveledItem Property pLL_RailwayRifle Auto Const Mandatory

ReferenceAlias Property Alias_X688 Auto Const Mandatory

Quest Property pCOMX688 Auto Const Mandatory

Quest Property pInstKickOut Auto Const Mandatory

Location Property pInstituteLocation Auto Const Mandatory
