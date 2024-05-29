;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06a_0102127F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Get MQ05 in the right state
DLC03MQ05.SetStage(0)
DLC03MQ05.SetStage(250)

;Start and kill DiMA's intro scene
DLC03DialogueDiMA_01_GreetingScene.Start()
DLC03DialogueDiMA.SetStage(200)

;Get Nucleus entrance scene in right state
DLC03CoA_DialogueNucleusEntrance.SetStage(10)
DLC03CoA_DialogueNucleusEntrance.SetStage(15)
DLC03CoA_DialogueNucleusEntrance.SetStage(20)
DLC03CoA_DialogueNucleusEntrance.SetStage(50)
DLC03CoA_DialogueNucleusEntrance.SetStage(60)
DLC03CoA_DialogueNucleusEntrance.SetStage(100)

;Get AtomM01 in the right state
DLC03AtomM01.SetStage(10)
DLC03AtomM01.SetStage(150)

;Skip the High Confessor's intro
DLC03CoA_DialogueNucleus.SetStage(50)
DLC03CoA_DialogueNucleus.SetStage(60)

;Move player to DiMA
Utility.Wait(5.0)
Game.GetPlayer().MoveTo(DebugMarker)

Utility.Wait(0.5)
DLC03DialogueDiMA_01_GreetingScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set objective
SetObjectiveDisplayed(10)

Game.GetPlayer().AddItem(DLC03MQ06a_MartinsRefugeKey)

;If the intial sermon hasn't completed, complete it now
if !DLC03CoA_DialogueNucleusSermon.GetStageDone(100)
  DLC03CoA_DialogueNucleusSermon.SetStage(100)
endif

;Disable random encounter trigger outside of Martin's refuge
Alias_RandomEncounterTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Alias_Cole.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;If the player has picked up the other tape, set appropriate stage
if GetStageDone(20)
  SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If the player has picked up the other tape, set appropriate stage
if GetStageDone(15)
  SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)

ObjectReference SD = Alias_SurgeryDoor.GetRef()
ObjectReference ST = Alias_SurgeryTerminal.GetRef()

;Close surgery door and lock it and the terminal
SD.SetOpen(false)
SD.Lock()
SD.SetLockLevel(254)

ST.Lock()
ST.SetLockLevel(254)

;Enable surgery gore
SurgeryEnableMarker.Enable()

;Move companions out of locked room
Actor Comp = Alias_Companion.GetActorRef()
Actor Dog = Alias_Dogmeat.GetActorRef()

if Comp.GetParentCell() ==  DLC03Acadia
  Comp.MoveTo(CompMoveToMarker)
endif

if Dog.GetParentCell() ==  DLC03Acadia
  Dog.MoveTo(DogMoveToMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MartinTape01.GetRef())
Game.GetPlayer().RemoveItem(Alias_MartinTape02.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_DiMAsTape.GetRef())

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(45)

Alias_HighConfessor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
ObjectReference HCRef = Alias_HighConfessor.GetRef()

if !GetStageDone(50) && Game.GetPlayer().GetDistance(HCRef) < DLC03MQ06a_TapeDistance.GetValue()
  HCRef.SayCustom(DLC03MQ06a_MQ06aHCListensToTape)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;High Confessor shouldn't bring bodyguards if:
;1. Player's wiped out the farm 
;2. Player's completed sufficent quests for the Children
;3. The player seduced the Confessor
if DLC03MQ06_WindFarmDestroyed.GetValue() >= 1 || DLC03CoA_QuestsCompleted.Getvalue() >= DLC03MQ06a_HCQuestThreshold.GetValue()
  DLC03MQ06a_ConfessorTrustsPlayer.SetValue(1)
endif

;Disable guards
Alias_CommandIntGuardF01.GetRef().Disable()

;Enable tunnel trigger
Alias_TunnelTrigger.GetRef().Enable()

;Set objectives
SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)

;Play High Confessor's agreement scene
DLC03MQ06a_TektusAgreesToMeetPlayer.Start()

;Disable Cole
Alias_Cole.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_02
Function Fragment_Stage_0070_Item_02()
;BEGIN CODE
;Remove High Confessor from alias in Kickout quest
KickoutHCAlias.Clear()

Actor HCAct = Alias_HighConfessor.GetActorRef()

