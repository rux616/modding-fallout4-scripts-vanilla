Scriptname MoleratDirtFXScript extends Actor
{Adds and manages the dirt on molerats}

Armor Property SkinMoleratDirt Auto
VisualEffect Property MoleratDirtParticlesE Auto


Int stepper = 2

Event OnDying(Actor akKiller)
	
   if  MoleratDirtParticlesE
   		MoleratDirtParticlesE.Stop(self)
   		GotoState("done")
   	endif
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Auto State active
	Event OnLoad()
	;Register for ambush event.
	  ;  RegisterForAnimationEvent(self, "Open")

	    ;;;self.equipItem(SkinMoleratDirt)
	    if Is3DLoaded()
	    	MoleratDirtParticlesE.Play(self)
	    	RegisterForHitEvent(self) ; listen for a single event
	    EndIf
	EndEvent

	Event OnGetUp(ObjectReference akFurniture)
		    Self.playSubgraphAnimation("stage" + stepper)
		    debug.trace("I woke up....stage" + stepper)
		 	stepper = stepper+1	
	endEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	   
	 	if (stepper == 4)
	 	 	utility.wait(3)
	    	MoleratDirtParticlesE.Stop(self)
	    	self.unequipItem(SkinMoleratDirt)
	 		GotoState("done")
	    elseif (stepper < 4)
		    Self.playSubgraphAnimation("stage" + stepper)
		    debug.trace("I got hit....stage" + stepper)
		 	stepper = stepper+1	
	    	GotoState("inActive")
	    else
	    	RegisterForHitEvent(self) ; listen for a hit again...
	    endif
	EndEvent
EndState

State inActive
	Event OnBeginState(string asOldState)
	    utility.wait(2)
	    debug.trace("FinishedWaiting" + stepper)
	    GotoState("active")
	    RegisterForHitEvent(self) ; listen for a single hit
	EndEvent
endState

State done
	;do nothing
endState