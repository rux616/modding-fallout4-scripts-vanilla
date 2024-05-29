Scriptname DN143MapMarkerSwapScript extends ObjectReference Hidden Const

ObjectReference Property Vault75MapMarker const auto
ObjectReference Property MaldenMiddleSchoolMapMarker const auto


Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
    	Vault75MapMarker.EnableNoWait()
   		MaldenMiddleSchoolMapMarker.DisableNoWait()
   	endif
EndEvent