;Get HC in proper faction
HCAct.RemoveFromFaction(DLC03ChildrenofAtomInteriorFaction)
HCAct.RemoveFromFaction(DLC03ChildrenofAtomFaction)
HCAct.AddToFaction(DLC03MQ06a_ChildrenofAtomFaction)
HCAct.SetCrimeFaction(DLC03MQ06a_ChildrenofAtomFaction)

;Move High Confessor to player's location
HCAct.Moveto(HCTunnelMarker)

;Remove the High Confessor from the Children of Atom faction and add him to the local one
;Close out earlier objective
SetObjectiveCompleted(50)

;If the High Confessor has been seduced, set his Archetypes to nervous
;if DLC03MQ06a_SeducedHighConf.GetValue() >= 1
;  HCAct.SetAnimArchetypeNervous()
;  HCAct.ChangeAnimFaceArchetype(AnimFaceArchetypeNervous)
;endif

;Enable guards if Tektus doesn't trust player
if DLC03MQ06a_ConfessorTrustsPlayer.GetValue() <= 0
  Alias_HCGuard01.GetRef().Enable()
  Alias_HCGuard02.GetRef().Enable()
  SetObjectiveDisplayed(70)
  SetObjectiveDisplayed(71)
else
  ;Otherwise, set the correct objective
    SetObjectiveDisplayed(70)
endif

;Start High Confessor's scene
DLC03MQ06a_HighConfessorShouts.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(71)

Alias_HCGuard01.GetActorRef().EvaluatePackage()
Alias_HCGuard02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Actor HCAct = Alias_HighConfessor.GetActorRef()

;Set player enemy of MQ06a faction
DLC03MQ06a_ChildrenofAtomFaction.SetEnemy(PlayerFaction)
HCAct.StartCombat(Game.GetPlayer())

;Turn on temp guard
Alias_TempGuard.GetRef().Enable()

;End any scenes that might still be running for the High Confessor
if DLC03MQ06a_HighConfMartin.IsPlaying()
  DLC03MQ06a_HighConfMartin.Stop()
endif

if DLC03MQ06a_HighConfessorShouts.IsPlaying()
  DLC03MQ06a_HighConfessorShouts.Stop()
endif

if DLC03MQ06a_HighConfThreatens.IsPlaying()
  DLC03MQ06a_HighConfThreatens.Stop()
endif

;If the player has already convinced the High Confessor and the guards to leave, bring back those objectives
if GetStageDone(255)
  SetObjectiveCompleted(70, false)

  if DLC03MQ06a_ConfessorTrustsPlayer.GetValue() <= 0
    SetObjectiveCompleted(71, false)
  endif

  SetObjectiveDisplayed(250, false)
endif

