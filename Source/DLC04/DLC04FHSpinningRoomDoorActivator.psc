Scriptname DLC04:DLC04FHSpinningRoomDoorActivator extends ObjectReference

float Property waitTime = 7.0 const auto

Event OnActivate(ObjectReference akActionRef)
    utility.Wait(waitTime)
    door akDoor = (akActionRef.GetBaseObject() as Door)
    Activate(self, true)
    if akDoor && (akActionRef.GetOpenState() == 1 || akActionRef.GetOpenState() == 2)
    	akActionRef.SetOpen(false)
    endif
EndEvent


Event OnCellAttach()
    BlockActivation(true)
EndEvent