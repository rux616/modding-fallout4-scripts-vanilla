Scriptname RR101TrailMarker extends ObjectReference
{ This script allows a lever to do nothing under certain conditions}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

GlobalVariable property MarkerID auto
{ This indicates which Trail Marker this is}

GlobalVariable property MarkerSolved auto
{ This is the variable tracking the total number of markers that have been correctly solved}

int property Stage = -1 auto
{ Indicates if a stage is fired when this trail marker is activated}

Message property SuccessMessage Auto Const
{ The message that plays if the object is put in the right position}

Message property FailMessage Auto Const
{ The message that plays if the object is put in the wrong position}

GlobalVariable property Marker01 auto
GlobalVariable property Marker02 auto
GlobalVariable property Marker03 auto
GlobalVariable property Marker04 auto
GlobalVariable property Marker05 auto
GlobalVariable property Marker06 auto
GlobalVariable property Marker07 auto
GlobalVariable property Marker08 auto

float myStartX
float myStartY
float myStartZ
float myStartRX
float myStartRY
float myStartRZ
float zOffset

bool bFlagSet

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		setHomeCoords()

		pOBJFreedomTrailMarkerTurn.Play(self)

		if (triggerRef == getPlayer() as actor ) && !myQuest.IsStageDone(400)
			if MarkerID.GetValue() == 0
				; Marker is GOOD
				MarkerID.SetValue(1)
				SuccessMessage.Show()

				; Increment the total number of solved markers
				myQuest.ModObjectiveGlobal(1.0, MarkerSolved)

				; Rotate the marker
				TranslateTo(myStartX, myStartY, myStartZ, myStartRX, myStartRY, myStartRZ + 12.0, 0.0, 100.0)

				Debug.Trace(myStartX + " " + myStartY + " " + myStartZ + " " + myStartRX + " " + myStartRY + " " + myStartRZ)
				setNewQuestMarker()
		elseif MarkerID.GetValue() == 1 && !myQuest.IsStageDone(400)
				; Marker is BAD
				MarkerID.SetValue(0)
				FailMessage.Show()

				; Decrement the total number of solved markers
				myQuest.ModObjectiveGlobal(-1.0, MarkerSolved)

				; Rotate the marker
				TranslateTo(myStartX, myStartY, myStartZ, myStartRX, myStartRY, myStartRZ + 12.0, 0.0, 100.0)
				setNewQuestMarker()
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE


function setHomeCoords()
	myStartX = self.GetPositionX()
	myStartY = self.GetPositionY()
	myStartZ = self.GetPositionZ()
	myStartRX = self.GetAngleX()
	myStartRY = self.GetAngleY()
	myStartRZ = self.GetAngleZ()   
endFunction

function setNewQuestMarker()
	; Check to see which Trail Marker hasn't been solved first, then toggle its objective (then hide everything past that)
	bFlagSet = 0

	; Something special happens the first time you click on a marker
	myQuest.SetStage(200)

	if Marker01.GetValue() == 0
		myQuest.SetObjectiveDisplayed(111, true, true)
		bFlagSet = true
		Debug.Trace("Marker 1")
	else
		DealWithSuccess(111)
	endif

	if Marker02.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(112, true, true)
		bFlagSet = true
		Debug.Trace("Marker 2")
	else
		DealWithSuccess(112)
	endif

	if Marker03.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(113, true, true)
		bFlagSet = true
		Debug.Trace("Marker 3")
	else
		DealWithSuccess(113)
	endif

	if Marker04.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(114, true, true)
		bFlagSet = true
		Debug.Trace("Marker 4")
	else
		DealWithSuccess(114)
	endif

	if Marker05.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(115, true, true)
		bFlagSet = true
		Debug.Trace("Marker 5")
	else
		DealWithSuccess(115)
	endif

	if Marker06.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(116, true, true)
		bFlagSet = true
		Debug.Trace("Marker 6")
	else
		DealWithSuccess(116)
	endif

	if Marker07.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(117, true, true)
		bFlagSet = true
		Debug.Trace("Marker 7")
	else
		DealWithSuccess(117)
	endif

	if Marker08.GetValue() == 0 && bFlagSet == false
		myQuest.SetObjectiveDisplayed(118, true, true)
		bFlagSet = true
		Debug.Trace("Marker 8")
	else
		DealWithSuccess(118)
	endif

	if MarkerSolved.GetValue() == 8
		; This is the case where everything has been properly solved
		myQuest.SetStage(400)
	endif

endFunction

function DealWithSuccess(int nObjective)

	if MarkerSolved.GetValue() == 8
		myQuest.SetObjectiveCompleted(nObjective, true)	
	else
		myQuest.SetObjectiveDisplayed(nObjective, false)	
	endif	

endFunction
sound Property pOBJFreedomTrailMarkerTurn Auto Const