;Shut down any quests with the High Confessor in them 
;(FFNucleus02 and it's note/quest pointer, MQ06 nuke path, objective in DialogueNucleus)
DLC03MQ06a_ConfessorUnavailable.SetValue(1)

DLC03CoA_DialogueNucleus.SetStage(55)

DLC03CoA_QuestPointers.SetStage(420)

if DLC03CoA_FFNucleus02.IsRunning()
  DLC03CoA_FFNucleus02.SetStage(750)

  ;If Aubert's ready to leave nucleus, do it now
  if DLC03CoA_FFNucleus02.GetStageDone(210) && !DLC03CoA_FFNucleus02.GetStageDone(220) && !DLC03CoA_FFNucleus02.GetStageDone(240)
    DLC03CoA_FFNucleus02_PostQuest.SetStage(210)
  endif
endif

DLC03CoA_FFNucleusQuestObjHandler.SetStage(210)

if DLC03MQ06.IsRunning() && !DLC03MQ06.GetStageDone(1000)
  DLC03MQ06.SetStage(755)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
;Actor HCAct = Alias_HighConfessor.GetActorRef()

;Have High Confessor say his custom line
;Alias_HighConfessor.GetActorRef().SayCustom(DLC03MQ06a_HighConfessorEscapedSubtopic)

;Return High Confessor to his standard factions
;HCAct.RemoveFromFaction(DLC03MQ06a_ChildrenofAtomFaction)
;HCAct.AddToFaction(DLC03ChildrenofAtomFaction)
;HCAct.SetCrimeFaction(DLC03ChildrenofAtomFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Ensure the High Confessor is still in the Memory Banks area
if Alias_HighConfessor.GetRef().GetCurrentLocation() == DLC03NucleusMemoryBanksLocation

SetObjectiveCompleted(70)

  ;If the HC trusts the player, proceed
  if DLC03MQ06a_ConfessorTrustsPlayer.GetValue() >= 1
    SetStage(150)
  else
    ;Otherwise, ensure the guards are dead
    if GetStageDone(105)
     SetStage(150)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;If the other guard is dead, update the quest
if GetStageDone(102)
  SetStage(105)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
;If the other guard is dead, update the quest
if GetStageDone(101)
  SetStage(105)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
SetObjectiveCompleted(71)

;If High Confessor is dead, continue with quest
if GetStageDone(100)
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set up new objectives
SetObjectiveDisplayed(150)

;Enable burial trigger
Alias_BurialTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Block player controls
InputEnableLayer myLayer = InputEnableLayer.Create()
myLayer.DisablePlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
QSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())

Utility.Wait(4.0)

;Disable trigger, bodies, enable new wall
Alias_BurialTrigger.GetRef().Disable()
Alias_HighConfessor.GetRef().Disable()
Alias_HCGuard01.GetRef().Disable()
Alias_HCGuard02.GetRef().Disable()
WallEnableMarker.Disable()
Game.GetPlayer().MoveTo(MQ06aBurialPlayerMarker)
Alias_TempGuard.GetRef().Disable()

Game.FadeOutGame(False, True, 0.0, 3.0)

;Complete objective
SetObjectiveCompleted(150)

Utility.Wait(3.0)

;Reenable player controls
myLayer.Delete()

;Proceed to next section of quest
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set "Confessor Replaced" global
DLC03MQ06_ConfessorReplaced.SetValue(1)

;Enable replacement
Alias_Replacement.GetRef().Enable()

;Enable scene trigger
Alias_HCDiMASceneTrigger.GetRef().Enable()

;Set objective
SetObjectiveDisplayed(250)

;Start up HC replacement quest
DLC03MQ06a_HCSynthQuest.Start()

;Player has made a decision
SetStage(257)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_02
Function Fragment_Stage_0255_Item_02()
;BEGIN CODE
;Set "Confessor Replaced" global
DLC03MQ06_ConfessorReplaced.SetValue(1)

;Enable replacement
Alias_Replacement.GetRef().Enable()

;Enable scene trigger
Alias_HCDiMASceneTrigger.GetRef().Enable()

;Start up HC replacement quest
DLC03MQ06a_HCSynthQuest.Start()

;Shut down any quests with the High Confessor in them 
;(FFNucleus02 and it's note/quest pointer, MQ06 nuke path, objective in DialogueNucleus)
DLC03MQ06a_ConfessorUnavailable.SetValue(1)

DLC03CoA_DialogueNucleus.SetStage(55)

DLC03CoA_QuestPointers.SetStage(420)

if DLC03CoA_FFNucleus02.IsRunning()
  DLC03CoA_FFNucleus02.SetStage(750)

  ;If Aubert's ready to leave nucleus, do it now
  if DLC03CoA_FFNucleus02.GetStageDone(210) && !DLC03CoA_FFNucleus02.GetStageDone(220) && !DLC03CoA_FFNucleus02.GetStageDone(240)
    DLC03CoA_FFNucleus02_PostQuest.SetStage(210)
  endif

endif

DLC03CoA_FFNucleusQuestObjHandler.SetStage(210)

if DLC03MQ06.IsRunning() && !DLC03MQ06.GetStageDone(1000)
  DLC03MQ06.SetStage(755)
endif

;Set up new objectives
SetObjectiveCompleted(70)
SetObjectiveCompleted(71)
SetObjectiveDisplayed(250)

;Player has made a decision
SetStage(257)

;Get everyone moving
Actor HCAct = Alias_HighConfessor.GetActorRef()
HCAct.EvaluatePackage()
Utility.Wait(1.5)
Alias_HCGuard01.GetActorRef().EvaluatePackage()
Alias_HCGuard02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0257_Item_00
Function Fragment_Stage_0257_Item_00()
;BEGIN CODE
;Unlock door to surgery cellar
ObjectReference SD = Alias_SurgeryDoor.GetRef()
ObjectReference ST = Alias_SurgeryTerminal.GetRef()

SD.SetOpen(false)
SD.Unlock()
ST.SetOpen(true)
ST.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06aScript
Quest __temp = self as Quest
DLC03:DLC03MQ06aScript kmyQuest = __temp as DLC03:DLC03MQ06aScript
;END AUTOCAST
;BEGIN CODE
DLC03MQ06a_DiMAHCScene.Start()

;Start fail safe timer in case scene doesn't begin
kmyquest.StartDiMAHCTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06aScript
Quest __temp = self as Quest
DLC03:DLC03MQ06aScript kmyQuest = __temp as DLC03:DLC03MQ06aScript
;END AUTOCAST
;BEGIN CODE
;Kill DiMA/HC scene failsafe timer
kmyquest.CancelDiMAHCTimer()

;Teleport HC synth on next unload
DLC03MQ06a_HCSynthQuest.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
;Give player a stack of caps
Game.GetPlayer().AddItem(Caps001, 1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
;If player didn't get their caps, give 'em now
if !GetStageDone(285)
  SetStage(285)
endif

;And shut it down
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;If DLC03MQ06 is still running and an objective stage has been set, complete it or just shut it down
if DLC03MQ06.IsRunning()
  if DLC03MQ06.GetStageDone(10) || DLC03MQ06.GetStageDone(20)
    DLC03MQ06.SetStage(550)
  else
    DLC03MQ06.SetStage(560)
  endif
endif

;Kill the MQ06 objectives in MQ04 if they haven't already been killed
DLC03MQ04.SetStage(270)
DLC03MQ04.SetStage(370)

;Give player completion perk
Game.GetPlayer().AddPerk(DLC03MQ06a_ProtectorofAcadiaPerk)
DLC03MQ06a_ProtectorofAcadiaMsg.Show()

if !DLC03MQ06a_HCSynthQuest.GetStageDone(750) && !DLC03MQ06a_HCSynthQuest.GetStageDone(150)
  DLC03MQ06a_HCSynthQuest.SetStage(50)
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06aScript
Quest __temp = self as Quest
DLC03:DLC03MQ06aScript kmyQuest = __temp as DLC03:DLC03MQ06aScript
;END AUTOCAST
;BEGIN CODE
;If burial trigger is active, disable
ObjectReference BTrigREF = Alias_BurialTrigger.GetRef()

if BTrigREF.IsEnabled()
  BTrigRef.Disable()
endif

;Disable HC/DiMA scene trigger
Alias_HCDiMASceneTrigger.GetRef().Disable()

;If High Confessor is still in temp factions, adjust them, return High Confessor to his standard factions
Actor HCAct = Alias_HighConfessor.GetActorRef()

if HCAct.IsInFaction(DLC03MQ06a_ChildrenofAtomFaction)
  HCAct.RemoveFromFaction(DLC03MQ06a_ChildrenofAtomFaction)
endif

if !HCAct.IsInFaction(DLC03ChildrenofAtomFaction)
  HCAct.AddToFaction(DLC03ChildrenofAtomFaction)
  HCAct.SetCrimeFaction(DLC03ChildrenofAtomFaction)
endif

ActorBase HCActBase = HCAct.GetActorBase()

;If you 've killed the High Confessor, but haven't seen DiMA/Rep scene, disable Rep and kill his quest
if (GetStageDone(250) || GetStageDone(255)) && !GetStageDone(260)
  Alias_Replacement.GetRef().Disable()
  DLC03MQ06a_HCSynthQuest.SetStage(750)
endif

;SHUT. EVERYTHING. DOWN.
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
;Aggro Nucleus to player
DLC03CoA_Kickout.SetStage(700)

;Then fail the quest
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
;Disable the burial trigger
ObjectReference BTrigREF = Alias_BurialTrigger.GetRef()

if BTrigREF.IsEnabled()
  BTrigRef.Disable()
endif

Actor TG = Alias_TempGuard.GetActorRef()

;Get guard moving towards door
TG.EvaluatePackage()

;Trigger guard's line
TG.SayCustom(DLC03MQ06a_TempGuardShout)

Utility.Wait(4.0)

;Kick out player from CoA
DLC03CoA_Kickout.SetStage(700)

;Fail quest
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN CODE
;Stage triggered from:
;1. Stage 100 - Acadia Defense Quest
;2. Stage 120 - MQ05
;3. Stage 800 - MQ05

;Fail quest
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;Fail quest
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
;Fail quest

SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0785_Item_00
Function Fragment_Stage_0785_Item_00()
;BEGIN CODE
;Fail quest
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if (DLC03KasumiNakano.GetDeadCount() != 0)
    Debug.Trace("Kasumi is dead")
    DLC03MQPostQuest.SetStage(200)
elseif (DLC03KasumiNakano.GetDeadCount() == 0)
   Debug.Trace("Kasumi is alive")
   DLC03MQPostQuest.SetStage(100)
endIf

;Enable random encounter trigger
Alias_RandomEncounterTrigger.GetRef().Enable()

;If Acadia surgery door got shut and locked, unlock it now
if GetStageDone(30)
  ObjectReference SD = Alias_SurgeryDoor.GetRef()
  ObjectReference ST = Alias_SurgeryTerminal.GetRef()

  SD.SetOpen(false)
  SD.Unlock()
  ST.SetOpen(true)
  ST.Unlock()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03MQ06_WindFarmDestroyed Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_ConfessorTrustsPlayer Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_HCQuestThreshold Auto Const Mandatory

ReferenceAlias Property Alias_TunnelTrigger Auto Const Mandatory

ReferenceAlias Property Alias_HighConfessor Auto Const Mandatory

ObjectReference Property HCTunnelMarker Auto Const Mandatory

ReferenceAlias Property Alias_HCGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_HCGuard02 Auto Const Mandatory

Scene Property DLC03MQ06a_HighConfMartin Auto Const Mandatory

Scene Property DLC03MQ06a_HighConfessorShouts Auto Const Mandatory

Scene Property DLC03MQ06a_HighConfThreatens Auto Const Mandatory

Location Property DLC03NucleusMemoryBanksLocation Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

ReferenceAlias Property Alias_BurialTrigger Auto Const Mandatory

Sound Property QSTMS07BPlayerGraveExhume2D Auto Const Mandatory

ObjectReference Property MQ06aBurialPlayerMarker Auto Const Mandatory

ObjectReference Property WallEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Replacement Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

Faction Property DLC03MQ06a_ChildrenofAtomFaction Auto Const Mandatory

Quest Property DLC03MQ05 Auto Const Mandatory

ObjectReference Property DebugMarker Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusEntrance Auto Const Mandatory

Quest Property DLC03AtomM01 Auto Const Mandatory

Quest Property DLC03DialogueDiMA Auto Const Mandatory

Scene Property DLC03DialogueDiMA_01_GreetingScene Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory

GlobalVariable Property DLC03MQ06_ConfessorReplaced Auto Const Mandatory

ReferenceAlias Property Alias_Cole Auto Const Mandatory

Perk Property DLC03MQ06a_ProtectorofAcadiaPerk Auto Const Mandatory

Message Property DLC03MQ06a_ProtectorofAcadiaMsg Auto Const Mandatory

Quest Property DLC03CoA_Kickout Auto Const Mandatory

Key Property DLC03MQ06a_MartinsRefugeKey Auto Const Mandatory

ReferenceAlias Property Alias_MartinTape01 Auto Const Mandatory

ReferenceAlias Property Alias_MartinTape02 Auto Const Mandatory

ReferenceAlias Property Alias_DiMAsTape Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus02 Auto Const Mandatory

Keyword Property DLC03MQ06a_MQ06aHCListensToTape Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_TapeDistance Auto Const Mandatory

Scene Property DLC03MQ06a_TektusAgreesToMeetPlayer Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Scene Property DLC03MQ06a_DiMAHCScene Auto Const Mandatory

Quest Property DLC03CoA_FFNucleusQuestObjHandler Auto Const Mandatory

Quest Property DLC03MQ06a_HCSynthQuest Auto Const Mandatory

ReferenceAlias Property Alias_CommandIntGuardF01 Auto Const Mandatory

ReferenceAlias Property Alias_TempGuard Auto Const Mandatory

Keyword Property DLC03MQ06a_TempGuardShout Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusSermon Auto Const Mandatory

ReferenceAlias Property KickoutHCAlias Auto Const Mandatory

ActorBase Property DLC03KasumiNakano Auto Const Mandatory

Quest Property DLC03MQPostQuest Auto Const Mandatory

ReferenceAlias Property Alias_HCDiMASceneTrigger Auto Const Mandatory

ReferenceAlias Property Alias_RandomEncounterTrigger Auto Const Mandatory

ReferenceAlias Property Alias_SurgeryTerminal Auto Const Mandatory

ReferenceAlias Property Alias_SurgeryDoor Auto Const Mandatory

ObjectReference Property SurgeryEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ReferenceAlias Property Alias_dogmeat Auto Const Mandatory

ObjectReference Property CompMoveToMarker Auto Const Mandatory

ObjectReference Property DogMoveToMarker Auto Const Mandatory

Cell Property DLC03Acadia Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_ConfessorUnavailable Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus02_PostQuest Auto Const Mandatory

Quest Property DLC03MQ04 Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory

Faction Property DLC03ChildrenofAtomInteriorFaction Auto Const Mandatory
