Scriptname MQ03ControlPanelScript extends ReferenceAlias  

MiscObject Property Pipboy3000 Auto
Scene Property ControlPanelScene Auto
Sound Property OBJSwitchGearDoorPanelFail Auto
Message Property CombatNoActivate Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			If  Game.GetPlayer().IsInCombat()
				;do nothing
				CombatNoActivate.Show()
			ElseIf Game.GetPlayer().GetSitState() != 0
				;do nothing
			;If the player has the Pipboy, flip the glass
			ElseIf GetOwningQuest().GetStageDone(6) == 1 && GetOwningQuest().GetStageDone(7) == 0
				gotoState("PipboyPlug")
				GetOwningQuest().SetStage(7)
			Else
				;trigger fail sound
				OBJSwitchGearDoorPanelFail.Play(self.GetRef())
				;if the player hasn't gotten the Pipboy, tell him to go get it.
				If GetOwningQuest().GetStageDone(5) == 0
					GetOwningQuest().SetStage(5)
				EndIf
			EndIf
		EndIf
	EndEvent
EndState

STATE PipboyPlug
	;wait for pipboy animation to finish
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		If (akSource == Game.GetPlayer()) && (asEventNAme == "Off")
			gotoState("GlassFlipped")
			Self.UnregisterForAnimationEvent(Game.GetPlayer(), "Off")
		EndIf
	EndEvent
endState

STATE GlassFlipped
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			DepressButton()
		EndIf
	EndEvent
EndState

Function DepressButton()
	gotoState("hasBeenTriggered")
	(GetOwningQuest() as MQ03QuestScript).StartKlaxonSound()
	GetOwningQuest().SetStage(9)
EndFunction

STATE hasBeenTriggered
	; this is an empty state.
endSTATE