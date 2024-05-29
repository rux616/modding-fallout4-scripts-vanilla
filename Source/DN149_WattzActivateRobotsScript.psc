Scriptname DN149_WattzActivateRobotsScript extends ObjectReference

ObjectReference Property DN148_WattzRobotEnabler Auto 
ObjectReference Property DN149_WattzOfficeDoor Auto 

Bool ActivateOnce = False 

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef == game.Getplayer() && ActivateOnce == FALSE)
		ActivateOnce = TRUE
		DN148_WattzRobotEnabler.Enable()
		DN149_WattzOfficeDoor.Activate(self)
	endIf
endEvent

