Scriptname DN047ControlPanelScript extends ObjectReference

ObjectReference Property labDoor auto hidden
GlobalVariable property DN047LabDoorIsOpen auto


Event OnInit()
 	labDoor = getLinkedRef()   
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if DN047LabDoorIsOpen.getValue() == 0
    	labDoor.activate(self)
	endif
EndEvent