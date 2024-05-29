Scriptname DLC03:DLC03_V118_PearlEscortTriggerScript extends ObjectReference Const

bool Property TravelToHotel = true auto const
int Property iSetValue = 0 Auto Const

DLC03:DLC03_V118_PearlHiringScript Property DLC03_V118_PearlHiring Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	DLC03_V118_PearlHiring.SetEscortVar(TravelToHotel, iSetValue)
	Disable()
EndEvent