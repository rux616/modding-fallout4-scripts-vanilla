Scriptname DN151_WaterObject extends ObjectReference Hidden ;Abstract
{Script for objects that react to changes in the height of a movable water plane.}
;
;This script is an iteration of the water object script originally used in Skyrim's Nchardak dungeon.
;It lives on objects (actors, doors, buttons, etc.) that care about the height of a DN151_MovableWater movable water plane, and allows them to react
;to changes in the height of that plane in various ways.
;
;This script is not intended to be used directly. Instead, other scripts should extend it, implementing the PerformWaterUpdates function as needed
;for their specific objects.


Keyword property LinkCustom10 Auto Mandatory
{LinkCustom10 Keyword. Each DN151_WaterObject is linked to their water plane with this keyword.}

DN151_MovableWater property myWaterPlane Auto Hidden
{Water plane this object is interested in.}

bool property isPerformingWaterUpdate Auto Hidden
{Are we in the middle of a water update?}

bool initialized	;Have we run our first-time initialization yet?
Actor selfActor	;This object cast to an Actor. Will be NONE if this isn't an actor.


Event OnCellLoad()
	;Debug.Trace("RECEIVED FOR " + Self)
	if (myWaterPlane == None)
		myWaterPlane = (Self.GetLinkedRef(LinkCustom10) as DN151_MovableWater)
		if (myWaterPlane == None)
			;No water plane.
			Debug.Trace("ERROR: No water plane found for: " + Self, 2)
		ElseIf (!myWaterPlane.WaitFor3DLoad())
			;Water plane has failed to load.
			Debug.Trace("ERROR: Water plane: " + myWaterPlane + " failed to load for: " + Self, 2)
		ElseIf (!initialized)
			;A water plane was found, and has loaded.
			;Start a timer to wait for the water plane's initialization to finish.
			StartTimer(0, 1)
		EndIf
	EndIf
EndEvent

;Can't use this, since OnCellLoad doesn't fire if you quickly leave and then re-enter the cell.
;Event OnCellDetach()
;	myWaterPlane = None
;EndEvent

Function WaterUpdate(int waterStage, float waterZ)
	;Called by DN151_Movable water on all registered DN151_WaterObjects before, during, and after moving the water plane.
	;Debug.Trace("Water update for: " + Self)

	if (myWaterPlane == None)
		Debug.Trace("ERROR: Ignoring a water update for " + Self + " because myWaterPlane was NONE.", 2)
		return
	EndIf

	;Begin update.
	isPerformingWaterUpdate = True

	;Perform the updates this object is interested in.
	PerformWaterUpdateActions(waterStage, waterZ)

	;End update.
	isPerformingWaterUpdate = False
	;Debug.Trace("Completed update for: " + Self)
EndFunction

Function PerformWaterUpdateActions(int waterStage, float waterZ)
	Debug.Trace("ERROR: DN151_WaterObject's PerformWaterUpdateActions function should not be used directly. Please override it in a subclass for: " + Self, 2)
EndFunction

Function CleanupWaterObject()
	;Disable and delete this object, using a timer to avoid blocking the main thread.
	StartTimer(0, 2)
EndFunction

Event OnTimer(int timerID)
	if (timerID == 1)
		;Timer 1: Timer started by OnCellLoad; we're waiting for the water plane to initialize to finish our initialization.
		if (myWaterPlane.initialized)
			;We can initialize now.
			initialized = True

			;Register this object with the water plane.
			myWaterPlane.RegisterWaterObject(Self)

			;Cast this object to an actor and store off the result for later use.
			selfActor = (Self as ObjectReference) as Actor

			;Block follower activation on water objects.
			Self.SetNoFavorAllowed(True)

			;Update the object's state.
			WaterUpdate(myWaterPlane.myWaterStage, myWaterPlane.GetPositionZ())
		Else
			;Start a timer and continue waiting.
			StartTimer(1, 1)
		EndIf
	ElseIf (timerID == 2)
		;Timer 2: Timer started by WaterUpdate; we want to clean up this object.
		myWaterPlane.UnregisterWaterObject(Self)
		myWaterPlane.RestoreName(Self)
		Self.Disable(True)
		Self.Delete()
	EndIf
EndEvent


;/----------------------------------------
; Suggested Water Update Actions
;/----------------------------------------
; The following properties and sample function illustrate common water update actions.

