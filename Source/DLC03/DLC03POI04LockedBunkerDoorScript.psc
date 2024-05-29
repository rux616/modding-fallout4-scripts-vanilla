Scriptname DLC03:DLC03POI04LockedBunkerDoorScript extends ObjectReference Hidden

ObjectReference Property Light01Ref Auto Const Mandatory
ObjectReference Property Light02Ref Auto Const Mandatory
ObjectReference Property Light03Ref Auto Const Mandatory
Message Property DLC03POI04_DoorSealedShutMessage Auto Const Mandatory
ObjectReference Property EnableFeralGhoulMarker Auto Const Mandatory


Event OnLoad()
    if ShouldBeLocked()
    	BlockActivation(TRUE, FALSE)
    endif
EndEvent


Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	if ShouldBeLocked()
    		DLC03POI04_DoorSealedShutMessage.Show()
    	else
    		EnableFeralGhoulMarker.EnableNoWait()
    		BlockActivation(FALSE,FALSE)
    		SetOpen(TRUE)
    	endif
    endif
EndEvent


Bool Function ShouldBeLocked()
	if Light01Ref.IsDisabled() || Light02Ref.IsDisabled() || Light03Ref.IsDisabled()
		return True
	else
		return False
	endif
EndFunction

Function DoThing()
    Light01Ref.EnableNoWait()
    Light02Ref.EnableNoWait()
    Light03Ref.EnableNoWait()
EndFunction