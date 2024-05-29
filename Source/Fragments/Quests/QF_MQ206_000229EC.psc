;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206_000229EC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ControlToggle(0)
Game.GetPlayer().AddToFaction(InstituteFaction)

Shutters.GetReference().Enable()

;NO LONGER USED
;Start the 2 Institute "reaction" scenes
;These represent scientists reacting to the player being in the Inst for the 1st time
;DialogueInstituteReactScene1.Start()
;DialogueInstituteReactScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
MQ11OpeningSpeech.Start()
PlayerBeenToInstitute.SetValue(1)

; Is "Road to Freedom" running? In which case, you left the Railroad hanging
if ( pRR101.IsRunning() )
  pRR102.SetStage(1050)   ; In which case make the Railroad react appropriately
endif

;if player hasn't used holotape, close and lock relay door

if GetStageDone(5) == 0
RelayDoor.GetReference().SetOpen(False)
RelayDoor.GetReference().SetLockLevel(254)
RelayDoor.GetReference().Lock()
endif

;set kid to ghosted, just to avoid player breaking stuff

ShaunChild.GetActorReference().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
; brute force method:
if Min207.IsRunning()
	; complete holotape objective
	Min207.SetStage(100)
endif

if BoS204.GetStageDone(10) == 1 && BoS204.GetStageDone(100) == 0
	BoS204.SetStage(100)
endif
;open door to relay if it was closed
RelayDoor.GetReference().SetOpen()
;update quest stage based on where we were
SetObjectiveCompleted(160)
if GetStageDone(180)==1
If PlayerInstitute_Joined.GetValue()==0
SetObjectiveDisplayed(180)
endif
endif
If GetStageDone(150)==1
if kmyquest.IntrosDone== kmyquest.IntrosTotal

SetStage(200)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_01
Function Fragment_Stage_0005_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
; If "Underground Undercover" is active then let the quest know you've made it into the Institute
if ( pRR201.IsActive() )
  pRR201.SetStage(125)
endif

if MQ206BoS.GetStageDone(1500) == 1
   (BoSDialoguePrydwen as BoSDPQuestScript).BoSTeleMove()
endif

if GetStageDone(20) == 0
if kmyquest.ElevatorSpeechStarted==0
SetObjectiveDisplayed(10, 1)
endif
endif
;open Elevator Top Door
ElevatorTopDoor.setOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
MQ207ElevatorSpeech.Start()


;handle closing and locking relay door if the player hasn't used the holotape

if GetStageDone(5) == 0
RelayDoor.GetReference().SetOpen(False)
RelayDoor.GetReference().SetLockLevel(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;MQ11ChildShaunScene.Start()

;Set the "elevator ride done" global variable
InstituteElevatorRideDone.SetValue(1)

;Start staged scene quests 4, 6 & 7
InstituteSS4.Start()
InstituteSS6.Start()
InstituteSS7.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
MQ11ChildDeactivateScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ11ShaunConvStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
;if player initially turned down offer, get rid of objective
if IsObjectiveDisplayed(180) 
SetObjectiveDisplayed(180,0)
endif


SetObjectiveDisplayed(150)
InstituteMapMarker.Enable()
InstituteMapMarker.AddToMap(True)
Door01.GetReference().Lock(False)
Door02.GetReference().Lock(False)
InstSynthCreation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;if player hasn't used holotape, point him to it
if GetStageDone(5)==0
SetObjectiveDisplayed(160)
endif

SetObjectiveDisplayed(180)

;enable bottom trigger of elevator
ElevatorBottomTrigger.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().MoveTo(CITExteriorMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if InstKickout.IsRunning() == 0
MQ00.MQFactionKickoutPlayer(4)
Game.GetPlayer().RemoveFromFaction(InstituteFaction)


;Move player to exterior

endif
SetObjectiveCompleted(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
;Fire off "You can now fast travel from Institute" tutorial
Tutorial.SetStage(1920)

Inst301.Start()
InstituteTeleportEffects.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_02
Function Fragment_Stage_0200_Item_02()
;BEGIN AUTOCAST TYPE mq206questscript
Quest __temp = self as Quest
mq206questscript kmyQuest = __temp as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ControlToggle(1)
CompleteAllObjectives()
MQ207RewardCueTrigger.Disable()
Game.AddAchievement(9)

;reward XP
;Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_03
Function Fragment_Stage_0200_Item_03()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ11OpeningSpeech Auto Const

ReferenceAlias Property Alias_TestDoorRef Auto Const

Scene Property MQ11ChildShaunScene Auto Const

Scene Property MQ11ChildDeactivateScene Auto Const

Scene Property MQ11ShaunConvStart Auto Const

Scene Property MQ207ElevatorSpeech Auto Const

Quest Property Min301 Auto Const

MQ00Script Property MQ00 Auto Const

Quest Property Min207 Auto Const

Faction Property InstituteFaction Auto Const

Quest Property Inst300 Auto Const

Quest Property Inst301 Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ReferenceAlias Property CITExteriorMarker Auto Const

GlobalVariable Property PlayerBeenToInstitute Auto Const

ReferenceAlias Property Door01 Auto Const

ReferenceAlias Property Door02 Auto Const

ReferenceAlias Property Shutters Auto Const

Quest Property InstKickOut Auto Const

Quest Property pRR201 Auto Const

Quest Property DialogueInstituteReactScene1 Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ObjectReference Property ElevatorBottomTrigger Auto Const

ObjectReference Property ElevatorTopDoor Auto Const

ReferenceAlias Property RelayDoor Auto Const

Quest Property BoS204 Auto Const

Quest Property Tutorial Auto Const

Quest Property InstituteSS4 Auto Const

Quest Property InstituteSS6 Auto Const

Quest Property InstituteSS7 Auto Const

GlobalVariable Property InstituteElevatorRideDone Auto Const

Quest Property InstituteTeleportEffects Auto Const

Quest Property InstSynthCreation Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

GlobalVariable Property PlayerInstitute_Joined Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const

MusicType Property MUSReward Auto Const

ReferenceAlias Property ShaunChild Auto Const

ObjectReference Property MQ207RewardCueTrigger Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Quest Property MQ206BoS Auto Const
