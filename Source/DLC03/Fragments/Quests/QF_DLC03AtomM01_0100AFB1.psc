;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AtomM01_0100AFB1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC03CoA_DialogueNucleusEntrance_Scene.Start()
DLC03CoA_DialogueNucleusEntrance_Scene.Stop()
DLC03CoA_DialogueNucleusEntrance.SetStage(15)
DLC03CoA_DialogueNucleusEntrance.SetStage(20)
DLC03CoA_DialogueNucleusEntrance.SetStage(50)
DLC03CoA_DialogueNucleusEntrance.SetStage(60)
DLC03CoA_DialogueNucleusEntrance.SetStage(100)

SetStage(10)

Game.GetPlayer().Moveto(DebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Turn on Radstorm weather trigger
Alias_RadstormTrigger.GetRef().Enable()
Alias_RadstormTrigger01.GetRef().Enable()
Alias_RadstormTrigger02.GetRef().Enable()

;Disable the Wilderness & Random Encounters along the M01 path.
DLC03AtomM01_WE01.Disable()
DLC03AtomM01_WE02.Disable()
DLC03AtomM01_WE03.Disable()
DLC03AtomM01_WE04.Disable()
DLC03AtomM01_RETriggerAssault.Disable()
ZephyrRidgeCampEnableMarkerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AtomM01Script
Quest __temp = self as Quest
DLC03:DLC03AtomM01Script kmyQuest = __temp as DLC03:DLC03AtomM01Script
;END AUTOCAST
;BEGIN CODE
;Kick up music
DLC03MUSSpecialVisionQuest01.Add()

;Enable Mother
Alias_MotherofTheFog.GetRef().Enable(true)

;Start Mother's failsafe and approach timer
kmyquest.StartMotherFailsafeTimer()
kmyquest.StartMotherApproachTimer()

;Set objective
SetObjectiveCompleted(10)

;Get shrine set up
Alias_PuzzleDecalEnableMarker.GetRef().Enable()
Alias_PuzzleNote.GetRef().Enable()
Alias_PuzzleAnswerTrigger.GetRef().Enable()
Alias_MotherIcon.GetRef().Enable()
Alias_ShrineMapMarker.GetRef().Enable()

;Set stage to change packages of entrance guards
DLC03CoA_DialogueNucleusEntrance.SetStage(110)

;Start companion follow scene
Actor Comp = Alias_Companion.GetActorRef()

if Alias_Companion.GetRef() != none && Comp.GetDistance(Game.GetPlayer()) < 2000
  DLC03AtomM01_CompanionTravelScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
DLC03AtomM01_MotherBeckonsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AtomM01Script
Quest __temp = self as Quest
DLC03:DLC03AtomM01Script kmyQuest = __temp as DLC03:DLC03AtomM01Script
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(60)
  SetObjectiveDisplayed(20)
endif

Alias_MotherofTheFog.GetActorRef().EvaluatePackage()

;Kill the Mother's failsafe timer
kmyquest.CancelMotherFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

DLC03AtomM01_PlayerMotherArrivalScene.Start()

SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetRef().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
Alias_MotherofTheFog.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
;Turn off Mother
SetStage(55)

;Enable note
Alias_MothersNote.GetRef().Enable()

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_01
Function Fragment_Stage_0059_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)

SetStage(55)

;If Mother's travel scene is still active, kill it
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetStage(67)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AtomM01Script
Quest __temp = self as Quest
DLC03:DLC03AtomM01Script kmyQuest = __temp as DLC03:DLC03AtomM01Script
;END AUTOCAST
;BEGIN CODE
;If Mother's travel scene is still active, kill it
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif

;Turn off puzzle trigger
Alias_PuzzleAnswerTrigger.GetRef().Disable()

;Turn off hallucination
kmyquest.DisableHallucinations()

Utility.Wait(0.5)

;Play success scene
DLC03AtomM01_PuzzleScene_03a_Success.Start()

