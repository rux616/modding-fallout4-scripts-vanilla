Scriptname VaultGearControlPanelScript extends ObjectReference  

Keyword Property VaultGearConsoleFurnitureKeyword Auto
Keyword Property VaultGearDoorKeyword Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			If  Game.GetPlayer().IsInCombat()
				;do nothing
			;when the player activates the console, put him in the pipboy furniture and wait for the plugin sequence to finish
			Else
				gotoState("PipboyPlug")
				GetLinkedRef(VaultGearConsoleFurnitureKeyword).Activate(Game.GetPlayer())
				RegisterForAnimationEvent(Game.GetPlayer(), "On")
			EndIf
		EndIf
	EndEvent
EndState

STATE PipboyPlug
	;wait for plugin sequence to finish
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		If (akSource == Game.GetPlayer()) && (asEventNAme == "On")
			gotoState("WaitForJack")
			PlayAnimation("Stage2")
			UnregisterForAnimationEvent(Game.GetPlayer(), "On")
			;wait for the player to jack out
			RegisterForAnimationEvent(Game.GetPlayer(), "Off")
			;play the SWF files on the pipboy
			Game.ShowPipboyPlugin()
		EndIf
	EndEvent
endState

STATE WaitForJack
	;wait for the glass to flip
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		If (akSource == Game.GetPlayer()) && (asEventNAme == "Off")
			gotoState("GlassFlipped")
			UnregisterForAnimationEvent(Game.GetPlayer(), "Off")
		EndIf
	EndEvent
endState

STATE GlassFlipped
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("hasBeenTriggered")
			;depress button
			PlayAnimationAndWait("Stage3", "stage4")
			GetLinkedRef(VaultGearDoorKeyword).PlayAnimation("Stage2")
		EndIf
	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE