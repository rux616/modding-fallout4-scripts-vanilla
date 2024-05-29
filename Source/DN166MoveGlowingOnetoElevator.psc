Scriptname DN166MoveGlowingOnetoElevator extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto
Keyword Property LinkCustom02 const auto

Bool AlreadyTriggered = FALSE

Event OnTriggerEnter(ObjectReference akActionRef)
	if !AlreadyTriggered
		AlreadyTriggered = TRUE
		GetLinkedRef(LinkCustom01).MoveTo(GetLinkedRef(LinkCustom02))
	endif
EndEvent