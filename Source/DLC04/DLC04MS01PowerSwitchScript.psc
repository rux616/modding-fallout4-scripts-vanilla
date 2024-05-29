Scriptname DLC04:DLC04MS01PowerSwitchScript extends ObjectReference

; Propertries
Quest Property DLC04MS01 Auto
Quest Property DLC04MS01Post Auto
ObjectReference Property DLC04MS01PowerSwitch Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == game.GetPlayer()
		if DLC04MS01Post.IsRunning()
			DLC04MS01Post.SetStage(10)
		Elseif DLC04MS01.IsRunning() == True
			DLC04MS01.SetStage(750)
		EndIf
		DLC04MS01PowerSwitch.BlockActivation(True,True)
	Endif
endEvent
