Scriptname DLC01:DLC01TutorialScript extends Quest

Event OnInit()

    RegisterForTutorialEvent("RobotWorkbenchEntered")
    Debug.trace("DLC01TUTORIAL: Init has begun")

endEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
;debug.trace("Tutorial event:" + asEventName + ", " + aMessage)

	if asEventName == "RobotWorkbenchEntered"
		Debug.trace("DLC01 TUTORIAL: I have entered the Workbench - Tutorial Time")
	    if !GetStageDone(110)
	   		SetStage(100)
	   	endif
	endif

endEvent