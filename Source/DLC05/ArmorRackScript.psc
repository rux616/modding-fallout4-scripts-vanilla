Scriptname DLC05:ArmorRackScript extends Actor Const

DLC05:DLC05InitScript property DLC05Init auto const mandatory 

event OnLoad()
	debug.trace(self + " OnLoad")
	SetHeadTracking(false)
	SetRestrained(true)
	BlockActivation(true, false)
	SetGhost(true)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	debug.trace(self + " OnWorkshopObjectPlaced")
	SetGhost(true)
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	debug.trace(self + " OnWorkshopObjectMoved")
	SetGhost(true)
endEvent 

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate isActivationBlocked=" + isActivationBlocked())
    if akActionRef == Game.GetPlayer()
    	OpenInventory(true)
    endif
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject is Armor
		; achievement check
		DLC05Init.SetArmorRackAchievementFlag()
	endif
endEvent