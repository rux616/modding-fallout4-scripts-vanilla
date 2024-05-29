;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ03_01001B41 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

SetActive()  ; Make the quest start active
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Start AcadiaM01 quest
DLC03AcadiaM01.Start()

;advance Acadia settlement dialogue
;WJS - this actually needs to fire in DLC03DialogueDiMA Stage 250
;DLC03AcadiaDialogue.SetStage(100)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;start Commonwealth faction quests
if (BoSJoined.GetValue() ==1) && (PlayerBoS_KickedOut.GetValue()== 0) && (DLC03Acadia_BoS.IsRunning()==False)
	DLC03Acadia_BOS.SetStage(10)
	DLC03Acadia_BoS_Misc.Start()
elseif DLC03Acadia_BOS.IsRunning()
	DLC03Acadia_BoS.SetStage(10)
	if DLC03Acadia_Bos_Misc.IsObjectiveCompleted(10)
		DLC03Acadia_Bos_Misc.SetObjectiveDisplayed(20)
	endif
endif
if (PlayerInstitute_Joined.GetValue()==1) && (PlayerInstitute_KickedOut.GetValue() == 0) && (DLC03Acadia_Institute.IsRunning()==False)
	DLC03Acadia_Institute.SetStage(10)
	DLC03Acadia_Institute_Misc.Start()
elseif DLC03Acadia_Institute.IsRunning()
	DLC03Acadia_Institute.SetStage(10)
	if DLC03Acadia_Institute_Misc.IsObjectiveCompleted(10)
		DLC03Acadia_Institute_Misc.SetObjectiveDisplayed(20)
	endif
endif
if (PlayerRailroad_JoinedFaction.GetValue()==1) && (PlayerRailroad_KickedOut.GetValue() == 0) && (DLC03Acadia_RR.IsRunning()==False)
	DLC03Acadia_RR.Start()
ElseIf DLC03Acadia_RR.IsRunning()
	If DLC03Acadia_RR.IsObjectiveCompleted(10)
		DLC03Acadia_RR.SetObjectiveDisplayed(10, abForce=True)
	EndIf
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
DLC03MQ03_01_KasumiChatter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
DLC03MQ03_01_KasumiChatter.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ03Script
Quest __temp = self as Quest
DLC03:DLC03MQ03Script kmyQuest = __temp as DLC03:DLC03MQ03Script
;END AUTOCAST
;BEGIN CODE
Actor FaradayREF = Alias_Faraday.GetActorRef()
Actor ChaseREF = Alias_Chase.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
Actor DiMAREF = Alias_DiMA.GetActorRef()

SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(32)
SetObjectiveDisplayed(34)
SetObjectiveDisplayed(36)

;unlock the remaining locked door in Acadia
DLC03AcadiaBackStairDoor.SetLockLevel(0)
DLC03AcadiaBackStairDoor.Lock(false)


;player can now activate the "hide" spot
Alias_HideTrigger.GetRef().Enable()

;DiMA sits back in his chair
DiMAREF.EvaluatePackage()

;move Faraday and Chase
FaradayREF.EvaluatePackage()
FaradayREF.MoveTo(DLC03MQ03FaradaytoDimaMarker)
ChaseREF.EvaluatePackage()
ChaseREF.MoveTo(DLC03MQ03ChasetoDimaMarker)

