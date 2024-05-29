;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_NukeHandling_01015366 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Don't trigger nuke objectives if:
;1. High Confessor's been convinced to meet the player for replacement
;2. Wind farm has already been brought down

HarborGrandHotelMapMarker.AddToMap()

if !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ04.SetStage(260)

  ;If MQ06 isn't running, start it now
  if !DLC03MQ06.IsRunning()
    DLC03MQ06.Start()
  endif
endif

;If the player's already in the Harbor Grand hotel, go ahead and set stage 7
if Game.GetPlayer().GetParentCell() == DLC03HarborGrandHotel01
  SetStage(7)
endif

;Add synth High Confessor and High Confessor Guards to Nucleus Citizens
Alias_NucleusCitizens.AddRef(Alias_HCGuard01.GetRef())
Alias_NucleusCitizens.AddRef(Alias_HCGuard02.GetRef())
Alias_NucleusCitizens.AddRef(Alias_HighConfessorSynth.GetRef())

;If Gwyneth has returned to the Nucleus, add her to group
if DLC03CoA_AtomM02EndState.GetValue() == 1
  Alias_NucleusCitizens.AddRef(Alias_SisterGwyneth.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Player has reached Grand Harbor Hotel. Kill obj in MQ04 and start MQ06
DLC03MQ04.SetStage(270)

if !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ06.SetStage(10)
  DLC03MQ06.SetActive(true)
  DLC03MQ04.SetActive(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Update stage in DLC03MQ06 if quest is running
if DLC03MQ06.IsRunning() && !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ06.SetStage(100)
endif

;Enable Fog Crawler
Alias_DocksFogCrawler.GetRef().Enable()

;If it didn't get set earlier, kill the objective now
DLC03MQ04.SetStage(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Give player safe key
Game.GetPlayer().AddItem(DLC03M06_SafeCombination, 1, true)

;Add Fring Cove to their map
FringeCoveMapMarker.AddToMap()

;Update stage in DLC03MQ06 if quest is running
if DLC03MQ06.IsRunning() && !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ06.SetStage(130)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_NukeHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_NukeHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_NukeHandlingScript
;END AUTOCAST
;BEGIN CODE
;Update stage in DLC03MQ06 if quest is running
if DLC03MQ06.IsRunning() && !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ06.SetStage(150)
endif

;If player has been kicked out of Children, turn on additional guards
if DLC03CoA_PlayerKickedOutofCoA.GetValue() >= 1 && kmyquest.GetCoAAliveCount() < DLC03MQ06_NucleusReinforcementsThreshold.GetValue()
  Alias_BackupEntranceGuard03.GetRef().Enable()
  Alias_BackupEntranceGuard04.GetRef().Enable()
  Alias_BackupEntranceGuard05.GetRef().Enable()
  Alias_BackupEntranceGuard06.GetRef().Enable()
  Alias_BackupEntranceGuard07.GetRef().Enable()
endif

;Turn on back up exterior guards if current ones are dead
if Alias_NucleusEntranceGuardF01.GetActorRef().IsDead()
  Alias_BackupEntranceGuard01.GetRef().Enable()
endif

;Turn on back up exterior guards if current ones are dead
if Alias_NucleusEntranceGuardM01.GetActorRef().IsDead()
  Alias_BackupEntranceGuard02.GetRef().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_NukeHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_NukeHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_NukeHandlingScript
;END AUTOCAST
;BEGIN CODE
;Request save
DLC03MQ06_NukeHandlingSavingMsg.Show()
Utility.Wait(0.5)
Game.RequestSave()

;Activate state change
DLC03MQ06_NukeHandling_LaunchCountDown.Start()
;OBJVault111Klaxon2DLPM.Play(Alias_Klaxon.GetRef())
SubInteriorMarker.Enable()

;Disable player's ability to fast travel
kmyquest.DisablePlayerFastTravel()

;Start failsafe timers
kmyquest.StartShortFailSafeNukeTimer()
kmyquest.StartLongFailSafeNukeTimer()

;Start timer to open nuke tube hatch
kmyquest.StartOpenHatchTimer()

;Turn off Grand Zealot protected
Alias_GrandZealot.GetActorRef().GetActorBase().SetProtected(false)

;Update objectives in MQ06 if running
if DLC03MQ06.IsRunning() && !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
  DLC03MQ06.SetStage(210)
endif

;If player hasn't convinced the Children this is the right thing to do,
;of the player has convinced them this was the right thing to do and then completed the quest,
;kick the player out of the CoA
if (!DLC03MQ06.GetStageDone(200) || DLC03MQ06.GetStageDone(200) && DLC03MQ06_WindFarmHandling.GetStageDone(50)) && !DLC03CoA_Kickout.GetStageDone(700)
  Actor HC = Alias_HighConfessor.GetActorRef()
  HC.ChangeAnimArchetype(AnimArchetypeShocked)
  HC.ChangeAnimFaceArchetype(AnimFaceArchetypeAngry)
  DLC03MQ06_NukeHandling_HighConfessorShouts.Start()
  Utility.Wait(3.0)
  DLC03CoA_Kickout.SetStage(700)
  SetStage(103)
else
  ;Otherwise play the scene for the interior guard if she's alive and not in combat
  Actor SIG = Alias_SubInteriorGuard.GetActorRef()

  if !SIG.IsDead() && !SIG.IsInCombat()
    DLC03MQ06_NukeHandling_SubInteriorGuardScene.Start()
  endif
endif

;Send event for triggering nuke shutdown
kmyquest.SendNukeCountdownEvent()

;If DLC03MQ06a is running, fail it
if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(780)
endif

;Shut down MQ04 if it's still running
if DLC03MQ04.IsRunning()
  DLC03MQ04.SetStage(1000)
endif

;If AtomM02 is running, kill it now
if DLC03AtomM02.IsRunning()
  DLC03AtomM02.SetStage(800)
endif

;Get the custom music playing
DLC03MUSSpecialDestroyTheNucleus.Add()

;Start companion comment scene
DLC03MQ06_NukeHandling_CompanionReact_Stage_100.Start()

;Block activation on Sister Gwyneth if she's alive
if DLC03CoA_AtomM02EndState.GetValue() == 1
  Actor Gwyn = Alias_SisterGwyneth.GetActorRef()
  if !Gwyn.IsDead() && !Gwyn.IsDisabled() && Gwyn.GetCurrentLocation() == DLC03NucleusLocation
    Gwyn.BlockActivation(true, true)
  endif
endif

;Get exterior guard into new position
Alias_NucleusEntranceGuardM01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_InteriorNuke.GetRef().PlayAnimation("OpenHatch")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Seal the doors
ObjectReference IntDoors = Alias_BlastDoorInt.GetRef()
DRSFacilityXBlastClose.Play(IntDoors)
IntDoors.SetOpen(false)
IntDoors.Lock()
IntDoors.SetLockLevel(254)
IntDoors.BlockActivation(true, true)

ObjectReference ExtDoors = Alias_BlastDoorExt.GetRef()
DRSFacilityXBlastClose.Play(ExtDoors)
ExtDoors.SetOpen(false)
ExtDoors.Lock()
ExtDoors.SetLockLevel(254)
ExtDoors.BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_NukeHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_NukeHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_NukeHandlingScript
;END AUTOCAST
;BEGIN CODE
;Set "Nucleus Destroyed" global
DLC03MQ06_NucleusDestroyed.SetValue(1)

;If player is still in bay, fire off nuke
Actor Player = Game.GetPlayer()
if  Player.GetParentCell() == DLC03Nucleus || Player.GetParentCell() == DLC03NucleusMemoryBanks01 || Player.GetParentCell() == DLC03NucleusSubInterior 
  kmyquest.TriggerInteriorExplosion()
else

  ;If player hasn't already completed DLC03MQ06, complete it now
  if DLC03MQ06.IsRunning() && !DLC03MQ06a.GetStageDone(300) && DLC03MQ06_WindFarmDestroyed.GetValue() <= 0
    DLC03MQ06.SetStage(250)
  endif
  
  ;If the player's outside the cells and their companions aren't, move them outside
  Actor Companion = Alias_Companion.GetActorRef()
  Cell CPC = Companion.GetParentCell()
  if CPC == DLC03Nucleus || CPC == DLC03NucleusMemoryBanks01  || CPC == DLC03NucleusSubInterior 
    Companion.MoveTo(CompanionMarker)
  endif

  Actor Dogmeat = Alias_DogmeatCompanion.GetActorRef()
  Cell DPC = Dogmeat.GetParentCell()
  if DPC == DLC03Nucleus || DPC == DLC03NucleusMemoryBanks01 || DPC == DLC03NucleusSubInterior 
    Dogmeat.MoveTo(DogmeatMarker)
  endif

  ;Trigger exterior explosion and disable citizens
  kmyquest.TriggerExteriorExplosion()
  
;Start companion comment scene
DLC03MQ06_NukeHandling_CompanionReact_Stage_150.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_NukeHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_NukeHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_NukeHandlingScript
;END AUTOCAST
;BEGIN CODE
;Just in case it didn't get enabled earlier...
kmyquest.EnablePlayerFastTravel()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06 Auto Const Mandatory

Cell Property DLC03Nucleus Auto Const Mandatory

Cell Property DLC03NucleusMemoryBanks01 Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ReferenceAlias Property Alias_DogmeatCompanion Auto Const Mandatory

ObjectReference Property CompanionMarker Auto Const 

ObjectReference Property DogmeatMarker Auto Const

Scene Property DLC03MQ06_NukeHandling_LaunchCountDown Auto Const Mandatory

RefCollectionAlias Property Alias_NucleusCitizens Auto Const Mandatory

Sound Property DRSFacilityXBlastClose Auto Const Mandatory

ReferenceAlias Property Alias_BlastDoorInt Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Sound Property OBJVault111Klaxon2DLPM Auto Const Mandatory

ReferenceAlias Property Alias_Klaxon Auto Const Mandatory

ReferenceAlias Property Alias_BlastDoorExt Auto Const Mandatory

Scene Property DLC03MQ06_NukeHandling_HighConfessorShouts Auto Const

GlobalVariable Property DLC03MQ06_NucleusDestroyed Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

GlobalVariable Property DLC03MQ06_WindFarmDestroyed Auto Const Mandatory

GlobalVariable Property DLC03MQ06_ConfessorReplaced Auto Const Mandatory

Quest Property DLC03CoA_Kickout Auto Const Mandatory

Key Property DLC03M06_SafeCombination Auto Const Mandatory

ObjectReference Property HarborGrandHotelMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_GrandZealot Auto Const Mandatory

ReferenceAlias Property Alias_HighConfessor Auto Const Mandatory

Cell Property DLC03NucleusSubInterior Auto Const Mandatory

ReferenceAlias Property Alias_InteriorNuke Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

Quest Property DLC03MQ04 Auto Const Mandatory

ReferenceAlias Property Alias_DocksFogCrawler Auto Const Mandatory

Scene Property DLC03MQ06_NukeHandling_CompanionReact_Stage_100 Auto Const Mandatory

Scene Property DLC03MQ06_NukeHandling_CompanionReact_Stage_150 Auto Const Mandatory

ObjectReference Property SubInteriorMarker Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

ObjectReference Property PostKeyGuardEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_NucleusEntranceGuardF01 Auto Const Mandatory

ReferenceAlias Property Alias_NucleusEntranceGuardM01 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard02 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard03 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard04 Auto Const Mandatory

ObjectReference Property FringeCoveMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_SubInteriorGuard Auto Const Mandatory

Scene Property DLC03MQ06_NukeHandling_SubInteriorGuardScene Auto Const Mandatory

Cell Property DLC03HarborGrandHotel01 Auto Const Mandatory

ReferenceAlias Property Alias_HighConfessorSynth Auto Const Mandatory

GlobalVariable Property DLC03MQ06_NucleusReinforcementsThreshold Auto Const Mandatory

ReferenceAlias Property Alias_SisterGwyneth Auto Const Mandatory

GlobalVariable Property DLC03CoA_AtomM02EndState Auto Const Mandatory

Location Property DLC03NucleusLocation Auto Const Mandatory

ReferenceAlias Property Alias_HCGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_HCGuard02 Auto Const Mandatory

Message Property DLC03MQ06_NukeHandlingSavingMsg Auto Const Mandatory

Keyword Property AnimArchetypeShocked Auto Const Mandatory

Keyword Property AnimFaceArchetypeAngry Auto Const Mandatory

Quest Property DLC03MQ06_WindFarmHandling Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard05 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard06 Auto Const Mandatory

ReferenceAlias Property Alias_BackupEntranceGuard07 Auto Const Mandatory

MusicType Property DLC03MUSSpecialDestroyTheNucleus Auto Const Mandatory
