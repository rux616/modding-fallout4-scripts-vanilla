Scriptname DN047TempSensorTrigScript extends ObjectReference

objectReference property labDoor auto hidden
GlobalVariable property DN047LabDoorIsOpen auto

Event OnInit()
    labdoor = getLinkedRef()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	if DN047LabDoorIsOpen.getValue() == 1
    		labDoor.activate(self)
    	endif
	endif
EndEvent