Scriptname TestCellPowerArmorScript extends ObjectReference
{Experimental Script for testing placing batteries in a linked container}

Int ButtonPressed = 0

Message Property InitialMessage Auto
Message Property NoBatteryMessage Auto
Keyword Property containerKW Auto
Keyword Property batteryInsertAnimKW Auto
Keyword Property batteryItemKW Auto

auto STATE waitingForPlayer

	Event OnInit()
		Self.BlockActivation()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		debug.trace(self + " has been activated")
		If (akActionRef == Game.GetPlayer())
			ObjectReference containerRef = GetLinkedRef(containerKW)
			; in case we ever registered for item add events, stop listening for those
			; really we should unregister when the container is closed but I can't find any way to do that
			UnregisterForRemoteEvent(containerRef, "OnItemAdded")
			If(Game.GetPlayer().GetSitState() == 0)
				;prevent activate spam
				gotoState("hasBeenTriggered")
				ButtonPressed = InitialMessage.Show()
					If ButtonPressed == 1
						gotoState("waitingForPlayer")
						;activate battery container
						containerRef.Activate(Game.GetPlayer())
						; we'll listen for item add events on the linked container, and if any of them are batteries, play a special animation
						RegisterForRemoteEvent(containerRef, "OnItemAdded")
					ElseIf ButtonPressed == 2
						If containerRef.GetItemCount(batteryItemKW) < 1
							; no battery, go back to waiting state
							gotoState("waitingForPlayer")
							;explain why player failed to enter
							NoBatteryMessage.Show()
						Else
							;activate power armor
							Self.BlockActivation(False)
							Self.Activate(Game.GetPlayer())
							gotoState("inArmor")
						EndIf						
					Else
						;go back to waiting state
						gotoState("waitingForPlayer")
					EndIf
			Endif
		EndIf
	EndEvent
EndState

Event OnLoad()
	if Is3DLoaded()
		AddInventoryEventFilter(batteryItemKW)
	EndIf
EndEvent

Event OnUnload()
	RemoveAllInventoryEventFilters()
EndEvent

; when playing the battery insertion animation, we listen for "getup" events so we can take off the keyword
; that makes the battery insert animations play instead of the normal enter animations
Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	If (akFurniture == Self)
		Game.GetPlayer().RemoveKeyword(batteryInsertAnimKW)
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
		Self.BlockActivation()
		gotoState("waitingForPlayer")
	EndIf
EndEvent

; we listen for this when the player is messing with the linked container; if any added item is a battery, we play a special animation
Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If akBaseItem.HasKeyword(batteryItemKW)
		;start the battery insertion animation
		gotoState("insertingBattery")
		Game.GetPlayer().AddKeyword(batteryInsertAnimKW)
		Self.BlockActivation(False)
		Self.Activate(Game.GetPlayer())
		RegisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
	EndIf
EndEvent

STATE inArmor
	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef == Game.GetPlayer())
			;I don't think we need to block activate spam here...?
			Self.BlockActivation()
			gotoState("waitingForPlayer")
		EndIf
	EndEvent
endSTATE
	
STATE insertingBattery
	; empty state
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE