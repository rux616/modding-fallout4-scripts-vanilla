;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR302_0002C8CB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE rr302script
Quest __temp = self as Quest
rr302script kmyQuest = __temp as rr302script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Change the map marker teleport spot
pPrydwenMapMarker.SetLinkedRef(pBoSAirportMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Teleport Tinker Tom to where he's waiting for this quest
Alias_TinkerTom.GetActorRef().MoveTo(pRR302BoSTinkerMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; *** This is RR304 STAGE 700 ***

; At this point both Deacon and Tinker Tom will go to the right spot on their Unload scripts

; Put Deacon and Tinker in a temp friendly faction to the BoS (so they don't aggro early)
Alias_Deacon.GetActorRef().AddToFaction(pRR302TempBoSFriends)
Alias_Deacon.GetActorRef().IgnoreFriendlyHits()
Alias_TinkerTom.GetActorRef().AddToFaction(pRR302TempBoSFriends)
Alias_TinkerTom.GetActorRef().IgnoreFriendlyHits()

; Turn off the propellor blades
Alias_Vertibird.GetActorRef().PlayIdle(pVertibirdPropellersOff)

;Start the Police Station's side of this quest.
DN130RR302.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Teleport to Ivy League Square
Alias_TinkerTom.GetActorRef().MoveTo(pRR302BoSTinkerMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Teleport to Ivy League Square
Alias_Deacon.GetActorRef().MoveTo(pRR302BoSGloryMarker)
Alias_Deacon.GetActorRef().EvaluatePackage()

; Flag that he's been talked to (so packages behave)
(pRR303 as RR303Script).bDeaconPostChurchTalk = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Get Tink and Deacon to follow the player now
Utility.Wait(0.1)
Alias_TinkerTom.GetActorRef().EvaluatePackage()
Alias_Deacon.GetActorRef().EvaluatePackage()

; Remove Deacon and Tinker from temp BoS friendly faction
Alias_Deacon.GetActorRef().RemoveFromFaction(pRR302TempBoSFriends)
Alias_TinkerTom.GetActorRef().RemoveFromFaction(pRR302TempBoSFriends)

; Make Deacon and Tinker protected for the moment
if ( !pInst306.GetStageDone(20) )    ; If you aren't being directed to kill them, make them essential
  Alias_Deacon.GetActorRef().GetActorBase().SetEssential()
  Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Setup objectives

; TODO: Make this a proper BoS Check
;if ( GetStageDone(1) )
   SetObjectiveCompleted(300)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Sync up with the meta-quest
RR304.SetStage(900)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR302PrepVbirdAV)

; Check to see if the reinforcements should spawn
;if ( GetStageDone(400) )
;   SetStage(300)

;endif

; Teleport Tinker Tom to the PD
;Alias_TinkerTom.GetActorRef().MoveTo(pDN130_TinkerTomWarpMarker)

;Utility.Wait(0.1)

; TODO: Make Tinker Tom go to an intercom and use it - then say this line
;pRR302_0500_TinkerTomIntercom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Setup objectives
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

;Trigger the Reinforcements.
DN130RR302.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
; Play the scene
pRR302_Ambient_VertibirdReaction.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Sync with master quest
RR304.SetStage(1000)

; Spin up the rotor blades
Alias_Vertibird.GetActorRef().PlayIdle(pVertibirdPropellersOn)

; Stop Tinker Tom searching for controls - act like a normal pilot now
actor aTinker = Alias_TinkerTom.GetActorRef()
aTinker.RemoveKeyword(pAnimFurnTinkerTom)
aTinker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
; Complete the active task
SetObjectiveCompleted(700)
SetObjectiveDisplayed(725)

SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Make Tink neutral so the whole world doesn't shoot him in the vertibird
Actor aTinker = Alias_TinkerTom.GetActorRef()
aTinker.AddToFaction(pRR302TempBoSFriends)
aTinker.SetGhost(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Give the player three explosives
;Game.GetPlayer().AddItem(pRR303TinkExplosives, 3)
Alias_TinkerTom.GetActorRef().RemoveItem(pRR303TinkExplosives, 3, FALSE, Game.GetPlayer())
Alias_TinkerTom.GetActorRef().RemoveItem(pRR303TinkExplosives, 1, TRUE, Game.GetPlayer())
Alias_TinkerTom.GetActorRef().RemoveItem(pRR303TinkExplosives, 1, TRUE, Game.GetPlayer())

; Change the map marker teleport spot
pPrydwenMapMarker.SetLinkedRef(pBoSAirportMapMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Unprotect Deacon and Tinker
;Alias_Deacon.GetActorRef().GetActorBase().SetEssential(FALSE)
;Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)

; Give the player some caps & gear
Game.GivePlayerCaps(500)
Game.GetPlayer().AddItem(pLL_PlasmaGun_Rifle)
Game.GetPlayer().AddItem(pPulseGrenade)
Game.GetPlayer().AddItem(pPlasmaGrenade, 2)
Game.GetPlayer().AddItem(pSuperStimpak, 2)

; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

;Update Global for Radio News
RadioDCRR302Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Quest is now over
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10100_Item_00
Function Fragment_Stage_10100_Item_00()
;BEGIN AUTOCAST TYPE rr302script
Quest __temp = self as Quest
rr302script kmyQuest = __temp as rr302script
;END AUTOCAST
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveDisplayed(100)

; In case you have somehow miraculously avoided Deacon this entire time - putting him in the proper followers faction
Alias_Deacon.GetActorRef().SetAvailableToBeCompanion()

; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

; Make Knight Rhys unprotected
Alias_KnightRhys.GetActorRef().GetActorBase().SetProtected(FALSE)

;Enable the vertibird on the Police Station roof
Actor aVertibird = Alias_Vertibird.GetActorRef()
aVertibird.Enable(TRUE)
Utility.Wait(0.1)

aVertibird.PlayIdle(pVertibirdPropellersOff)

; Turn V-bird into a ghost so you can shoot it
; Then remove it from the faction so it's not hostile to anyone
aVertibird.RemoveFromFaction(pBrotherhoodOfSteelFaction)
aVertibird.SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10200_Item_00
Function Fragment_Stage_10200_Item_00()
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Make everyone spring into action
Alias_RailroadHQDefenders.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10300_Item_00
Function Fragment_Stage_10300_Item_00()
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10400_Item_00
Function Fragment_Stage_10400_Item_00()
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(500)   ; Used to be 400 - but now just go to the Church
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10500_Item_00
Function Fragment_Stage_10500_Item_00()
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; If you've cleared the Catacombs already, advance quest
if ( GetStageDone(10600) )
  SetObjectiveDisplayed(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10600_Item_00
Function Fragment_Stage_10600_Item_00()
;BEGIN CODE
; Called from RR304
; Objectives
SetObjectiveCompleted(500)

; If you've cleared the Catacombs already, advance quest
if ( GetStageDone(10500) )
  SetObjectiveDisplayed(600)
endif

; Set up the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10700_Item_00
Function Fragment_Stage_10700_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Queue up the current quest
SetStage(100)

; Enable Deacon (just in case)
Alias_Deacon.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10800_Item_00
Function Fragment_Stage_10800_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

; Queue up the current quest
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10900_Item_00
Function Fragment_Stage_10900_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)

; For debug purposes call the local stage
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10950_Item_00
Function Fragment_Stage_10950_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(900)
SetObjectiveDisplayed(950)

; For debug purposes call the local stage
SetStage(725)

; Make Tinker play his scene getting the vertibird prepped
pRR302_0800a_TinkerPreFlight.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_11000_Item_00
Function Fragment_Stage_11000_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(950)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_11100_Item_00
Function Fragment_Stage_11100_Item_00()
;BEGIN CODE
; ; Called from RR304
; Objectives
SetObjectiveCompleted(1000)

; Close the quest
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
; Fail all objectives and end
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TinkerTom Auto Const

ObjectReference Property pRR302BoSTinkerMarker Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ObjectReference Property pRR302BoSGloryMarker Auto Const

ReferenceAlias Property Alias_StationLeader Auto Const

ReferenceAlias Property Alias_GenericBoSKnight Auto Const

ReferenceAlias Property Alias_KnightHaylen Auto Const

ObjectReference Property pTinkerHomeMarker Auto Const

ObjectReference Property pGloryHomeMarker Auto Const

ReferenceAlias Property Alias_RailroadAgent01 Auto Const

ReferenceAlias Property Alias_RailroadAgent02 Auto Const

ReferenceAlias Property Alias_RailroadAgent03 Auto Const

Scene Property pRR302_0500_TinkerTomIntercom Auto Const

Quest Property DN130 Auto Const

Quest Property DN130RR302 Auto Const

Faction Property pPlayerFaction Auto Const

Faction Property pBrotherhoodofSteelFaction Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

ObjectReference Property pDN130_TinkerTomWarpMarker Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

Quest Property RR304 Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const

Scene Property pRR302_0800a_TinkerPreFlight Auto Const

MiscObject Property pRR303TinkExplosives Auto Const

Armor Property pArmor_RR303BoSDisguise Auto Const

Faction Property pRR302TempBoSFriends Auto Const

Weapon Property pPulseGrenade Auto Const

Weapon Property pPlasmaGrenade Auto Const

Potion Property pSuperStimpak Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCRR302Ready Auto Const

Keyword Property pisTinkerTom Auto Const

ReferenceAlias Property Alias_KnightRhys Auto Const

Quest Property pRR303 Auto Const

RefCollectionAlias Property Alias_RailroadHQDefenders Auto Const

Faction Property pHasBeenCompanionFaction Auto Const

Scene Property pRR302_Ambient_VertibirdReaction Auto Const

Idle Property pVertibirdPropellersOff Auto Const

Idle Property pVertibirdPropellersOn Auto Const

LeveledItem Property pLL_PlasmaGun_Rifle Auto Const

Keyword Property pAnimFurnTinkerTom Auto Const

Quest Property pInst306 Auto Const

ActorValue Property COMQC_RR302PrepVbirdAV Auto Const

ObjectReference Property pBoSAirportMapMarker Auto Const Mandatory

ObjectReference Property pPrydwenMapMarker Auto Const
