ScriptName FFDiamondCity01MixerScript extends ObjectReference

Int ButtonPressed = 0
Quest Property FFDiamondCity01 Auto
Message Property FFDiamondCity01GreenPaintMessage Auto
Message Property FFDiamondCity01NeedPaintMessage Auto
Message Property FFDiamondCity01PaintMixerMessage Auto
MiscObject Property FFDiamondCity01BluePaint Auto
MiscObject Property FFDiamondCity01YellowPaint Auto
MiscObject Property FFDiamondCity01GreenPaint Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		Actor PlayerREF = Game.GetPlayer()
		If akActionRef == PlayerREF
			;prevent activate spam
			gotoState("hasBeenTriggered")
			;debug.trace(self + "Player has activated the mixer")
			ButtonPressed = FFDiamondCity01PaintMixerMessage.Show()
				If ButtonPressed == 1
					If (PlayerREF.GetItemCount(FFDiamondCity01YellowPaint) < 1) || (PlayerREF.GetItemCount(FFDiamondCity01BluePaint) < 1)
						;allow the player to activate again
						gotoState("waitingForPlayer")
						FFDiamondCity01NeedPaintMessage.Show()
					Else
						;allow the player to activate again
						gotoState("waitingForPlayer")
						;remove paints and give player green paint
						GetLinkedRef().PlayAnimationAndWait("Play01","End")
						PlayerREF.AddItem(FFDiamondCity01GreenPaint, 1)
						PlayerREF.RemoveItem(FFDiamondCity01YellowPaint, 1)
						PlayerREF.RemoveItem(FFDiamondCity01BluePaint, 1)						
						; Advance the quest ONLY if we're on it, otherwise having the green paint is handled when you get the quest
						If FFDiamondCity01.IsRunning() == True && FFDiamondCity01.GetStageDone(30) == 0 && FFDiamondCity01.GetStageDone(10) == 1 
							FFDiamondCity01.SetStage(30)
						EndIf
					EndIf
				Else
					; if player does nothing, allow activation again
					gotoState("waitingForPlayer")
				EndIf
		EndIf
	EndEvent
EndState



STATE hasBeenTriggered
	; this is an empty state.
endSTATE
