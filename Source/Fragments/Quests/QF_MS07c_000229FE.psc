;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07c_000229FE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set prereq stages
pDialogueDiamondCity.SetStage(170)
pMS07Intro.SetStage(400)
MQ202NickPostSurgery.SetStage(100)
pMQ104.Stop()
self.SetStage(2)

;Make Nick companion and give him high enough affinity and wrap up the resulting scene
FollowersScript.GetScript().SetCompanion(Alias_NickValentine.GetActorReference())
(Alias_NickValentine.GetActorRef() as CompanionActorScript).SetAffinity(999)
Alias_NickValentine.GetRef().SetValue(CA_CurrentThreshold, 750)
pCOMNickQuest.SetStage(407)
pCOMNickQuest.SetStage(420)
pCOMNickQuest.SetStage(497)
pMS07cGreetingHandler.SetStage(2)

;Move player and Nick to location
Utility.Wait(1.0)
Game.GetPlayer().Moveto(pPlayerTestMarker)
Alias_NickValentine.GetActorRef().MoveTo(pNickTestMarker)

;Remove Nick from captive faction so he fights Raiders
Alias_NickValentine.GetActorRef().RemoveFromFaction(pCaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Set prereq stages
pDialogueDiamondCity.SetStage(170)
pMQ104.Stop()
MQ202NickPostSurgery.SetStage(100)
self.SetStage(210)
self.SetStage(217)

;Spawn Eddie's gun
CustomItemQuest.SetStage(130)

;Disable South Boston Random Encounter trigger
Alias_SouthieRandomEncounterTrigger.GetRef().Disable()

;Make Nick companion and give him high enough affinity and wrap up the resulting scene
FollowersScript.GetScript().SetCompanion(Alias_NickValentine.GetActorReference())
(Alias_NickValentine.GetActorRef() as CompanionActorScript).SetAffinity(999)
Alias_NickValentine.GetRef().SetValue(CA_CurrentThreshold, 750)
pCOMNickQuest.SetStage(407)
pCOMNickQuest.SetStage(420)
pCOMNickQuest.SetStage(497)
Alias_NickValentine.GetActorRef().DisallowCompanion()
Alias_NickValentine.GetActorRef().EvaluatePackage()

;Remove Nick from captive faction to make him hostile to Raiders
Alias_NickValentine.GetActorRef().RemoveFromFaction(pCaptiveFaction)

;Move Nick and player to Andrew Station
Game.GetPlayer().MoveTo(pAudioTestMarker)
Alias_NickValentine.GetActorRef().MoveTo(pAudioTestNickMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Give player nine holotapes. Must talk to Nick for tenth
kmyQuest.iHolotapeCount += 9
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Spawn Eddie's gun
CustomItemQuest.SetStage(130)

;Close out greeting quest
pMS07cGreetingHandler.SetStage(100)

;Give player holotape and increment tape count
Game.GetPlayer().AddItem(Alias_Holotape01Cambridge.GetRef(), 1)
Game.GetPlayer().AddItem(pMS07WintersEndHolotape, 1)
Game.GetPlayer().AddItem(pMS07cCaseFile, 1)
kmyQuest.iHolotapeCount += 1

;Add any holotape collected prior to quest

kmyquest.iHolotapeCount = kmyquest.iHolotapeCount + (pMS07cTapes as MS07cTapesScript).iMS07cT_HolotapesCount


;Update objective count if player hasn't already found all the tapes
if kmyQuest.iHolotapeCount < 10
  self.ModObjectiveGlobal(kmyQuest.iHolotapeCount, MS07cHolotapeCountGlobal)

  ;If the player already has visited the Malden and BADTFL map marker or Cambridge terminal, don't show obj 10
  if (Alias_MaldenMapMarker.GetRef().IsMapMarkerVisible() && Alias_BADTFLMapMarker.GetRef().IsMapMarkerVisible()) || pMS07cTapes.GetStageDone(20)
    
  else 
    SetObjectiveDisplayed(10, 1)
  endif

  if Alias_MaldenMapMarker.GetRef().IsMapMarkerVisible() && Alias_BADTFLMapMarker.GetRef().IsMapMarkerVisible()
    self.setstage(11)
  endif

  SetObjectiveDisplayed(20, 1)
  kmyQuest.UpdateAlreadySeenTerminals()

endif

;Disable the random encounter trigger in Southie so that it doesn't interrupt Nick's scene
Alias_SouthieRandomEncounterTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Cambridge terminal links if not yet used

SetObjectiveCompleted(10, 1)

;Alias_BADTFLMapMarker.GetRef().AddToMap()
;Alias_MaldenMapMarker.GetRef().AddToMap()

;if !self.GetStageDone(200)
;  self.SetObjectiveDisplayed(20, abForce = true)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate BADTFL terminal links if not yet used

;Alias_FensMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(35)
  kmyquest.bTriggerOff[4] = 1
  
  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(30)
  kmyquest.bTriggerOff[4] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Malden terminal links if not yet used

;Alias_NahantMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(45)
  kmyquest.bTriggerOff[2] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(40)
  kmyquest.bTriggerOff[2] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Fens terminal links if not yet used

;Alias_SouthBostonMapMarker.GetRef().AddtoMap()
;Alias_NatickMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(55)
  kmyquest.bTriggerOff[9] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(50)
  kmyquest.bTriggerOff[9] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Nahant terminal links if not yet used

;Alias_EastBostonMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(65)
  kmyquest.bTriggerOff[6] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(60)
  kmyquest.bTriggerOff[6] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Southie terminal links if not yet used

;Alias_QuincyMapMarker.GetRef().AddtoMap()
;Alias_NahantMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(75)
  kmyquest.bTriggerOff[8] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(70)
  kmyquest.bTriggerOff[8] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate East Boston terminal links if not yet used

;Alias_SouthBostonMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(85)
  kmyquest.bTriggerOff[7] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(80)
  kmyquest.bTriggerOff[7] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Quincy terminal links if not yet used

;Alias_CoastGuardMapMarker.GetRef().AddtoMap()
;Alias_SouthBostonMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(95)
  kmyquest.bTriggerOff[3] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(90)
  kmyquest.bTriggerOff[3] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Coast Guard terminal links if not yet used

;Alias_QuincyMapMarker.GetRef().AddtoMap()
;Alias_NatickMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(105)
  kmyquest.bTriggerOff[10] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(100)
  kmyquest.bTriggerOff[10] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Activate Natick terminal links if not yet used

;Alias_CoastGuardMapMarker.GetRef().AddtoMap()

;If the tape has already been found, turn off auto-hiding of objectives
if self.GetStageDone(115)
  kmyquest.bTriggerOff[5] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;If the terminal has already been found, turn off auto-hiding of objectives
if self.GetStageDone(110)
  kmyquest.bTriggerOff[5] = 1

  if !kmyquest.bProcessingObjectives
    kmyquest.bAnyStationActive = 0
    kmyquest.iCurrentStationActive = 0
    kmyquest.iTriggerEntryCount = 0
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Set prereq stages
pDialogueDiamondCity.SetStage(170)
pMQ104.Stop()
MQ202NickPostSurgery.SetStage(100)
self.setStage(10)

;Make Nick companion and give him high enough affinity and wrap up the resulting scene
FollowersScript.GetScript().SetCompanion(Alias_NickValentine.GetActorReference())
(Alias_NickValentine.GetActorRef() as CompanionActorScript).SetAffinity(999)
Alias_NickValentine.GetRef().SetValue(CA_CurrentThreshold, 750)
pCOMNickQuest.SetStage(407)
pCOMNickQuest.SetStage(420)
pCOMNickQuest.SetStage(497)
pMS07cGreetingHandler.SetStage(2)


;Disable South Boston Random Encounter trigger
Alias_SouthieRandomEncounterTrigger.GetRef().Disable()

;Remove Nick from captive faction so he fights Raiders
Alias_NickValentine.GetActorRef().RemoveFromFaction(pCaptiveFaction)

;Move player and Nick to outside Andrew Station
Utility.Wait(0.5)
Game.GetPlayer().Moveto(pBunkerEntranceTestMarkerPlayer)
Alias_NickValentine.GetActorRef().MoveTo(pBunkerEntranceTestMarkerNick)

;Give player tapes they don't have yet
if !self.GetStageDone(10)
  Game.GetPlayer().AddItem(Alias_Holotape01Cambridge.GetRef(), 1)
endif

if !self.GetStageDone(35)  
  Game.GetPlayer().AddItem(Alias_Holotape00BADTFL.GetRef(), 1)
endif

if !self.GetStageDone(45)
  Game.GetPlayer().AddItem(Alias_Holotape02Malden.GetRef(), 1)
endif

if !self.GetStageDone(95)
  Game.GetPlayer().AddItem(Alias_Holotape03Quincy.GetRef(), 1)
endif

if !self.GetStageDone(115)
  Game.GetPlayer().AddItem(Alias_Holotape04Natick.GetRef(), 1)
endif

if !self.GetStageDone(65)
  Game.GetPlayer().AddItem(Alias_Holotape05Nahant.GetRef(), 1)
endif

if !self.GetStageDone(85)
  Game.GetPlayer().AddItem(Alias_Holotape06EastBoston.GetRef(), 1)
endif

if !self.GetStageDone(75)
  Game.GetPlayer().AddItem(Alias_Holotape07SouthBoston.GetRef(), 1)
endif

if !self.GetStageDone(55)
  Game.GetPlayer().AddItem(Alias_Holotape08Fens.GetRef(), 1)
endif

if !self.GetStageDone(105)
  Game.GetPlayer().AddItem(Alias_Holotape09CoastGuard.GetRef(), 1)
endif

self.setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(200, 1)

;Turn off ambient conversations for Raiders in Andrew Station
Alias_AndrewStationRaiders01.AddToFaction(MS07cRaiderNoEE_Faction)
Alias_AndrewStationRaiders02.AddToFaction(MS07cRaiderNoEE_Faction)
Alias_AndrewStationRaiders03.AddToFaction(MS07cRaiderNoEE_Faction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TakeAllTapes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
;Play reveal Audio
MUSReveal.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
Actor Nick = Alias_NickValentine.GetActorRef()
ObjectReference PlayerRef = Game.GetPlayer()
Actor Eddie = Alias_EddieWinter.GetActorRef()

;Activate Eddie Winter
Eddie.Enable()
Eddie.EvaluatePackage()

;If Nick was your companion, knock that off and make it so player can't get him back and pickpocket him
Nick.DisallowCompanion(SuppressDismissMessage = true)
Nick.SetCommandState(false)
Alias_NoPickpocketNick.ForceRefTo(Nick)

;Set Nick to Ignore friendly hits
Nick.IgnoreFriendlyHits()

;Block Nick from entering hatred/murder from here on out
NickCanHate.SetValue(0)
Valentine_MurderToggle.SetValue(0)

;If player is not in Andrew Station, disable Raiders in ref collection 01
if PlayerRef.GetParentCell() != AndrewStation01
  kmyquest.DisableRaiderCollection01()
endif 

;Disable trigger of enabled Raider near Eddie's bunker
Alias_EddieBunkerRaiderTrigger.GetRef().Disable()

;If Andrew Station Map Marker isn't visible, make it so
If Alias_AndrewStationMapMarker.GetRef().IsMapMarkerVisible() == False && PlayerRef.GetParentCell() != AndrewStation01
  Alias_AndrewStationMapMarker.GetRef().AddtoMap(true)
EndIf

;Turn on Nick's bunker trigger
Alias_NickBunkerTrigger.GetRef().Enable()

if Nick.GetParentCell() == AndrewStation01
  ;Set proper objectives
  SetObjectiveCompleted(200, 1)
  SetObjectiveDisplayed(217, 1)

  ;Set stage to get Nick moving to proper location
  SetStage(214)

else
  ;Set proper objectives
  SetObjectiveCompleted(200, 1)
  SetObjectiveDisplayed(210, 1)

  ;Turn on Nick's teleport triggers
  Alias_NickTeleportTriggerFront.GetRef().Enable()
  Alias_NickTeleportTriggerRear.GetRef().Enable() 
endif

;Get Nick moving
Nick.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().MoveTo(pNickStationWaitMarker)
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0216_Item_00
Function Fragment_Stage_0216_Item_00()
;BEGIN CODE
;If player hasn't already entered through main space, get Nick moving towards end location
if !self.GetStageDone(217)
  SetObjectiveCompleted(210, 1)
  SetObjectiveDisplayed(217, 1)

  Actor Nick = Alias_NickValentine.GetActorRef()

  ;Teleport Nick to Andrew Station rear entrance
  ;debug.trace("MS07c: Teleporting Nick, stage 216")
  Nick.ResetHealthandLimbs()
  Nick.MoveTo(oNickRearWaitMarker)
  Nick.EvaluatePackage()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0217_Item_00
Function Fragment_Stage_0217_Item_00()
;BEGIN CODE
;If player hasn't already entered through rear of space, kick off next stage
if !self.GetStageDone(216)
  SetObjectiveCompleted(210, 1)
  SetObjectiveDisplayed(217, 1)

  Actor Nick = Alias_NickValentine.GetActorRef()

  ;Teleport Nick to Andrew Station entrance if player hasn't entered from other end
  if Alias_NickValentine.GetRef().GetParentCell() == AndrewStation01

  else
    ;debug.trace("MS07c: Teleporting Nick, stage 217")
    Nick.ResetHealthandLimbs()
    Nick.MoveTo(pNickStationWaitMarker)
  endif

  Nick.EvaluatePackage()

  ;Play Nick's entry to area scene
  Utility.Wait(1.0)
  pNickWaitingBunkerScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0219_Item_00
Function Fragment_Stage_0219_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(pAudioTestMarker)
Alias_NickValentine.GetActorRef().MoveTo(pAudioTestNickMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Create enable layer
kmyquest.MS07cEnableLayer = InputEnableLayer.Create()

;Freeze player in place
kmyquest.MS07cEnableLayer.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = False, abJournalTabs = True, abVATS = True, abFavorites = True)

;Start failsafe timer to ensure player doesn't get stuck here
kmyquest.StartEddieDoorTimer()

;Put nearby Raiders in player neutral faction and stop combat
Actor Nick = Alias_NickValentine.GetActorRef()

Alias_AndrewStationRaiders01.AddToFaction(MS07cRaiderFaction)
Alias_AndrewStationRaiders03.AddToFaction(MS07cRaiderFaction)
Nick.AddToFaction(NickFaction)
kmyquest.StopRaiderCombat()

if !Alias_EddieWinter.GetActorRef().IsInCombat()
  Nick.StopCombatAlarm()
endif

Utility.Wait(0.25)

;Start keypad scene whether Nick is present or not
if self.GetStageDone(218)
  pMS07c_004_OpeningBunker.Start()
else
    pMS07c_004a_PlayerOpeningBunker.Start()

  ;Heal Nick and move him to catch up location
  Nick.ResetHealthandLimbs()
  Nick.MoveTo(pNickCatchUpMarker)
  Nick.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
pBunkerKeypadSounds.Play(Alias_BunkerKeypad.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Open the door and get Nick and Eddie into place for their scene
Alias_BunkerDoor.GetRef().Unlock()
Alias_BunkerDoor.GetRef().Activate(Game.GetPlayer())
SetObjectiveCompleted(217, 1)
SetObjectiveDisplayed(230, 1)
Alias_EddieWinter.GetActorRef().EvaluatePackage()

;Reenable player controls
kmyquest.MS07cEnableLayer = none

;Stop failsafe timer
kmyquest.CancelEddieDoorTimer()

;Turn off Nick's nicer combat lines for the upcoming fight
MS07cNickBattlingEddie.SetValue(1)

Actor Nick = Alias_NickValentine.GetActorRef()
Nick.EvaluatePackage()

;Stop combat for Raiders again
kmyquest.StopRaiderCombat()

;If Nick still hasn't arrived, try and move him again
if !GetStageDone(218)
  ;Heal Nick and move him to catch up location
  Nick.ResetHealthandLimbs()
  Nick.MoveTo(pNickCatchUpMarker)
  Nick.EvaluatePackage()
endif

;Play Eddie's startled scene
Utility.Wait(1)
MS07c_005_StartledEddie.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0231_Item_00
Function Fragment_Stage_0231_Item_00()
;BEGIN CODE
;If Eddie's forcegreet hasn't kicked off, start his shout scene
if !self.GetStageDone(232) && !self.GetStageDone(233)
  pEddieShoutScene.Start()
endif

Alias_EddieWinter.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0232_Item_00
Function Fragment_Stage_0232_Item_00()
;BEGIN CODE
Actor Nick = Alias_NickValentine.GetActorRef()
Actor EddieWinter = Alias_EddieWinter.GetActorRef()

;Teleport Nick is he's not already nearby
if !self.GetStageDone(218)
  Nick.ResetHealthandLimbs()
  Nick.MoveTo(pNickCatchUpMarker)
  Nick.EvaluatePackage()
  ;debug.trace("MS07c: Teleporting Nick")
endif

;If Eddie's in his shouting scene, kill it
if pEddieShoutScene.IsPlaying()
  pEddieShoutScene.Stop()
endif

;Have Eddie shout his attack line
MS07c_007_EddieAttackOnPlayerWalkAway.Start()

SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0233_Item_00
Function Fragment_Stage_0233_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Try ending combat again

if !Alias_EddieWinter.GetActorRef().IsInCombat()
  Alias_NickValentine.GetActorRef().StopCombatAlarm()
  kmyquest.StopRaiderCombat()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0234_Item_00
Function Fragment_Stage_0234_Item_00()
;BEGIN CODE
;Have Eddie and Nick enter combat
Actor EddieWinter = Alias_EddieWinter.GetActorRef()

;Have Eddie attack
EddieWinter.SetValue(Game.GetAggressionAV(), 2)
EddieFaction.SetPlayerEnemy()
EddieFaction.SetEnemy(PlayerFaction)
EddieFaction.SetEnemy(NickFaction)
EddieWinter.StartCombat(Game.GetPlayer())
EddieWinter.StartCombat(Alias_NickValentine.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
;If Nick's currently in combat, just jump Eddie to being in combat too
;if Alias_NickValentine.GetActorRef().IsInCombat()
;  self.SetStage(240)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;Remove nearby Raiders from neutral faction
Alias_AndrewStationRaiders01.RemoveFromFaction(MS07cRaiderFaction)
Alias_AndrewStationRaiders03.RemoveFromFaction(MS07cRaiderFaction)

;Get Eddie ready for combat and set him enemy to everyone involved

if !GetStageDone(232)
  Actor EddieWinter = Alias_EddieWinter.GetActorRef()

  EddieWinter.EvaluatePackage()
  EddieWinter.SetValue(Game.GetAggressionAV(), 2)
  EddieFaction.SetPlayerEnemy()
  EddieFaction.SetEnemy(PlayerFaction)
  EddieFaction.SetEnemy(NickFaction)
  Alias_NickValentine.GetActorRef().StartCombat(Alias_EddieWinter.GetActorRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Unlock door out of Andrew Station to allow Nick safe passage
pTrapDoor.Unlock()

;Pull Nick from Eddie/Andrew Station Raider netural faction
Alias_NickValentine.GetActorRef().RemoveFromFaction(NickFaction)

;Just in case it didn't take earlier, remove Raiders from neutral faction
Alias_AndrewStationRaiders01.RemoveFromFaction(MS07cRaiderFaction)

;Trigger "Nick Loves This" message (save actual affinity bump for final scene to trigger infatuation scene)
FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineKillsEddie)

;Have Nick play his wrap-up scene
Utility.Wait(2.0)
pMS07c_011_EddieDead.Start()

;Turn off Raiders around South Boston
;pGraveSceneRaidersMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Set objectives
SetObjectiveCompleted(230, 1)
SetObjectiveDisplayed(260, 1)

;Andrew Station Raiders can use EE conversations again
Alias_AndrewStationRaiders01.RemoveFromFaction(MS07cRaiderNoEE_Faction)
Alias_AndrewStationRaiders02.RemoveFromFaction(MS07cRaiderNoEE_Faction)
Alias_AndrewStationRaiders03.RemoveFromFaction(MS07cRaiderNoEE_Faction)

Alias_NickValentine.GetActorRef().EvaluatePackage()

;THIS IS GOING TO BE MOVED TO THE START OF NICK'S PRE-AFFINITY SCENE WHEN I CAN TEST IT
;Is Nick going to get bumped to Infatuation?
if (Alias_NickValentine.GetActorReference() as CompanionActorScript).TestEventForAffinityBump(CA_CustomEvent_ValentineCompletesQuest, T1_Infatuation)
  kmyquest.bNickEntersInfat = 1
endif

;Begin Nick's quest count down (24 game hours. At zero, quest ends and Nick starts heading home)
kmyQuest.StartNickTimer()
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0263_Item_00
Function Fragment_Stage_0263_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(pPlayerGraveTeleportMarker)
Alias_NickValentine.GetActorRef().MoveTo(pNickGraveTeleportMarker)
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
;If Nick unloads at this point, start his timer and teleport him to the grave marker
Alias_NickValentine.GetActorRef().MoveTo(pNickGraveMarker)
;Alias_NickValentine.GetActorRef().RemoveFromFaction(pHasBeenCompanionFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0267_Item_00
Function Fragment_Stage_0267_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Player and Nick both at the grave, cancel the timer and start final scene
Alias_NickValentine.GetActorRef().EvaluatePackage()
MS07c_012_NickGraveScene.Start()
kmyquest.bNicksGraveHellosBlocked = 1

;Prime the post-quest
pMS07cPostQuest.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN AUTOCAST TYPE MS07cScript
Quest __temp = self as Quest
MS07cScript kmyQuest = __temp as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Nick grave scene wrapped, make Nick infatuated with player and allow to be companion again
;debug.trace(self + "stage 280 about to call sendAffinityEvent")
NickCanInfatuation.SetValue(1)
FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineCompletesQuest)
;debug.trace(self + "stage 280 done calling sendAffinityEvent")

Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
;Readd Nick to HasBeenCompanionFaction and get him moving on the post-quest
Alias_NickValentine.GetActorRef().AllowCompanion(MakeCompanionIfNoneCurrently = false)
Alias_NickValentine.GetActorRef().EvaluatePackage()

;Close out all objectives
CompleteAllObjectives()

;Wrap up quest
self.setStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Nick grave scene timed out, close out quest
MS07c_012_NickGraveScene.Stop()
Alias_NickValentine.GetActorRef().AllowCompanion(MakeCompanionIfNoneCurrently = false)

;Bump Nick's Affinity
NickCanInfatuation.SetValue(1)

;Bump Nick's affiinty if it hasn't happened already
if !self.GetStageDone(280)
  FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineCompletesQuest)
endif

;Kill the post-quest
pMS07cPostQuest.SetStage(100)

;Wrap up quest
self.setStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
;If player was present for final scene...
if !self.GetStageDone(300)
  ;Make Nick companion-able again and get post-quest started
  Alias_NickValentine.GetActorRef().AllowCompanion(MakeCompanionIfNoneCurrently = false)
  Alias_NickValentine.GetActorRef().EvaluatePackage()
  CompleteAllObjectives()

  ;Bump Nick's Affinity
  NickCanInfatuation.SetValue(1)
  FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineCompletesQuest)

  ;Start pickup scene
  pMS07cPostQuest.SetStage(5)

  ;Wrap up quest
  self.setStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
pMS07cTapes.SetStage(300)
pMS07cKeypad.SetStage(100)
FailAllObjectives()

;Stop quest
self.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_02
Function Fragment_Stage_0600_Item_02()
;BEGIN CODE
pMS07cTapes.SetStage(300)
pMS07cKeypad.SetStage(100)
SetObjectiveCompleted(260, 1)

;Nick can hate/observe mruder again
NickCanHate.SetValue(1)
Valentine_MurderToggle.SetValue(1)

;Stop quest
self.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Turn back on Nick's nicer combat lines
MS07cNickBattlingEddie.SetValue(0)

;If Nick is not your companion, turn off IgnoreFriendlyHits
Actor Nick = Alias_NickValentine.GetActorRef()

if !Nick.IsInFaction(pCurrentCompanionFaction)
  Nick.IgnoreFriendlyHits(False)
endif

;Reactivate Southie Random Encounter Trigger
;NOW HANDLED BY SCRIPT ON TRIGGER ITSELF
;Alias_SouthieRandomEncounterTrigger.GetRef().Enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Holotape Property pWinterHolotape01 Auto Const

ReferenceAlias Property Alias_Holotape01Cambridge Auto Const

ReferenceAlias Property Alias_NickValentine Auto Const

ReferenceAlias Property Alias_BunkerDoor Auto Const

Scene Property pMS07c_004_OpeningBunker Auto Const

ReferenceAlias Property Alias_EddieWinter Auto Const

Faction Property PlayerFaction Auto Const

Faction Property NickFaction Auto Const

Faction Property EddieFaction Auto Const

Scene Property pMS07c_011_EddieDead Auto Const

Scene Property MS07c_012_NickGraveScene Auto Const

ObjectReference Property pPlayerTestMarker Auto Const

ObjectReference Property pNickTestMarker Auto Const

Faction Property pHasBeenCompanionFaction Auto Const

Quest Property pCOMNickQuest Auto Const

Quest Property pBoS100MiscCambridge Auto Const

Quest Property pMQ104 Auto Const

Quest Property pDiamondCityDialogue Auto Const

Faction Property pCurrentCompanionFaction Auto Const

GlobalVariable Property MS07cHolotapeCountGlobal Auto Const

sound Property pBunkerKeypadSounds Auto Const

ReferenceAlias Property Alias_BunkerKeypad Auto Const

ObjectReference Property pAudioTestMarker Auto Const

ObjectReference Property pAudioTestNickMarker Auto Const

Scene Property pNickAdmirationScene Auto Const

Scene Property pNickInfatuationScene Auto Const

Quest Property pMS07 Auto Const

GlobalVariable Property pNickGraveGlobal Auto Const

ObjectReference Property pNickGraveMarker Auto Const

ObjectReference Property pNickHomeMarker Auto Const

Quest Property pMS07cTapes Auto Const

Scene Property MS07c_005_StartledEddie Auto Const

ObjectReference Property pNickGraveTeleportMarker Auto Const

ObjectReference Property pPlayerGraveTeleportMarker Auto Const
Quest Property pDialogueDiamondCity Auto Const

Weapon Property pEddiesGun Auto Const

ReferenceAlias Property Alias_Holotape00BADTFL Auto Const

ReferenceAlias Property Alias_Holotape02Malden Auto Const

ReferenceAlias Property Alias_Holotape03Quincy Auto Const

ReferenceAlias Property Alias_Holotape04Natick Auto Const

ReferenceAlias Property Alias_Holotape05Nahant Auto Const

ReferenceAlias Property Alias_Holotape06EastBoston Auto Const

ReferenceAlias Property Alias_Holotape07SouthBoston Auto Const

ReferenceAlias Property Alias_Holotape08Fens Auto Const

ReferenceAlias Property Alias_Holotape09CoastGuard Auto Const

ObjectReference Property pBunkerEntranceTestMarkerNick Auto Const

ObjectReference Property pBunkerEntranceTestMarkerPlayer Auto Const

ReferenceAlias Property Alias_BADTFLMapMarker Auto Const

ReferenceAlias Property Alias_MaldenMapMarker Auto Const

ReferenceAlias Property Alias_QuincyMapMarker Auto Const

ReferenceAlias Property Alias_NatickMapMarker Auto Const

ReferenceAlias Property Alias_NahantMapMarker Auto Const

ReferenceAlias Property Alias_EastBostonMapMarker Auto Const

ReferenceAlias Property Alias_SouthBostonMapMarker Auto Const

ReferenceAlias Property Alias_FensMapMarker Auto Const

ReferenceAlias Property Alias_CoastGuardMapMarker Auto Const

Holotape Property pMS07WintersEndHolotape Auto Const

ObjectReference Property pNickStationWaitMarker Auto Const

Scene Property pNickWaitingBunkerScene Auto Const

Scene Property pNickArriveBunkerScene Auto Const

Book Property pMS07cCaseFile Auto Const

Faction Property pHasBeenCompanion Auto Const

Faction Property pCaptiveFaction Auto Const

ObjectReference Property pGraveSceneRaidersMarker Auto Const

ObjectReference Property pTrapDoor Auto Const

ReferenceAlias Property Alias_SouthieRandomEncounterTrigger Auto Const

ObjectReference Property pNickCatchUpMarker Auto Const

Scene Property pMS07c_004a_PlayerOpeningBunker Auto Const

Quest Property pMS07cPostQuest Auto Const

Quest Property pMS07cKeypad Auto Const

Scene Property pEddieShoutScene Auto Const

Quest Property pMS07Intro Auto Const

Quest Property pMQ201 Auto Const

ActorValue Property CA_CurrentThreshold Auto Const

GlobalVariable Property T2_Admiration Auto Const

Quest Property pMS07cGreetingHandler Auto Const

Keyword Property CA_CustomEvent_ValentineCompletesQuest Auto Const

GlobalVariable Property T1_Infatuation Auto Const

Quest Property Followers Auto Const

Keyword Property CA_CustomEvent_ValentineKillsEddie Auto Const

GlobalVariable Property NickCanInfatuation Auto Const

ReferenceAlias Property Alias_AndrewStationMapMarker Auto Const

Quest Property MQ202NickPostSurgery Auto Const

GlobalVariable Property NickCanHate Auto Const

MusicType Property MUSReveal Auto Const

Scene Property MS07c_007_EddieAttackOnPlayerWalkAway Auto Const

RefCollectionAlias Property Alias_AndrewStationRaiders01 Auto Const

Faction Property MS07cRaiderFaction Auto Const

GlobalVariable Property MS07cNickBattlingEddie Auto Const

ObjectReference Property oNickRearWaitMarker Auto Const

RefCollectionAlias Property Alias_AndrewStationRaiders03 Auto Const

Cell Property AndrewStation01 Auto Const

LocationAlias Property Alias_AndrewStationLocation Auto Const

Faction Property MS07cRaiderNoEE_Faction Auto Const

RefCollectionAlias Property Alias_AndrewStationRaiders02 Auto Const

ReferenceAlias Property Alias_NickBunkerTrigger Auto Const Mandatory

ReferenceAlias Property Alias_NickTeleportTriggerFront Auto Const Mandatory

ReferenceAlias Property Alias_NickTeleportTriggerRear Auto Const Mandatory

GlobalVariable Property Valentine_MurderToggle Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

Faction Property MS07cEddieWinterOwnerFaction Auto Const

ReferenceAlias Property Alias_NoPickpocketNick Auto Const Mandatory

Scene Property MS07c_010_EddieNick Auto Const

Scene Property MS07c_009_EddieWinter Auto Const

ReferenceAlias Property Alias_EddieBunkerRaiderTrigger Auto Const Mandatory
