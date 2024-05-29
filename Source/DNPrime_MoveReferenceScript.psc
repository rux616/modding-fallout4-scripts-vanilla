Scriptname DNPrime_MoveReferenceScript extends ObjectReference
{Moves a reference to its linkedRef on trigger enter}

ObjectReference Property myMarker auto Const
{ref to move}

Actor Property myActor = none auto Const
{default none}

ReferenceAlias Property BosRespawnMarker01  auto Const
ReferenceAlias Property BosRespawnMarker02  auto Const
ReferenceAlias Property BosRespawnMarker03  auto Const
ReferenceAlias Property BosRespawnMarkerFailsafe  auto Const

Keyword Property LinkCustom01 auto Const
Keyword Property LinkCustom02 auto Const
Keyword Property LinkCustom03 auto Const
Keyword Property LinkCustom04 auto Const

;**********************************************

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
		if(!myActor)
			gotoState("doNothing")
			myMarker.moveTo(GetLinkedRef())
		else
			if(akActionRef == myActor)
				gotoState("doNothing")
				myMarker.moveTo(GetLinkedRef())
			endif
			;now move respawn markers for BoS if we have the proper linked refs
			if(GetLinkedRef(LinkCustom01))
				BosRespawnMarker01.getReference().moveTo(GetLinkedRef(LinkCustom01))
			endif

			if(GetLinkedRef(LinkCustom02))
				BosRespawnMarker02.getReference().moveTo(GetLinkedRef(LinkCustom02))
			endif

			if(GetLinkedRef(LinkCustom03))
				BosRespawnMarker03.getReference().moveTo(GetLinkedRef(LinkCustom03))
			endif

			if(GetLinkedRef(LinkCustom04))
				BosRespawnMarkerFailsafe.getReference().moveTo(GetLinkedRef(LinkCustom04))
			endif
		endif
	EndEvent
endState

;**********************************************

State doNothing
	Event OnTriggerEnter(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
endState

;**********************************************