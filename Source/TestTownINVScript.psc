Scriptname TestTownINVScript extends ObjectReference
{test script for "building" town objects
for now, put on inventory object that you can grab and drop}

auto state Waiting
	Event OnGrab()
	    ; when grabbed go into "building mode"
		; show "build menu"
	    gotoState("ReadyToBuild")
		menuIndex = TestTownBuildMenu.Show()
		debug.trace(self + "menuIndex=" + menuIndex)
		; build it
		if menuIndex < myBuildingObjects.Length
			debug.trace(self + " building " + myBuildingObjects[menuIndex])
			myReference = Game.GetPlayer().placeatme(myBuildingObjects[menuIndex])
			; update position to in front of player
			UpdatePosition(myReference)
			StartTimer(fUpdateInterval, 0)
		endif
	EndEvent
endState

state ReadyToBuild
	Event OnRelease()
		; stop updating
		CancelTimer(0)
		; reset to waiting state
		GotoState("Waiting")
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
	float angleZ = player.GetAngleZ()
	float playerX = player.GetPositionX()
	float playerY = player.GetPositionY()
	float playerZ = player.GetPositionZ()

	debug.trace(self + " player at " + playerX + ", " + playerY + ", " + playerZ)
	debug.trace(self + " angle = " + angleZ)
	; calculate x, y displacement
	float deltaX = Math.sin(angleZ) * fPlaceDistance
	float deltaY = Math.cos(angleZ) * fPlaceDistance
	debug.trace(self + " deltaX = " + deltaX)
	debug.trace(self + " deltaY = " + deltaY)
	; do we need to move? (don't if position is close to where we want to move it)
	if Math.ABS((playerX+deltaX) - akRef.GetPositionX() ) > 1.0 && Math.ABS((playerY+deltaY) - akRef.GetPositionY() ) > 1.0
		; move to player's position + deltas
		; TEMP: for now, just set z to 0 since z reported from player is wrong
		akRef.SetPosition(playerX+deltaX, playerY+deltaY, 0.0)
		akRef.SetAngle(0.0, 0.0, angleZ)
	endif
endFunction

STATIC[] Property myBuildingObjects Auto Const

static Property xMarkerHeading Auto Const

float fPlaceDistance = 200.0 	; how far from player to place object
float fUpdateInterval = 0.05	; how fast to update object position

ObjectReference myReference

Message Property TestTownBuildMenu Auto Const

int menuIndex	; index from menu, matches myBuildingObjects array
