;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_WindFarmHandlin_0101AC2B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Enable Dig Trigger
Alias_DigTrigger.GetRef().Enable()
DigSiteMapMarker.Enable()
DigSiteMapMarker.AddtoMap()
WindFarmMapMarker.Enable()
WindFarmMapMarker.AddToMap()

;If player hasn't launched nuke and High Confessor hasn't been replaced, 
;start up proper stage of MQ06
if !DLC03MQ06_NukeHandling.GetStageDone(100) && !DLC03MQ06a.GetStageDone(300)
  DLC03MQ04.SetStage(360)
  
  ;If MQ06 isn't running, start it now
  if !DLC03MQ06.IsRunning()
    DLC03MQ06.Start()
  endif
endif

;If the "Find a way to kill Far Harbor" obj is active, shut it down
if DLC03MQ06.IsObjectiveDisplayed(195)
  DLC03MQ06.SetStage(197)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Block player controls
InputEnableLayer myLayer = InputEnableLayer.Create()
myLayer.DisablePlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
QSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())

Utility.Wait(2.5)

;Disable trigger, bodies, enable new wall
Alias_DigTrigger.GetRef().Disable()
DLC03MQ06_CodeCaseEnableMarker.Disable()
Game.GetPlayer().MoveTo(PlayerDigMarker)

Game.FadeOutGame(False, True, 0.0, 3.0)

Utility.Wait(3.0)

;Reenable player controls
myLayer.Delete()

;If MQ06 is running, update stage
if DLC03MQ06.IsRunning() && !DLC03MQ06_NukeHandling.GetStageDone(100) && !DLC03MQ06a.GetStageDone(300)
  DLC03MQ06.SetStage(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Update the player's objectives and begin MQ06
if !DLC03MQ06_NukeHandling.GetStageDone(100) && !DLC03MQ06a.GetStageDone(300)
  DLC03MQ06.SetStage(20)
endif

;Shut down the objective in MQ04
DLC03MQ04.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Play Longfellow's comment scene if he's nearby
if Alias_OldLongfellow.GetActorRef().GetDistance(Game.GetPlayer()) < 700
  DLC03MQ06_WindFarmHandling_LongfellowScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Mark "Player made a decision" stage
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;ADD FAR HARBOR KICKOUT FUNCTIONALITY HERE - TTP# 90715
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_WindFarmHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_WindFarmHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_WindFarmHandlingScript
;END AUTOCAST
;BEGIN CODE
Actor Player = Game.GetPlayer()

if kmyquest.iAveryExtortion == 0
  Player.AddItem(Caps001, 500)
elseif kmyquest.iAveryExtortion == 1
  Player.AddItem(Caps001, 1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_WindFarmHandlingScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_WindFarmHandlingScript kmyQuest = __temp as DLC03:DLC03MQ06_WindFarmHandlingScript
;END AUTOCAST
;BEGIN CODE
;Turn off windmill
(Alias_WindMillStopMarker.GetRef() as DLC03:ADV023TurnWindmillOffScript).StopWindmill()

; FIX FOR 96913: Failsafe to close off objective to go to VIM Factory for MQ05
DLC03MQ04.SetStage(165)

;Shut down the objective in MQ04 if you haven't already
DLC03MQ04.SetStage(370)

;Turn on handler quest for player exiting Wind Farm
DLC03MQ06_PlayerExitWindFarm.Start()

;Make player enemy of Far Harbor 
DLC03MQ00.SetStage(100)

;If player hasn't already launched nuke or completed the replacement, set stage in MQ06 to complete quest
if !DLC03MQ06.GetStageDone(250) && !DLC03MQ06.GetStageDone(205) && !DLC03MQ06.GetStageDone(210) && !DLC03MQ06a.GetStageDone(300)
  DLC03MQ06.SetStage(500)
endif

;If DLC03MQ06a is running, fail it
if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(790)
endif

;Set appropriate stage in MQ05
if DLC03MQ05.IsRunning()
  DLC03MQ05.SetStage(8980)
endif

;Bypass High Confessor's speech, Mother of Fog convo and Mai's warning in Nucleus
DLC03CoA_DialogueNucleus.SetStage(10)
DLC03CoA_DialogueNucleus.SetStage(50)
DLC03CoA_DialogueNucleus.SetStage(57)

;Set "Wind Farm Destroyed" globals
DLC03MQ06_WindFarmDestroyed.SetValue(1)
DLC03PlayerFarHarborDestroyed.SetValue(1)

;Trigger enable markers for map marker swap and Far Harbor attack state
FHMapMarkerEnableMarker.Disable()
FarHarborAttackEnableMarker.Disable()
LastPlankEnableMarker.Disable()
PostAttackMapMarker.AddToMap()

;Make Far Harbor Settlers and Creatures enemies
DLC03SettlementFarHarborFaction.SetEnemy(DLC03MQ06_CreatureFaction)

;Start attack
kmyquest.TriggerFarHarborAttack()

;Set accelerated weather change (Atom is pleased by your actions)
DLC03_RadStorm.SetActive(false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06 Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

ObjectReference Property FarHarborAttackEnableMarker Auto Const Mandatory

Faction Property DLC03SettlementFarHarborFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

GlobalVariable Property DLC03MQ06_WindFarmDestroyed Auto Const Mandatory

ReferenceAlias Property Alias_OldLongfellow Auto Const Mandatory

Scene Property DLC03MQ06_WindFarmHandling_LongfellowScene Auto Const Mandatory

Scene Property DLC03MQ06_WindFarmHandling_LongfellowAngry Auto Const Mandatory

Sound Property FXExplosionPrydwenCrash Auto Const Mandatory

ObjectReference Property WindmillMarker Auto Const Mandatory

Weather Property DLC03_RadStorm Auto Const Mandatory

Sound Property NPCMirelurkQueenAmbushB Auto Const Mandatory

ObjectReference Property RoarMarker Auto Const Mandatory

GlobalVariable Property DLC03MQ06_ConfessorReplaced Auto Const Mandatory

Quest Property DLC03MQ00 Auto Const

ReferenceAlias Property Alias_digTrigger Auto Const Mandatory

Sound Property QSTMS07BPlayerGraveExhume2D Auto Const Mandatory

ObjectReference Property PlayerDigMarker Auto Const Mandatory

ObjectReference Property DLC03MQ06_CodeCaseEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_WindFarmCode Auto Const Mandatory

ObjectReference Property WindFarmMapMarker Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

Quest Property DLC03MQ05 Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

ReferenceAlias Property Alias_WindMillStopMarker Auto Const Mandatory

Quest Property DLC03MQ06_PlayerExitWindFarm Auto Const Mandatory

ObjectReference Property FHMapMarkerEnableMarker Auto Const Mandatory

ObjectReference Property PostAttackMapMarker Auto Const Mandatory

ObjectReference Property LastPlankEnableMarker Auto Const Mandatory

Faction Property DLC03MQ06_CreatureFaction Auto Const Mandatory

Quest Property DLC03MQ04 Auto Const Mandatory

ObjectReference Property DigSiteMapMarker Auto Const Mandatory

GlobalVariable Property DLC03PlayerFarHarborDestroyed Auto Const Mandatory
