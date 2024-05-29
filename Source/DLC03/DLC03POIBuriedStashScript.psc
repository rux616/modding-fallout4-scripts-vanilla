Scriptname DLC03:DLC03POIBuriedStashScript extends ObjectReference


Message Property DLC03_POIBuriedStashMessage Auto Const Mandatory
MiscObject Property Shovel01 Auto Const Mandatory

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		Actor akActor
		if akActivator == Game.GetPlayer()
			akActor = Game.GetPlayer()
		endif
		if akActor
			if !akActor.IsInCombat()
				if akActor.GetItemCount(Shovel01) >= 1
					Excavate()
					Disable()
					Delete()
				else
					DLC03_POIBuriedStashMessage.Show()
				endif
			endif
		endif
		GoToState("Waiting")
	EndEvent
EndState

State Busy
EndState

Sound Property QSTMS07BPlayerGraveExhume2D Auto Const

Function Excavate()
;Block player controls
InputEnableLayer myLayer = InputEnableLayer.Create()
myLayer.DisablePlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
if QSTMS07BPlayerGraveExhume2D
	QSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())
endif

Utility.Wait(2.5)

;Disable trigger, bodies, enable new wall
GetLinkedRef().Disable()


Game.FadeOutGame(False, True, 0.0, 3.0)


Utility.Wait(3.0)

;Reenable player controls
myLayer.Delete()

EndFunction