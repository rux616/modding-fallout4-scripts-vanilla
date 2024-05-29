;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ106_000229E7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;add Dogmeat
DogmeatQuest.SetStage(1)
Alias_Dogmeat.GetActorRef().EvaluatePackage()
Alias_Dogmeat.GetActorRef().Moveto(MQ106TestDogmeatMarker)

;move player
Game.GetPlayer().MoveTo(MQ106TestPlayerMarker)

;close out MQ105 and start MQ106
MQ105.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
DialogueDiamondCityEntrance.SetStage(1000)
MQ105.SetStage(310)
MQ105.SetObjectiveDisplayed(70)

;move Nick
Alias_NickValentine.GetActorRef().EvaluatePackage()
Alias_NickValentine.GetActorRef().MoveTo(MQ105NickKelloggHouseMarker)

;move player
Game.GetPlayer().MoveTo(MQ106TestPlayerMarker)

;unlock door
KelloggHouseDoorREF.Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;start investigations sub-quest
MQ106Investigations.setStage(1)

;enable encounters in Fort Hagen
Alias_EncounterMarker01.getReference().enable()

;make elevator operational in Fort Hagen
(Elevator as ElevatorMasterScript).MakeElevatorFunctional()

;disable the door blocker that leads to the command center
Alias_DoorBlocker.getReference().disable()

;switch Dogmeat to Escort - DOGMEAT'S PACKAGES LIVE IN FOLLOWERS QUEST
Alias_Dogmeat.GetActorRef().EvaluatePackage()

;make Kellog's gun
CustomItemQuest.setstage(110)

;disable turrets in the exterior of hagen
int icount = Alias_ExtTurretCollection.GetCount()
int iindex = 0
while (iindex < icount)
  (Alias_ExtTurretCollection.GetAt(iindex) as Actor).SetUnconscious()
  iindex = iindex + 1
endwhile

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ106KelloggHuntAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Turn off Dogmeat Teammate so you can activate him
;WJS - don't do this anymore, he can't be a companion at this point
;(Followers as FollowersScript).ClearDogmeatCompanion()

Alias_Dogmeat.GetActorRef().EvaluatePackage()

;shut down the MQ106 investigations quest
MQ106Investigations.Stop()

;dogmeat runs to the door
MQ106_DogmeatRunstoDoorScene.Start()

