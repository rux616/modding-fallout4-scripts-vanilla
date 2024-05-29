ScriptName MirelurkHarvestableScript extends ObjectReference
{This script controls Mirelurk eggs that are harvestable}

potion Property MirelurkEgg Auto


Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		Actor akActorRef = akActionRef as Actor
	    if akActorRef
	    	Self.SetDestroyed()
	    	Self.Disable()
	    	akActorRef.Additem(MirelurkEgg, 1)
	    	GoToState("Done")
	    endif
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    GoToState("Done")
	EndEvent

EndState

State Done
	Event OnBeginState(string asOldState)
	    ; tell my nest that I've hatched/been destroyed
	    MirelurkNestScript myNest = GetLinkedRef() as MirelurkNestScript
	    if myNest
	    	myNest.CheckEggStatus()
	    endif
	EndEvent
EndState


Event OnReset()
	Enable()
	clearDestruction()
	SetDestroyed(false)
	Reset()
EndEvent