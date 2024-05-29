Scriptname DLC06:WorkshopAutoRepairScript extends ObjectReference

Event OnInit()
    debug.trace(self + "OnInit")
    RegisterForEvents()
    CheckForRepair()
EndEvent

Event OnLoad()
    debug.trace(self + "OnLoad")
    RegisterForEvents()
    CheckForRepair()
EndEvent

Event OnUnload()
	UnregisterForAllRemoteEvents()
EndEvent

function CheckForRepair()
	debug.trace(self + "CheckForRepair")
	if IsDestroyed()
		debug.trace(self + " repairing me")
		Repair()
	endif
endFunction

function RegisterForEvents()
	; get workshop from myself
	WorkshopObjectScript workshopObject = (self as ObjectReference) as WorkshopObjectScript
	if workshopObject 
		WorkshopScript workshopRef = workshopObject.WorkshopParent.GetWorkshop(workshopObject.workshopID)
		RegisterForRemoteEvent(workshopRef, "OnWorkshopMode")
	endif
endFunction 

Event ObjectReference.OnWorkshopMode(ObjectReference akSender, bool aStart)
	debug.trace(self + "OnWorkshopMode")
	if aStart
    	CheckForRepair()
    endif
EndEvent