; shut down investigation sites and objectives, if any remain open.
DogmeatClueSitesEnableMarker.disable()
setObjectiveDisplayed(11, false)
setObjectiveDisplayed(12, false)
setObjectiveDisplayed(13, false)
setObjectiveDisplayed(14, false)
setObjectiveDisplayed(15, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()

DogmeatREF.SetAvailabletoBeCompanion()
DogmeatREF.AllowCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
If GetStageDone(50) == 0 && GetStageDone(75) == 0
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
int icount = Alias_ExtTurretCollection.GetCount()
int iindex = 0
while (iindex < icount)
  (Alias_ExtTurretCollection.GetAt(iindex) as Actor).SetUnconscious(False)
  iindex = iindex + 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()
If GetStageDone(75) == 0
  SetObjectiveCompleted(10)
  SetObjectiveCompleted(40)
  SetObjectiveDisplayed(50)
EndIf

MQ106_DogmeatRunstoDoorScene.stop()
MQ106_DogmeatBarksScene.Start()
MQ106_CompanionDogmeatScene.Start()

SetStage(47)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(75)

;advance Dogmeat state if we skipped this
SetStage(50)

;play companion line if we skipped
If GetStageDone(42) == 0
  MQ106_CompanionDogmeatScene.Start()
EndIf

;make sure Dogmeat is available as a Companion
SetStage(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;Make Sure Command Center Door is Open
CommandCenterDoor.SetOpen()
MQ106_KelloggIntercom01.Stop()
MQ106_KelloggIntercom02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom02.Stop()
MQ106_KelloggIntercom03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom03.Stop()
MQ106_KelloggIntercom04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom04.Stop()
MQ106_KelloggIntercom05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom05.Stop()
MQ106_KelloggIntercom06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom06.Stop()
;synth shutdown
int i = 0
While (i < Alias_SynthsCollection.GetCount())
      (Alias_SynthsCollection.GetAt(i) as Actor).AddToFaction(PlayerFaction)
      (Alias_SynthsCollection.GetAt(i) as Actor).StopCombat()
      (Alias_SynthsCollection.GetAt(i) as Actor).SetValue(Aggression, 0)
      ;(Alias_SynthsCollection.GetAt(i) as Actor).PlayIdle(IdleSynthShutdown)
      (Alias_SynthsCollection.GetAt(i) as Actor).EvaluatePackage()
      i = i + 1
EndWhile
MQ106_KelloggIntercom07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Open door
SetObjectiveCompleted(75)
SetObjectiveDisplayed(100)
BackDoor02.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Open Back Door
BackDoor.SetOpen()

;Close Command Center Door
CommandCenterDoor.SetOpen(False)

;enable navcutter
CommandDoorNavCutter.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ106_KelloggIntercom07.Stop()

;Close Back Doors
;BackDoor.SetOpen(false)

;Turn on Lights
LightSwitch.activate(LightSwitch)

;Start Scene
MQ106_KelloggLastSceneNew.Start()
Alias_Synth1.getActorRef().evaluatePackage()
Alias_Synth2.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_Synth2.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;One or both of the Synths have been hit by Player, remove from faction and set aggression
Alias_Synth1.getActorRef().RemoveFromFaction(PlayerFaction)
Alias_Synth2.getActorRef().RemoveFromFaction(PlayerFaction)
Alias_Synth1.getActorRef().setValue(Aggression, 2)
Alias_Synth2.getActorRef().setValue(Aggression, 2)

int i = 0
While (i < Alias_SynthsCollection.GetCount())
      (Alias_SynthsCollection.GetAt(i) as Actor).RemoveFromFaction(PlayerFaction)
      (Alias_SynthsCollection.GetAt(i) as Actor).SetValue(Aggression, 2)
      i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(75)
;SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Alias_Synth2.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MQ106_KelloggLastSceneNew.Stop()

Alias_Kellogg.getActorRef().RemoveFromFaction(PlayerFaction)
Alias_Kellogg.getActorRef().setValue(Aggression, 2)


;if Synths were not told to stand down (by stage 280) then make Synths hostile
;if(getStageDone(280) == 0)
    Alias_Synth1.getActorRef().RemoveFromFaction(PlayerFaction)
    Alias_Synth2.getActorRef().RemoveFromFaction(PlayerFaction)
    Alias_Synth1.getActorRef().setValue(Aggression, 2)
    Alias_Synth2.getActorRef().setValue(Aggression, 2)
;endif
int i = 0
While (i < Alias_SynthsCollection.GetCount())
      (Alias_SynthsCollection.GetAt(i) as Actor).RemoveFromFaction(PlayerFaction)
      (Alias_SynthsCollection.GetAt(i) as Actor).SetValue(Aggression, 2)
      i = i + 1
EndWhile
;tell player to kill Kellogg
SetObjectiveCompleted(75)
SetObjectiveCompleted(100)
SetObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if(Alias_Kellogg.getActorRef().IsDead() == 0)
  SetObjectiveDisplayed(125)
else
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; put this in MQ00 alias to keep it a quest object after MQ106 shuts down
Actor KelloggREF = Alias_Kellogg.GetActorRef()
ObjectReference KelloggBrainREF = Alias_CyberBrain.GetRef()
KelloggBrainREF.Enable()
MQ106KelloggBrain.ForceRefTo(KelloggBrainREF)
;corpse must be persistent as well
MQ106KelloggCorpse.ForceRefTo(KelloggREF)
;add cybernetics items to Kellogg as he is dying
KelloggREF.AddItem(KelloggBrainREF)

;add the other cybernetics
KelloggREF.AddITem(pMQ201CyberHand, 1)
KelloggREF.AddITem(pMQ201CyberPain, 1)

;Enable Prydwen Weather Trigger
PrydwenWeatherTrigger.enable()

;Enable DisableFastTravel Trigger in exterior
FortHagenDisableFastTravelTrigger.enable()

;make Synths hostile
Alias_Synth1.getActorRef().RemoveFromFaction(PlayerFaction)
Alias_Synth2.getActorRef().RemoveFromFaction(PlayerFaction)
Alias_Synth1.getActorRef().setValue(Aggression, 2)
Alias_Synth2.getActorRef().setValue(Aggression, 2)

;Clear Location
FortHagenLocation.SetCleared()
FortHagenInteriorLocation.SetCleared()

;Enable Airport
BoSEnable.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0902_Item_00
Function Fragment_Stage_0902_Item_00()
;BEGIN CODE
;tell the player to search around
SetObjectiveCompleted(125)
SetObjectiveDisplayed(150)

;Nick speaks if he's around
MQ106_NickKelloggDead.Start()

;music
MUSDread.add()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ106KelloggDeadAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
MQ106_PlayerActivateKellogg.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor NickREF = Alias_NickValentine.GetActorRef()

SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
pMQ201.SetStage(10)

;if Nick is here, he needs to stay here and also forcegreet
If NickREF.GetParentCell() == FortHagen02
  SetStage(1100)
;otherwise dismiss him and  move him to his office
Else
  NickREF.DisallowCompanion(SuppressDismissMessage = true)
  NickREF.MoveTo(MQ201NickTravelMarker01)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Nick is dismissed if he is the current companion
Actor NickREF = Alias_NickValentine.GetActorRef()

If NickREF.IsInFaction(CurrentCompanionFaction) == True
  ;(Followers as FollowersScript).ClearCompanion()
  NickREF.DisallowCompanion(SuppressDismissMessage = true)
EndIf

NickREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
;advance the quest forward
pMQ201.SetStage(13)
pMQ201.SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Game.AddAchievement(4)

;Open Command Center Door
CommandCenterDoor.SetOpen(TRUE)
CommandDoorNavCutter.disable()

;start the next quest
MQ202.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CyberBrain Auto Const

ReferenceAlias Property Alias_Kellogg Auto Const

MiscObject Property pMQ201CyberHand Auto Const

MiscObject Property pMQ201CyberPain Auto Const

Quest Property pMQ201 Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_Synth1 Auto Const

ReferenceAlias Property Alias_Synth2 Auto Const

ActorValue Property Aggression Auto Const

ReferenceAlias Property Alias_DoorBlocker Auto Const

Scene Property MQ106_KelloggLastSceneNew Auto Const

Quest Property MQ202 Auto Const

ReferenceAlias Property Alias_Dogmeat Auto Const

Quest Property DogmeatQuest Auto Const

ObjectReference Property MQ106TestDogmeatMarker Auto Const

ObjectReference Property MQ106TestPlayerMarker Auto Const

Quest Property MQ105 Auto Const

ReferenceAlias Property Alias_NickValentine Auto Const

ObjectReference Property MQ105NickKelloggHouseMarker Auto Const

ObjectReference Property KelloggHouseDoorREF Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

ObjectReference Property Elevator Auto Const

ReferenceAlias Property Alias_EncounterMarker01 Auto Const

Quest Property MQ106Investigations Auto Const

Location Property FortHagenLocation Auto Const

LocationAlias Property Alias_FortHagenLocation Auto Const

Quest Property Followers Auto Const

Faction Property CurrentCompanionFaction Auto Const

Scene Property MQ106_DogmeatBarksScene Auto Const

Scene Property MQ106_DogmeatRunstoDoorScene Auto Const

ObjectReference Property DogmeatClueSitesEnableMarker Auto Const

ReferenceAlias Property MQ106KelloggBrain Auto Const

ReferenceAlias Property MQ106KelloggCorpse Auto Const

Scene Property MQ106_PlayerActivateKellogg Auto Const

Scene Property MQ106_NickKelloggDead Auto Const

Scene Property MQ106_KelloggIntercom01 Auto Const

Scene Property MQ106_KelloggIntercom02 Auto Const

Scene Property MQ106_KelloggIntercom03 Auto Const

Scene Property MQ106_KelloggIntercom04 Auto Const

Scene Property MQ106_KelloggIntercom05 Auto Const

Scene Property MQ106_KelloggIntercom06 Auto Const

Scene Property MQ106_KelloggIntercom07 Auto Const

RefCollectionAlias Property Alias_SynthsCollection Auto Const

Idle Property IdleSynthShutDown Auto Const

ObjectReference Property LightSwitch Auto Const

ObjectReference Property BackDoor Auto Const

ObjectReference Property BackDoor02 Auto Const
ObjectReference Property CommandCenterDoor Auto Const

MusicType Property MUSDread Auto Const

Quest Property BoSEnable Auto Const

ObjectReference Property PrydwenWeatherTrigger Auto Const

Scene Property MQ106_CompanionDogmeatScene Auto Const

GlobalVariable Property PlayerHasActiveCompanion Auto Const Mandatory

Quest Property CustomItemQuest Auto Const Mandatory

ObjectReference Property FortHagenDisableFastTravelTrigger Auto Const
Cell Property FortHagen02 Auto Const Mandatory

ObjectReference Property MQ201NickTravelMarker01 Auto Const Mandatory

ObjectReference Property CommandDoorNavCutter Auto Const

RefCollectionAlias Property Alias_ExtTurretCollection Auto Const Mandatory

ActorValue Property COMQC_MQ106KelloggDeadAV Auto Const

ActorValue Property COMQC_MQ106KelloggHuntAV Auto Const

Location Property FortHagenInteriorLocation Auto Const
