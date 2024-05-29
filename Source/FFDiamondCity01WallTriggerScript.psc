ScriptName FFDiamondCity01WallTriggerScript extends ReferenceAlias

Int ButtonPressed = 0
Quest Property FFDiamondCity01 Auto
Message Property FFDiamondCity01WallMessage Auto
MiscObject Property FFDiamondCity01BluePaint Auto
MiscObject Property FFDiamondCity01YellowPaint Auto
MiscObject Property FFDiamondCity01GreenPaint Auto

ObjectReference Property GreenPaintStrokeEnableMarker Auto
ObjectReference Property BluePaintStrokeEnableMarker Auto
ObjectReference Property YellowPaintStrokeEnableMarker Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			;prevent activate spam
			gotoState("hasBeenTriggered")
			;debug.trace(self + " activated by player")
			ButtonPressed = FFDiamondCity01WallMessage.Show()		
				If ButtonPressed == 1
					; Player uses Green Paint
					Self.GetRef().Disable()
					GreenPaintStrokeEnableMarker.Disable()
					Game.GetPlayer().RemoveItem(FFDiamondCity01GreenPaint, 1)
					FFDiamondCity01.SetStage(100)
				ElseIf ButtonPressed == 2
					; Player uses Blue Paint
					Self.GetRef().Disable()
					BluePaintStrokeEnableMarker.Disable()
					Game.GetPlayer().RemoveItem(FFDiamondCity01BluePaint, 1)
					FFDiamondCity01.SetStage(110)
				ElseIf ButtonPressed == 3
					; Player uses Yellow Paint
					Self.GetRef().Disable()
					YellowPaintStrokeEnableMarker.Disable()
					Game.GetPlayer().RemoveItem(FFDiamondCity01YellowPaint, 1)
					FFDiamondCity01.SetStage(120)
				Else
					; If player does nothing, make sure we can activate again
					gotoState("waitingForPlayer")		
				EndIf
		EndIf

	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
