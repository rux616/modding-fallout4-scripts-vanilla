Scriptname DLC04:DLC04_FirePOITriggerScript extends ObjectReference

Keyword Property LinkCustom01 Auto Const Mandatory
potion property Stimpak Auto Const Mandatory
weather Property DLC04NukaWorldClear Auto Const Mandatory

Event OnActivate(ObjectReference akActivator)
	Self.disable()
	if GetLinkedRef(LinkCustom01)
		GetLinkedRef().PlaceAtMe(Stimpak, 3)
		DLC04NukaWorldClear.ForceActive()
	Endif
EndEvent