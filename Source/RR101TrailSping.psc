Scriptname RR101TrailSping extends ObjectReference Conditional
{ This script spins the trail marker}

import game
import debug

; struct to store letters and their rotations (both clockwise and counter-clockwise)
struct MarkerLetterInfo
	string LetterName
	{ What letter are we on }

	float Rotation
	{ float in degrees of the letter }
endStruct

MarkerLetterInfo[] property MarkerLetters Auto Const
{ the signal interceptor items - minus the initial item (platform) }

int property Letter = 0 auto
{ This is the index of the currently selected letter }

float myStartX
float myStartY
float myStartZ
float myStartRX
float myStartRY
float myStartRZ
float zOffset

bool bFlagSet

int bFirstSpin

;auto STATE waitingForPlayer
;	EVENT onActivate(objectReference triggerRef)
function SpinLetters(bool bClockwise = true)
		setHomeCoords()									; Sets up the markers current coords
		pQSTRR01RailroadPuzzleTurn.Play(self)			; Play a sound

		; If this is the first spin, say something
		if ( bFirstSpin == 0 )
			pRR101_PuzzleFirstSpin.Start()
			bFirstSpin = 1
		endif

		; Update the current letter
		if ( Letter == 20 && bClockwise ) ; If it's the last letter, loop back to the beginning
			Letter = 0
		elseif  ( Letter == 0 && !bClockwise )
			Letter = 20
		else
			if ( bClockwise == TRUE )
				Letter += 1  	; If it's clockwise increment the letter
			else
				Letter -= 1     ; For counter-clockwise decrement
			endif
		endif

		zOffset = MarkerLetters[Letter].Rotation 	; Grab the rotation off the array

		; Spin the dial
		TranslateTo(myStartX, myStartY, myStartZ, myStartRX, myStartRY, zOffset, 0.0, 100.0)
endFunction
;	endEVENT
;endSTATE

;STATE hasBeenTriggered
	; this is an empty state.
;endSTATE


function setHomeCoords()
	myStartX = self.GetPositionX()
	myStartY = self.GetPositionY()
	myStartZ = self.GetPositionZ()
	myStartRX = self.GetAngleX()
	myStartRY = self.GetAngleY()
	myStartRZ = self.GetAngleZ()   
endFunction

sound Property pOBJFreedomTrailMarkerTurn Auto Const

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

sound Property pQSTRR01RailroadPuzzleTurn Auto Const

Scene Property pRR101_PuzzleFirstSpin Auto Const
