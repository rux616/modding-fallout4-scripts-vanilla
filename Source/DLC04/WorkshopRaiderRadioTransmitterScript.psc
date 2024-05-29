Scriptname DLC04:WorkshopRaiderRadioTransmitterScript extends workshopobjectscript

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory

function HandlePowerStateChange(bool bPowerOn = true)
	DLC04WorkshopParent.UpdateRadioObject(self)
	Parent.HandlePowerStateChange()
endFunction 

Event OnActivate(ObjectReference akActionRef)
	Parent.OnActivate(akActionRef)
	DLC04WorkshopParent.UpdateRadioObject(self)
endEvent