;Give player password
Game.GetPlayer().AddItem(Alias_ShrinePassword.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(80)

Alias_ShrineSecurityDoors.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Turn off shrine trigger
Alias_ShrineTrigger.GetRef().Disable()

SetObjectiveCompleted(80)
SetObjectiveDisplayed(100)

;Turn off Radstorm weather trigger
Alias_RadstormTrigger.GetRef().Disable()
Alias_RadstormTrigger01.GetRef().Disable()

;If Mother's travel scene is still active, kill it
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif

;Start up Combat Quest
DLC03AtomM01_CombatStop.SetStage(10)

;In case Mother hasn't been disabled, do so now
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
DLC03CoA_PlayerKnowsAtom.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Get player set up in faction
Actor PA = Game.GetPlayer()

;Make the player friends with the interior NPC faction and stop combat on folks within
DLC03ChildrenofAtomInteriorFaction.SetAlly(PlayerFaction, true, true)
DLC03AtomM01_CombatStop.SetStage(100)

;And get the player in the Children's faction 
PA.AddToFaction(DLC03ChildrenofAtomFaction)
PA.AddToFAction(DLC03ChildrenofAtomBedFaction)
PA.AddItem(DLC03_ClothesAtomsDevoted)
DLC03CoA_PlayerJoinedCoA.SetValue(1)
DLC03CoA_PlayerKnowsAtom.SetValue(1)

;Up "Player helped Children" var
DLC03CoA_QuestsCompleted.SetValue(DLC03CoA_QuestsCompleted.GetValue() + 1)

;Close out objectives
CompleteAllObjectives()

;Start up pointer quest
DLC03CoA_QuestPointers.SetStage(10)

; Close out entrance quest
DLC03CoA_DialogueNucleusEntrance.SetStage(250)

;And this one!
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
DLC03CoA_Kickout.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
;If Mother isn't disabled, disable her now
if !Alias_MotherofTheFog.GetRef().IsDisabled()
  Alias_MotherofTheFog.GetRef().Disable(true)
endif

;Turn off puzzle trigger
Alias_PuzzleAnswerTrigger.GetRef().Disable()

;Turn off Radstorm weather trigger
Alias_RadstormTrigger.GetRef().Disable()
Alias_RadstormTrigger01.GetRef().Disable()
Alias_RadstormTrigger02.GetRef().Enable()

;Turn off shrine trigger
Alias_ShrineTrigger.GetRef().Disable()

;Turn on shrine map marker
ObjectReference MM = Alias_ShrineMapMarker.GetRef()
if MM.IsDisabled()
  MM.Enable()
endif

;Safely re-enable the Wilderness & Random Encounters along the M01 path.
DLC03AtomM01_WE01.EnableIfUnloaded()
DLC03AtomM01_WE02.EnableIfUnloaded()
DLC03AtomM01_WE03.EnableIfUnloaded()
DLC03AtomM01_WE04.EnableIfUnloaded()
DLC03AtomM01_RETriggerAssault.EnableIfUnloaded()
ZephyrRidgeCampEnableMarkerRef.EnableIfUnloaded()

;Set stage to change packages of entrance guards
DLC03CoA_DialogueNucleusEntrance.SetStage(110)

;If Mother's travel scene is still active, kill it
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;If Mother's travel scene is still active, kill it
if DLC03AtomM01_MotherTravelScene.IsPlaying()
  DLC03AtomM01_MotherTravelScene.Stop()
endif

;Close out companion scene if it's active
if  DLC03AtomM01_CompanionTravelScene.IsPlaying()
  DLC03AtomM01_CompanionTravelScene.Stop()
endif

Alias_MotherofTheFog.GetRef().Disable(true)

;Shut down combat quest if it's running
if DLC03AtomM01_CombatStop.IsRunning()
  DLC03AtomM01_CombatStop.SetStage(750)
endif

FailAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MotherOfTheFog Auto Const Mandatory

ReferenceAlias Property Alias_PuzzleDecalEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ShrineSecurityDoors Auto Const Mandatory

Scene Property DLC03AtomM01_PlayerMotherArrivalScene Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusEntrance Auto Const Mandatory

ReferenceAlias Property Alias_ShrineTerminal Auto Const Mandatory

Scene Property DLC03AtomM01_PuzzleScene_03a_Success Auto Const Mandatory

ReferenceAlias Property Alias_ShrinePassword Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleusEntrance_Scene Auto Const Mandatory

ReferenceAlias Property Alias_RadstormTrigger Auto Const Mandatory

ObjectReference Property DebugMarker Auto Const Mandatory

Scene Property DLC03AtomM01_MotherBeckonsScene Auto Const Mandatory

ReferenceAlias Property Alias_RadstormTrigger01 Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerJoinedCoA Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKnowsAtom Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const

ReferenceAlias Property Alias_MothersNote Auto Const Mandatory

Quest Property DLC03AtomM01_EncounterHandler Auto Const Mandatory

ReferenceAlias Property Alias_ShrineTrigger Auto Const Mandatory

Quest Property DLC03CoA_Kickout Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property DLC03AtomM01_WE01 Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property DLC03AtomM01_WE02 Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property DLC03AtomM01_WE03 Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property DLC03AtomM01_RETriggerAssault Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property DLC03AtomM01_WE04 Auto Const Mandatory

Armor Property DLC03_ClothesAtomsDevoted Auto Const Mandatory

ReferenceAlias Property Alias_PuzzleNote Auto Const Mandatory

ReferenceAlias Property Alias_PuzzleAnswerTrigger Auto Const Mandatory

ReferenceAlias Property Alias_MotherIcon Auto Const Mandatory

ReferenceAlias Property Alias_RadstormTrigger02 Auto Const Mandatory

ReferenceAlias Property Alias_ShrineMapMarker Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory

MusicType Property DLC03MUSSpecialVisionQuest01 Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

EffectShader Property DLC03FogMotherFXS Auto Const Mandatory

Scene Property DLC03AtomM01_MotherTravelScene Auto Const Mandatory

Scene Property DLC03AtomM01_CompanionTravelScene Auto Const Mandatory

Faction Property DLC03ChildrenofAtomBedFaction Auto Const Mandatory

DLC03:DLC03_WESafeEnableMarkerScript Property ZephyrRidgeCampEnableMarkerRef Auto Const Mandatory

Faction Property DLC03ChildrenofAtomInteriorFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Quest Property DLC03AtomM01_CombatStop Auto Const Mandatory
