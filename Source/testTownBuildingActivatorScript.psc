Scriptname testTownBuildingActivatorScript extends ObjectReference
{test script for "building" town buildings}

import math

auto state Waiting
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()  
			; show "build menu"
		    gotoState("ReadyToBuild")
			menuIndex = TestTownBuildMenu.Show()
			debug.trace(self + "menuIndex=" + menuIndex)
			if menuIndex < myBuildingObjects.Length
				; for now, delete previous building
				if myReference
					myReference.Delete()
				endif
				; build it
				debug.trace(self + " building " + myBuildingObjects[menuIndex])
				myReference = GetLinkedRef().placeatme(myBuildingObjects[menuIndex])
				; update position to in front of player
				UpdatePosition(myReference)
				StartTimer(fUpdateInterval, 0)
			endif
		endif
	EndEvent
endState

state ReadyToBuild
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()  
			; stop updating
			CancelTimer(0)
			; reset to waiting state
			GotoState("Waiting")
		endif
	endEvent

	; udpate building object position
	Event OnTimer(int aiTimerID)
		if aiTimerID == 0
			UpdatePosition(myReference)
			StartTimer(fUpdateInterval, 0)
		else
			; etc.
		endif
	endEvent

endState

; call this function to update ref's position to match player's position and rotation
function UpdatePosition(ObjectReference akRef)
	actor player = Game.GetPlayer()
	; player's heading angle
	float playerAngleZ = player.GetAngleZ()
	debug.trace(self + " player angle = " + playerAngleZ)
	float angleZ = akRef.GetAngleZ()

	; rotate by 90 each 15 degrees of player rotation
	int rotations = floor(playerAngleZ/15.0)
	debug.trace(self + " rotations (per 15 degrees) = " + rotations)
	float newAngle = rotations * 90.0
	debug.trace(self + " new building angle = " + newAngle)

	; calculate difference in current angle, in 90 degree increments
	float diff = (newAngle - angleZ)/90.0  	; try being twice as sensitive so building rotates faster
	if abs(diff) >= 1.0
		debug.trace(self + "diff = " + diff)
		; rotate to new angle
		debug.trace(self + "rotating to new angle = " + newAngle)
		akRef.SetAngle(0.0, 0.0, newAngle)
	endif
endFunction

STATIC[] Property myBuildingObjects Auto Const

float fPlaceDistance = 200.0 	; how far from player to place object
float fUpdateInterval = 0.05	; how fast to update object position

ObjectReference myReference

Message Property TestTownBuildMenu Auto Const

int menuIndex	; index from menu, matches myBuildingObjects array
