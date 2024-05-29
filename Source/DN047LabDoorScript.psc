Scriptname DN047LabDoorScript extends ObjectReference
;Sets Global Value for if the door is open or closed. Default to closed.

GlobalVariable property DN047LabDoorIsOpen auto

;Event OnInit()
;    DN047LabDoorIsOpen.setValue(0)
;EndEvent

Event OnOpen(ObjectReference akActionRef)
    DN047LabDoorIsOpen.setValue(1)
EndEvent

Event OnClose(ObjectReference akActionRef)
    DN047LabDoorIsOpen.setValue(0)
EndEvent

