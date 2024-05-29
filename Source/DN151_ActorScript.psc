Scriptname DN151_ActorScript extends DN151_WaterObject Hidden
{Script for the DN151 water puzzle actors (Mirelurks, Turrets, etc.).}
;
;Script for Actors in DN151 who respond to the changing water level. Actors in this space care about some Activation and Toggle actions, Consciousness actions, and Cleanup actions.

Group Activate_Actions
	int property ActivateAtThisStage = -1 Auto
	{If >=0, activate this object when the water is set to this stage for the first time, passing the water as the activator. Only occurs once. Default: -1}

	int property ActivateIfBelowThisHeight = -1 Auto
	{If >=0, activate this object when the water falls below this height for the first time, passing the water as the activator. Only occurs once. Default: -1}
EndGroup
bool doneActivateAtThisStage
bool doneActivateLinkedRefAtThisStage
bool doneActivateIfBelowThisHeight

Group Toggle_Actions
	int property DisableIfAboveThisStage = -1 Auto
	{If >=0, disable this object if the water rises above this stage. When it falls to it, enable it. Default: -1}

	bool property DisableWithFading = False Auto
	{If True, use fading when enabling/disabling this object. If false, don't. Default: False}

	bool property DisableOnlyOnce = False Auto
	{If true, don't disable this object if it has previously been disabled.}
EndGroup
bool hasBeenDisabled

Group Consciousness_Actions
	int property UnconsciousIfAboveThisHeight = -1 Auto
	{If >=0, set this object unconscious if the water rises above this height. When it falls to or below it, restore consciousness. Default: -1}
EndGroup


Group Cleanup_Actions
	;These cleanup actions are used to remove actors that have died in the water and sunk, since their corpses interact with Havok and may impact performance.

	bool property ShouldDisableActorsWhenSubmerged = True Auto
	{If this is an Actor, should we disable it when becomes submerged by ShouldDisableWhenSubmergedDistance? Default: TRUE}

	float property ShouldDisableActorsWhenSubmergedDistance = 300.0 Auto
	{If ShouldDisableActorsWhenSubmerged, distance the object has to be sumberged by to trigger the disable. Default: 300u}
EndGroup

Actor selfActor ;Self cast to an Actor.


Event OnInit()
	selfActor = (Self as ObjectReference) as Actor
EndEvent

Function PerformWaterUpdateActions(int waterStage, float waterZ)
	;--Activate Actions--
	;Activate objects based on the water stage.
	if (!doneActivateAtThisStage && ActivateAtThisStage >= 0 && waterStage == ActivateAtThisStage)
		Self.Activate(myWaterPlane)
		doneActivateAtThisStage = True
	EndIf
	;Activate objects based on the water height.
	if (!doneActivateIfBelowThisHeight && ActivateIfBelowThisHeight >= 0 && waterZ <= ActivateIfBelowThisHeight)
		Self.Activate(myWaterPlane)
		doneActivateIfBelowThisHeight = True
	EndIf

	;--Toggle Actions--
	;Toggle based on the water stage.
	if (DisableIfAboveThisStage >= 0)
		if (Self.IsDisabled() && waterStage <= DisableIfAboveThisStage)
			;Debug.Trace("DisableIfAboveThisStage: Enabling " + Self)
			Self.EnableNoWait(DisableWithFading)
		ElseIf (!Self.IsDisabled() && waterStage > DisableIfAboveThisStage  && (!hasBeenDisabled || !DisableOnlyOnce))
			;Debug.Trace("DisableIfAboveThisStage: Disabling " + Self)
			hasBeenDisabled = True
			Self.DisableNoWait(DisableWithFading)
		EndIf
	EndIf

	;--Consciousness Actions--
	;Set objects conscious or unconscious based on the water height.
	if (UnconsciousIfAboveThisHeight >= 0)
		;Debug.Trace("Unconscious Check " + selfActor + ", " + selfActor.IsUnconscious() + ", " + waterZ + ", " + UnconsciousIfAboveThisHeight)
		if (selfActor != None && selfActor.IsUnconscious() && waterZ <= UnconsciousIfAboveThisHeight)
			;Debug.Trace("UnconsciousIfAboveThisHeight: Setting Conscious " + Self)
			selfActor.SetUnconscious(False)
		ElseIf (selfActor != None && !selfActor.IsUnconscious() && waterZ > UnconsciousIfAboveThisHeight)
			;Debug.Trace("UnconsciousIfAboveThisHeight: Setting Unconscious " + Self)
			selfActor.SetUnconscious(True)
		EndIf
	EndIf

	;--Cleanup Actions--
	;Disable dead actors who are underwater.
	if (ShouldDisableActorsWhenSubmerged && (selfActor != None) && selfActor.IsDead() && InBounds(waterZ))
		;We need to disable and delete this actor. Handle this as a timer to avoid blocking the main thread.
		Parent.CleanupWaterObject()
	EndIf
EndFunction

;Bounds check. Determine if this object is underneath the water plane.
bool Function InBounds(float waterZ)
	float waterX = myWaterPlane.GetPositionX()
	float selfX = self.GetPositionX()
	float waterY = myWaterPlane.GetPositionX()
	float selfY = self.GetPositionY()
	float waterWidth = myWaterPlane.GetWidth() ;Water1024 planes are square, so width is the same as height.
	;Debug.Trace(waterX +", "+ selfX +", "+ waterY +", "+ selfY +", "+ waterWidth)
	return (self.GetPositionZ() + ShouldDisableActorsWhenSubmergedDistance < waterZ) && (selfX >= waterX) && (selfX <= waterX + waterWidth) && (selfY >= waterY) && (selfY <= waterY + waterWidth)
EndFunction