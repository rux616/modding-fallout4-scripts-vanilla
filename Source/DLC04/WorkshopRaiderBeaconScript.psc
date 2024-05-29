Scriptname DLC04:WorkshopRaiderBeaconScript extends ObjectReference Const

WorkshopParentScript Property WorkshopParent auto const mandatory
DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent auto const mandatory

int property RaiderGangValue = 1 auto const 
{ the keyword to set on the current workshop when this is built - tags it for a particular gang }

Event OnInit()
	debug.trace(self + " OnInit")
    SendRaiderBeaconEvent()
EndEvent

Event OnUnload()
    ; if not raider settlement, delete myself
	WorkshopScript workshopRef = GetLinkedRef(WorkshopParent.WorkshopItemKeyword) as WorkshopScript
	if workshopRef
		if workshopRef.HasKeyword(WorkshopParent.WorkshopType02) == false
			Disable()
			Delete()
		endif
	endif
EndEvent

function SendRaiderBeaconEvent()
	debug.trace(self + " SendRaiderBeaconEvent")
	WorkshopScript workshopRef = GetLinkedRef(WorkshopParent.WorkshopItemKeyword) as WorkshopScript
	if workshopRef
		; make sure another gang isn't already set on this workshop
		if DLC04WorkshopParent.GetRaiderGangValue(workshopRef) == 0 
			DLC04WorkshopParent.DLC04WorkshopEventRaiderBeacon.SendStoryEvent(akRef1 = workshopRef)
		endif
	endif
endFunction