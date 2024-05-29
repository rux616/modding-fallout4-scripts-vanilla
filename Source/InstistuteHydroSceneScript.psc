Scriptname InstistuteHydroSceneScript extends ObjectReference Hidden Const

Quest Property DialogueInstituteHydroponics1 Auto Const

Quest Property InstM03 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if !InstM03.IsRunning()
    	DialogueInstituteHydroponics1.Start()
    	Disable()
    endif
EndEvent
