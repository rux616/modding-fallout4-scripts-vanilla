Scriptname DN144KlaxonLightScript extends RefCollectionAlias


Auto State Waiting
	Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
		;animate light

		akSenderRef.PlayAnimation("Stage2")
		akSenderRef.GetLinkedRef().PlayAnimation("Stage2")
		;gotoState("HasBeenTriggered")
	EndEvent
EndState

State HasBeenTriggered
	;empty state
EndState