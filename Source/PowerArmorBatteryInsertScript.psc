Scriptname PowerArmorBatteryInsertScript extends ObjectReference

Keyword Property batteryItemKW Auto
Keyword Property batteryInsertAnimKW Auto
Keyword Property firstPersonKW Auto
Keyword Property PlayerPathToFurniture Auto
Keyword Property powerArmorFurnitureKW Auto

Int Property numBatteryAdds = 0 auto

; we need a REALLY long timer here because if we do the stuff in FinishCoreInsertion
; while the player is pathing to the power armor or loading 
; or playing the insert animation they'll be completely borked
Float InsertFailTimeout = 16.0
Int InsertFailTimer = 12

InputEnableLayer insertingDisableLayer

Function FinishCoreInsertion()
	CancelTimer(InsertFailTimer)
	Game.GetPlayer().RemoveKeyword(batteryInsertAnimKW)
	RemoveKeyword(batteryInsertAnimKW)
	RemoveKeyword(firstPersonKW)
	RemoveKeyword(PlayerPathToFurniture)
	AddKeyword(powerArmorFurnitureKW)
	Game.GetPlayer().SetAnimationVariableBool("bRenderFirstPersonInWorld", false)
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
	Self.BlockActivation(False)
	if( insertingDisableLayer )
		insertingDisableLayer.Reset()
		insertingDisableLayer.Delete()
		insertingDisableLayer = None
	endIf
	gotoState("waitingForBattery")
	numBatteryAdds = 0
EndFunction

Event OnLoad()
	if Is3DLoaded()
		AddInventoryEventFilter(batteryItemKW)
	endIf
EndEvent

Event OnUnload()
	RemoveAllInventoryEventFilters()
EndEvent

auto STATE waitingForBattery
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		debug.trace("item " + akBaseItem + " being added to power armor")
		; for some reason this gets called twice when you move a battery to the armor, and merely shifting to another state didn't prevent this function from being called
		if (Is3DLoaded() && akBaseItem.HasKeyword(batteryItemKW) && akSourceContainer == Game.GetPlayer() && numBatteryAdds < 1)
			numBatteryAdds = numBatteryAdds + 1
			gotoState("playingBatteryAnim")
			insertingDisableLayer = InputEnableLayer.Create()
			insertingDisableLayer.DisablePlayerControls()
			debug.trace("adding keyword " + batteryInsertAnimKW)
			Game.GetPlayer().AddKeyword(batteryInsertAnimKW)
			Self.AddKeyword(batteryInsertAnimKW)
			Self.AddKeyword(firstPersonKW)
			Self.AddKeyword(PlayerPathToFurniture)
			Self.RemoveKeyword(powerArmorFurnitureKW)
			;furnitureRef.BlockActivation(False)
			Game.GetPlayer().SetAnimationVariableBool("bRenderFirstPersonInWorld", true)
			debug.trace("second activation sending now")
			Self.Activate(Game.GetPlayer())
			;Self.BlockActivation(True) ;so we dont' get an extra activate from the container closing
			RegisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
			; start a timer as a fail-safe for if the animation never plays/completes
			StartTimer(InsertFailTimeout, InsertFailTimer)
		endIf
	endEvent
EndState

STATE playingBatteryAnim
	; empty state; I'd put OnGetUp in here but we can't do that with RegisterForRemoteEvent for some reason
	Event OnTimer(int aiTimerID)
		if ( aiTimerID == InsertFailTimer )
			debug.trace("Timed out while waiting for fusion core insertion animation to play!")
			FinishCoreInsertion()
		endIf
	EndEvent
EndState

; when playing the battery insertion animation, we listen for "getup" events so we can take off the keyword
; that makes the battery insert animations play instead of the normal enter animations
Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	If (akFurniture == Self)
		debug.trace("received armor get up event, going to waitingForBattery")
		FinishCoreInsertion()
	EndIf
EndEvent
