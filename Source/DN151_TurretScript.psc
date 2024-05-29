Scriptname DN151_TurretScript extends Actor Hidden
{Script for the DN151 water puzzle turrets.}
;
;This script lives on the turrets in DN151, which are all also DN151_ActorScripts. It exists to intercept SetUnconscious calls
;and re-check whether we *really* want the turret to be conscious or not. This is used to resolve a conflict: the standard native terminal
;system (which we have to use for consistency) will just call SetUnconscious, but we don't want terminals underwater to become conscious.
;Similarly, DN151_WaterObject's WaterUpdate function justs call SetUnconscious, but we don't want terminals that have been deactivated to become conscious.
;
;This script could become out of sync if water updates and terminal deactivations are interleaved, but the layout
;of the level makes that effectively impossible-- you can't reach the terminal in time. Also, the next water update will correct the error.

DN151_ActorScript myDN151ActorScript 	;Self cast to a DN151_ActorScript.
DN151_MovableWater myWaterPlane 		;myWaterObject's DN151_MovableWater water plane.

bool property isDeactivated = False auto hidden 			;As far as the terminal system is concerned, is this turret deactivated?
bool expectingConsciousnessStateChange = False			;Are we anticipating a consciousness state change? If so, don't intercept it.


Event OnInit()
	myDN151ActorScript = (Self as ObjectReference) as DN151_ActorScript
	if (myDN151ActorScript == None)
		Debug.Trace("ERROR: " + Self + " has no DN151_ActorScript.", 2)
	EndIf
EndEvent

Event OnConsciousnessStateChanged(bool abUnconscious)
	;Debug.Trace("TURRET: " + Self + " OnConsciousnessStateChanged to " + IsUnconscious() + "; Expected? " + expectingConsciousnessStateChange)

	if (expectingConsciousnessStateChange)
		expectingConsciousnessStateChange = False
	Else
		RecheckConsciousness()
	EndIf
EndEvent

Function RecheckConsciousness()
	if (!Self.IsDead() && Self.Is3DLoaded())
		;If the turret is not performing a water update, the change has come from the terminal.
		if (!myDN151ActorScript.IsPerformingWaterUpdate)
			;Debug.Trace("Deactivating Turrets!!!")
			isDeactivated = IsUnconscious()
		EndIf
		
		if (myWaterPlane == None)
			myWaterPlane = myDN151ActorScript.myWaterPlane
		EndIf

		bool shouldBeUnconscious
		if (isDeactivated || (myWaterPlane == None) || (myWaterPlane.GetWaterHeight() > myDN151ActorScript.UnconsciousIfAboveThisHeight))
			shouldBeUnconscious = True
		EndIf

		;Debug.Trace("TURRET: " + Self + " Rechecks Consciousness. Currently: " + IsUnconscious() + "; should be: " + shouldBeUnconscious)
		;Debug.Trace("      - " + isDeactivated + ", " + myWaterPlane.GetWaterHeight() + ", " + myDN151ActorScript.UnconsciousIfAboveThisHeight)
		if (shouldBeUnconscious != IsUnconscious())
			expectingConsciousnessStateChange = True
			SetUnconscious(shouldBeUnconscious)
		EndIf
	EndIf
EndFunction