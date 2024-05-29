Scriptname DLC01:MQ02QuestScript extends Quest conditional

;If player does not take Ada on as a companion, move Ada to her package location.
;This way Ada will be at a fast travel location when the player is done with General Atomics and not wandering
;the Commonwealth, trying to get to a location.
Function MoveAda()
	debug.trace(self + " Function called")
	If Alias_Ada.GetActorRef().IsInFaction(CurrentCompanionFaction) == 0
		debug.trace(self + " MoveAda")
		Alias_Ada.GetActorRef().MoveToPackageLocation()
	EndIf
EndFunction

Faction Property CurrentCompanionFaction Auto Const Mandatory

;Updates the stages for building the robot workbench and speaking to Ada to make sure they hide themselves
;and redisplay when needed.
function UpdateObjective(int currentWorkbenchCount, WorkshopObjectScript newObject, WorkshopScript workshopRef)
	debug.trace("UpdateObjective " + currentWorkbenchCount + " " + newObject)
	If currentWorkbenchCount > 0
		bWorkbenchBuilt = True
		If GetStageDone(2500) == True && GetStageDone(2900) == 0
			SetObjectiveCompleted(ObjectiveWorkbenchBuilt)
			SetStage(2600)
			If GetStageDone(2800) == 0
				SetObjectiveDisplayed(2600, True)
			EndIf
		EndIf
	EndIf
	If currentWorkbenchCount == 0
		bWorkbenchBuilt = False
		If GetStageDone(2500) == True && GetStageDone(2900) == 0
			SetObjectiveCompleted(ObjectiveWorkbenchBuilt, false)
			SetObjectiveDisplayed(2600, False)
		EndIf
	EndIf
	; SetObjectiveDisplayed(ObjectiveWorkbenchBuilt, true)

	If newObject && newObject.HasKeyword(DLC01WorkbenchRobotKeyword)
		If Alias_WorkbenchRobots.GetCount() > 0
			debug.trace(self + "	workbench built - set workshop location")
			; set workshop location
			Alias_Workshop.ForceRefTo(workshopRef)
			; force workbench into workbench alias for quest
			Alias_Workbench.ForceRefTo(newObject)
			; move marker from holding cell to workbench
			Alias_WorkbenchMarker.GetRef().MoveTo(Alias_RobotWorkbenchQuestTarget.GetRef())
			; have Ada re-evaluate her package
			Alias_Ada.GetActorRef().EvaluatePackage()
		EndIf
	EndIf
	; use instead of quest stage in dialogue conditions
	; bWorkbenchBuilt = isObjectiveCompleted(ObjectiveWorkbenchBuilt)
EndFunction


;This portion of the script controls advancement for Stage 2800, Install the Radar Beacon.
Event OnInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerModRobot")
EndEvent

Event Actor.OnPlayerModRobot(Actor akSender, Actor akRobot, ObjectMod akModBaseObject)
	Debug.trace(self + "Player modified robot " + akRobot + " with " + akModBaseObject)
	If akRobot == Alias_Ada.GetActorRef() && akModBaseObject == DLC01Bot_Torso_Misc_MQ02RadarBeacon02 && GetStageDone(2800) == 1
	;Checks to be sure Ada is the one being modded and the radar beacon is the mod being applied.
		Debug.trace(self + "Player set stage")
		SetStage(2900)
	Endif
EndEvent

bool Property bWorkbenchBuilt = false Auto Conditional

Keyword property DLC01WorkbenchRobotKeyword Auto Const mandatory
refCollectionAlias property Alias_WorkbenchRobots auto const mandatory
GlobalVariable Property DLC01MQ02WorkbenchesBuilt Auto Const
GlobalVariable Property DLC01MQ02WorkbenchesTotal Auto Const

int property ObjectiveWorkbenchBuilt = 2500 auto const
{ objective for building workbench }

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_WorkbenchMarker Auto Const
ReferenceAlias Property Alias_Workbench Auto Const
ReferenceAlias Property Alias_Ada Auto Const

;These properties are for Stage 2800, Install the Radar Beacon
ObjectMod Property DLC01Bot_Torso_Misc_MQ02RadarBeacon02 Auto Const

int property BuildWorkbenchStartStage = 10 const auto
{ when this stage is set, start updating build workbench objective}
int property BuildWorkbenchStopStage = 2900 const auto
{ when this stage is set, stop updating build workbench objective}


ReferenceAlias Property Alias_RobotWorkbenchQuestTarget Auto Const
