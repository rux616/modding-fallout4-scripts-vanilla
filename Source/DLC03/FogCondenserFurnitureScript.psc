Scriptname DLC03:FogCondenserFurnitureScript extends ObjectReference Conditional

bool property bRepaired = true auto Conditional

Keyword property DLC03LinkFogCondenserFlora auto conditional mandatory 

Event OnLoad()
	CheckRepairedState()
EndEvent

; presumably we'll need more scripting to handle animation states etc.
function RepairMe(bool bRepairMe = true)
	debug.trace(self + " RepairMe " + bRepairMe + " IsFurnitureInUse=" + IsFurnitureInUse())
	bRepaired = bRepairMe
	; don't update blockActivation state when furniture is in use
	if IsFurnitureInUse() == false
		CheckRepairedState()
	else 
		CheckAnimationState()
	endif
endFunction

function DestroyMe()
	RepairMe(false)
	SetDestroyed(true)
endFunction

; unblock activation when player exits furniture
Event OnExitFurniture(ObjectReference akActionRef)
	debug.trace(self + " OnExitFurniture " + akActionRef)
	CheckRepairedState() 
EndEvent

function CheckRepairedState()
	debug.trace(self + " CheckRepairedState bRepaired=" + bRepaired)
	if bRepaired
		BlockActivation(bRepaired, true)
	else
		BlockActivation(false)
		; linked flora object if any
		ObjectReference myFlora = GetLinkedRef(DLC03LinkFogCondenserFlora)
		if myFlora
			myFlora.SetHarvested(true)
		endif
	endif
	CheckAnimationState()
endFunction

function CheckAnimationState()
	; set animation state
	if Is3DLoaded()
		if bRepaired
			PlayAnimation("Stage1")
		else 
			; always use fast "off" here
			PlayAnimation("Stage2NoTransition")
		endif
	endif
endFunction