;check to see if the player gets close to any of the clues
kmyquest.RegisterForDistanceLessThanEvent(PlayerREF, Alias_StorageRoomNote.GetRef(), 200.0)
kmyquest.RegisterForDistanceLessThanEvent(PlayerREF, Alias_KeyLocationNote.GetRef(), 150.0)
kmyquest.RegisterForDistanceLessThanEvent(PlayerREF, Alias_StorageRoomKey.GetRef(), 200.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(34, abforce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(38, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(34, abforce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(34, abforce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0208_Item_00
Function Fragment_Stage_0208_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(38, False)
SetObjectiveDisplayed(42, False)
SetObjectiveDisplayed(44, False)
SetObjectiveDisplayed(34, False)
SetObjectiveDisplayed(46)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ03Script
Quest __temp = self as Quest
DLC03:DLC03MQ03Script kmyQuest = __temp as DLC03:DLC03MQ03Script
;END AUTOCAST
;BEGIN CODE
Actor DiMARef = Alias_Dima.GetActorRef()
Actor ChaseRef = Alias_Chase.GetActorRef()
Actor FaradayRef = Alias_Faraday.GetActorRef()
Actor CompanionREF = Alias_Companion.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
ObjectReference DiMAChairREF = Alias_DiMAChair.GetRef()

Bool ShouldWeResetDiMAChair

;lock player movement
kmyquest.DLC03MQ03EnableLayer = InputEnableLayer.Create()
kmyquest.DLC03MQ03EnableLayer.DisablePlayerControls(abCamSwitch=True)
Game.ForceFirstPerson()
PlayerREF.StartSneaking()
; make player invisible
PlayerREF.AddSpell(MQ203PlayerInvisibility, abVerbose=False)

;fade out the game to simulate time passing
Game.FadeOutGame(true, true, 0.0, 2.0, true)

;make sure DiMA/Faraday scene is stopped
DLC03AcadiaDialogueDiMAFaradayScene.Stop()

;ghost needed actors for scene
ChaseRef.SetGhost()
FaradayRef.SetGhost()
DiMARef.SetGhost()

;wait for fader
Utility.Wait(2.0)

DLC03MQ03_03_EavesdropScene.Start()

;check DiMA's sit state, if he's sitting or in the process of sitting, then we need to reset the chair AFTER he's warped out of it
If DiMARef.GetSitState()>= 2
  ShouldWeResetDiMAChair= True
EndIf

;warp actors ahead so we aren't waiting for them forever
ChaseRef.Moveto(DLC03MQ03ChaseWarpMarker)
FaradayRef.moveto(DLC03MQ03FaradayWarpMarker)
DiMARef.Moveto(DLC03MQ03DiMAWarpMarker)

;since we moved DiMA, reset his chair
If ShouldWeResetDiMAChair
  DiMAChairREF.PlayAnimation("play01")
EndIf

;move companion if they're in the area
If CompanionREF && (CompanionREF.IsInLocation(DLC03AcadiaLocation))
  CompanionREF.moveto(DLC03MQ03CompanionHideMarker)
EndIf

;wait for fader
Utility.Wait(2.0)

;fade the game up
Game.FadeOutGame(False, true, 0.0, 2.0, true)


;we don't need the hide trigger anymore
Alias_HideTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ03Script
Quest __temp = self as Quest
DLC03:DLC03MQ03Script kmyQuest = __temp as DLC03:DLC03MQ03Script
;END AUTOCAST
;BEGIN CODE
Actor DiMARef = Alias_Dima.GetActorRef()
Actor ChaseRef = Alias_Chase.GetActorRef()
Actor FaradayRef = Alias_Faraday.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

;fade out the game to simulate time passing
Game.FadeOutGame(true, true, 0.0, 3.0, true)

;wait for fader
Utility.Wait(3.0)

;make certain the scene has stopped
DLC03MQ03_03_EavesdropScene.Stop()

;unghost actors
ChaseRef.SetGhost(False)
FaradayRef.SetGhost(False)
DiMARef.SetGhost(False)

;move them back
ChaseRef.Moveto(DLC03MQ03ChasetoDimaMarker)
FaradayRef.Moveto(DLC03MQ03FaradaytoDimaMarker)
DiMARef.MovetoMyEditorLocation()

; make player visible
PlayerREF.RemoveSpell(MQ203PlayerInvisibility)

;player is forced to stand because we turned on the cameras, so put him back to sneak
PlayerREF.StartSneaking()

;wait for fader
Utility.Wait(3.0)

;fade the game up
Game.FadeOutGame(False, true, 1.0, 3.0, true)

;player can move
kmyquest.DLC03MQ03EnableLayer.EnablePlayerControls()
kmyquest.DLC03MQ03EnableLayer = None

SetObjectiveCompleted(30)
SetObjectiveDisplayed(32, False)
SetObjectiveCompleted(46)
SetObjectiveDisplayed(36, False)

SetObjectiveDisplayed(60)
SetObjectiveDisplayed(65)

;enable the version of the program that is available for this path
Alias_EavesdropPathProgram.GetRef().Enable()

;companion comments
DLC03MQ03_03a_EavesdropCompanionReaction.Start()

;player can also download it from Faraday's terminal
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32, False)
SetObjectiveDisplayed(34, False)
SetObjectiveDisplayed(38, False)
SetObjectiveDisplayed(42, False)
SetObjectiveDisplayed(44, False)
SetObjectiveDisplayed(46, False)
SetObjectiveCompleted(36)

SetObjectiveDisplayed(60)
SetObjectiveDisplayed(65)

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03MQ03FaradayProgram)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;make sure to remove the "Hide and Wait" activator
Alias_HideTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

SetObjectiveCompleted(30)
SetObjectiveCompleted(32)
SetObjectiveDisplayed(34, False)
SetObjectiveDisplayed(36, False)
SetObjectiveDisplayed(38, False)
SetObjectiveDisplayed(42, False)
SetObjectiveDisplayed(44, False)
SetObjectiveDisplayed(46, False)
SetObjectiveDisplayed(65, False)

If PlayerREF.GetItemCount(DLC03MQ03FaradayProgram) == 0
  PlayerREF.AddItem(DLC03MQ03FaradayProgram)
EndIf

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

;MQ04 needs to be running in case the player skips ahead
DLC03MQ04.SetStage(10)

;unlock terminal leading to memory banks
Alias_MemoryBanksOuterTerminal.GetRef().Lock(False)

;make sure to remove the "Hide and Wait" activator
Alias_HideTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
DLC03MQ04.SetStage(20)
Game.AddAchievement(60)

;start Commonwealth Faction quests if they're not already running
if DLC03Acadia_BOS.IsRunning()==0
	if (BoSJoined.GetValue() ==1) && (PlayerBoS_KickedOut.GetValue()== 0)
		DLC03Acadia_BOS.Start()
		DLC03Acadia_BoS_Misc.Start()
	endif
endif
if DLC03Acadia_Institute.IsRunning()==0
	if (PlayerInstitute_Joined.GetValue()==1) && (PlayerInstitute_KickedOut.GetValue() == 0)
		DLC03Acadia_Institute.Start()
		DLC03Acadia_Institute_Misc.Start()
	endif
endif
if DLC03Acadia_RR.IsRunning()==0
	if (PlayerRailroad_JoinedFaction.GetValue()==1) && (PlayerRailroad_KickedOut.GetValue() == 0)
		DLC03Acadia_RR.Start()
	endif
endif

;this quest is now stopped when you get to the memory banks
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;make sure to remove the "Hide and Wait" activator
Alias_HideTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03MQ03_01_KasumiChatter Auto Const Mandatory

Quest Property DLC03AcadiaM01 Auto Const Mandatory

ReferenceAlias Property Alias_HideTrigger Auto Const Mandatory

Scene Property DLC03MQ03_03_EavesdropScene Auto Const Mandatory

ReferenceAlias Property Alias_DiMA Auto Const Mandatory

ReferenceAlias Property Alias_Chase Auto Const Mandatory

ReferenceAlias Property Alias_Faraday Auto Const Mandatory

ObjectReference Property DLC03MQ03ChaseWarpMarker Auto Const Mandatory

ObjectReference Property DLC03MQ03FaradayWarpMarker Auto Const Mandatory

ObjectReference Property DLC03MQ03DiMAWarpMarker Auto Const Mandatory

Quest Property DLC03MQ04 Auto Const Mandatory

Key Property DLC03FaradayTerminalPassword Auto Const Mandatory

ObjectReference Property TheNucleusMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_MemoryBanksOuterTerminal Auto Const Mandatory

ObjectReference Property DLC03MQ03FaradaytoDimaMarker Auto Const Mandatory

ObjectReference Property DLC03MQ03ChasetoDimaMarker Auto Const Mandatory

Key Property DLC03MQ03FaradayProgram Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Location Property DLC03AcadiaLocation Auto Const Mandatory
ObjectReference Property DLC03MQ03CompanionHideMarker Auto Const Mandatory

ReferenceAlias Property Alias_StorageRoomNote Auto Const Mandatory

ReferenceAlias Property Alias_KeyLocationNote Auto Const Mandatory

ReferenceAlias Property Alias_StorageRoomKey Auto Const Mandatory

ReferenceAlias Property Alias_EavesdropPathProgram Auto Const Mandatory

ObjectReference Property DLC03AcadiaBackStairDoor Auto Const

Quest Property DLC03AcadiaM03 Auto Const Mandatory

Scene Property DLC03MQ03_03a_EavesdropCompanionReaction Auto Const Mandatory

SPELL Property MQ203PlayerInvisibility Auto Const Mandatory

GlobalVariable Property BoSJoined Auto Const Mandatory

GlobalVariable Property PlayerBoS_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_BoS Auto Const Mandatory

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory

GlobalVariable Property PlayerRailroad_JoinedFaction Auto Const Mandatory

GlobalVariable Property PlayerRailroad_KickedOut Auto Const Mandatory

GlobalVariable Property PlayerInstitute_Joined Auto Const Mandatory

GlobalVariable Property PlayerInstitute_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

Quest Property DLC03Acadia_Institute Auto Const Mandatory

Quest Property DLC03Acadia_Institute_Misc Auto Const Mandatory

Quest Property DLC03AcadiaDialogue Auto Const Mandatory

ReferenceAlias Property Alias_DimaChair Auto Const Mandatory

ObjectReference Property DLC03DiMAStandMarker02 Auto Const Mandatory

Scene Property DLC03AcadiaDialogueDiMAFaradayScene Auto Const Mandatory
