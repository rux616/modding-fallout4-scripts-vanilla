Scriptname DN033_PlayerMoveScript extends ObjectReference Hidden
{Moves the Player to a marker for a time and then moves player back}

ObjectReference Property myEnableMarker01 auto const
ObjectReference Property myEnableMarker02 auto const
ObjectReference Property myEncounterMarker auto const
ObjectReference Property myCollisionMarker auto const
ObjectReference Property myAmbushTriggerMarker auto const
ObjectReference Property myDoor auto const
ImagespaceModifier Property myIMOD auto const mandatory
ImagespaceModifier Property myIMODWarp auto const mandatory
Sound Property mySoundIn auto const mandatory
Sound Property mySoundOut auto const mandatory

int myTimer = 10
int myTimerID = 0
bool myTimerActive = false
bool doOnce = false
InputEnableLayer myLayer

;**********************************************************

Function CleanUp()
	gotoState("DoNothing")
	CancelTimer(myTimerID)
	mySoundOut.Play(game.GetPlayer())
	myIMOD.apply()
	Utility.wait(0.1)
	;enable VATS
	myLayer.EnableVATS()
	myEnableMarker01.disableNoWait()
	if(myEnableMarker02)
		myEnableMarker02.disableNoWait()
	endIf
	if(myEncounterMarker)
		myEncounterMarker.enableNoWait()
	endIf
	Utility.wait(0.5)
	myIMODWarp.Remove()
	Utility.wait(1.0)
	myCollisionMarker.disableNoWait()
	Utility.wait(1.0)
	if(myAmbushTriggerMarker)
		myAmbushTriggerMarker.enableNoWait()
	endif
endFunction

;**********************************************************

Event OnTimer(int aiTimerID)
    if (aiTimerID == myTimerID)
    	CleanUp()
   	endif
EndEvent

;**********************************************************

auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
	    ;another trigger sends the activation event
	    if(myTimerActive)
		    CleanUp()
		endif
	EndEvent

	Event OnTriggerEnter(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			if(doOnce == false)
				doOnce = true
				myLayer = InputEnableLayer.Create()
				;disable VATS
				myLayer.EnableVATS(false)
				myCollisionMarker.enableNoWait()
				mySoundIn.Play(game.GetPlayer())
				myIMOD.apply()
				Utility.wait(0.1)
				myEnableMarker01.enableNoWait()
				if(MyDoor)
					myDoor.disableNoWait()
				endif
				Utility.wait(0.5)
				myIMODWarp.apply()
				StartTimer(myTimer, myTimerID)
				myTimerActive = true
			endif
		endIf
	EndEvent
endState

;**********************************************************

State DoNothing
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
endState


;**********************************************************