Group Activate_Actions
	int property ActivateAtThisStage = -1 Auto
	{If >=0, activate this object when the water is set to this stage for the first time, passing the water as the activator. Only occurs once. Default: -1}

	int property ActivateLinkedrefAtThisStage = -1 Auto
	{If >=0, activate this object's unnamed linkedref when the water is set to this stage for the first time, passing the water as the activator. Only occurs once. Default: -1}

	int property ActivateIfBelowThisHeight = -1 Auto
	{If >=0, activate this object when the water falls below this height for the first time, passing the water as the activator. Only occurs once. Default: -1}
EndGroup
bool doneActivateAtThisStage
bool doneActivateLinkedRefAtThisStage
bool doneActivateIfBelowThisHeight

Group Toggle_Actions
	int property DisableIfBelowThisStage = -1 Auto
	{If >=0, disable this object if the water falls below this stage. When it rises to it, enable it. Default: -1}

	int property DisableIfAboveThisStage = -1 Auto
	{If >=0, disable this object if the water rises above this stage. When it falls to it, enable it. Default: -1}

	bool property DisableWithFading = False Auto
	{If True, use fading when enabling/disabling this object. If false, don't. Default: False}

	bool property DisableOnlyOnce = False Auto
	{If true, don't disable this object if it has previously been disabled.}
EndGroup
bool hasBeenDisabled

Group Submersible_Actions
	;In this context, 'Submersible' means that the object's name will be removed (overridden to none, blocking activation) under some circumstances.

	int property SubmergeAboveThisStage = -1 Auto
	{If >=0, the object will become submerged, and its name cleared, when the water rises above this stage. Its name will be restored when the water falls to or below it.}

	bool property SubmersibleFailsafeOn = False Auto Hidden
	{A failsafe that can be set by other scipts. If set to true, this object will not lose its name when it becomes submerged even if all the other conditions are satisfied.}

	ObjectReference property SubmersibleDoorSeal = None Auto
	{If set, when the door becomes submerged, closes this door.}

	bool property activateOnSubmergeOrUnsubmerge = False Auto	;Should we activate ourselves on Submerge or Unsubmerge?
EndGroup
bool isSubmerged = False 	;Is this object currently submerged?

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


Function PerformWaterUpdateActions(int waterStage, float waterZ)
	;--Activate Actions--
	;Activate objects based on the water stage.
	if (!doneActivateAtThisStage && ActivateAtThisStage >= 0 && waterStage == ActivateAtThisStage)
		Self.Activate(myWaterPlane)
		doneActivateAtThisStage = True
	EndIf
	if (!doneActivateLinkedRefAtThisStage && ActivateLinkedrefAtThisStage >= 0 && waterStage == ActivateLinkedrefAtThisStage)
		Self.GetLinkedRef().Activate(myWaterPlane)
		doneActivateLinkedRefAtThisStage = True
	EndIf
	;Activate objects based on the water height.
	if (!doneActivateIfBelowThisHeight && ActivateIfBelowThisHeight >= 0 && waterZ <= ActivateIfBelowThisHeight)
		Self.Activate(myWaterPlane)
		doneActivateIfBelowThisHeight = True
	EndIf
	;--Toggle Actions--
	;Toggle based on the water stage.
	if (DisableIfBelowThisStage >= 0 && DisableIfAboveThisStage >= 0)
		if (DisableIfBelowThisStage != DisableIfAboveThisStage)
			Debug.Trace("ERROR: Conflicting settings for WaterObject disables. Ignoring entirely.", 2)
		ElseIf (DisableIfBelowThisStage == waterStage && Self.IsDisabled())
			;Debug.Trace("Matching: Enabling " + Self)
			Self.EnableNoWait(DisableWithFading)
		ElseIf (DisableIfBelowThisStage != waterStage && !Self.IsDisabled() && (!hasBeenDisabled || !DisableOnlyOnce))
			;Debug.Trace("Matching: Disabling " + Self)
			hasBeenDisabled = True
			Self.DisableNoWait(DisableWithFading)
		EndIf
	ElseIf (DisableIfBelowThisStage >= 0)
		if (Self.IsDisabled() && waterStage >= DisableIfBelowThisStage)
			;Debug.Trace("DisableIfBelowThisStage: Enabling" + Self)
			Self.EnableNoWait(DisableWithFading)
		ElseIf (!Self.IsDisabled() && waterStage < DisableIfBelowThisStage  && (!hasBeenDisabled || !DisableOnlyOnce))
			;Debug.Trace("DisableIfBelowThisStage: Disabling" + Self)
			hasBeenDisabled = True
			Self.DisableNoWait(DisableWithFading)
		EndIf
	ElseIf (DisableIfAboveThisStage >= 0)
		if (Self.IsDisabled() && waterStage <= DisableIfAboveThisStage)
			;Debug.Trace("DisableIfAboveThisStage: Enabling " + Self)
			Self.EnableNoWait(DisableWithFading)
		ElseIf (!Self.IsDisabled() && waterStage > DisableIfAboveThisStage  && (!hasBeenDisabled || !DisableOnlyOnce))
			;Debug.Trace("DisableIfAboveThisStage: Disabling " + Self)
			hasBeenDisabled = True
			Self.DisableNoWait(DisableWithFading)
		EndIf
	EndIf
	;--Submersible Actions--
	;Submerge objects based on the water level, clearing or restoring their names.
	if (SubmergeAboveThisStage >= 0)
		;Debug.Trace("Check Submerge " + Self)
		if (!isSubmerged && (waterStage > SubmergeAboveThisStage) && !SubmersibleFailsafeOn)
			;Submerge the object.
			;Debug.Trace("Submerging " + Self)
			Self.BlockActivation(True)
			myWaterPlane.ClearName(Self)
			if (SubmersibleDoorSeal != None)
				if ((SubmersibleDoorSeal as DN151_DoorSeal) != None)
					(SubmersibleDoorSeal as DN151_DoorSeal).RestoreSeal()
				Else
					SubmersibleDoorSeal.SetOpen(False)
				EndIf
			EndIf
			if (activateOnSubmergeOrUnsubmerge)
				self.Activate(self)
			EndIf
			isSubmerged = True
		ElseIf ((isSubmerged && (waterStage <= SubmergeAboveThisStage)) || SubmersibleFailsafeOn)
			;Un-submerge the object.
			;Debug.Trace("Unsubmerging " + Self)
			Self.BlockActivation(False)
			myWaterPlane.RestoreName(Self)
			if (activateOnSubmergeOrUnsubmerge)
				self.Activate(self)
			EndIf
			isSubmerged = False
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
		StartTimer(0, 2)
	EndIf
EndFunction
/;