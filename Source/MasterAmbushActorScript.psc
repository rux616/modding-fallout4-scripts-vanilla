ScriptName MasterAmbushActorScript extends Actor
{Script that lives on the actor and takes care of all instances of how an actor can come out of idle state while in ambush mode}

import game
import debug

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fActorVariableOnReset = 0.0 auto hidden

float property fAggression = 2.0 auto
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
}

float property fAggressionOnReset = 0.0 auto hidden

keyword property linkKeyword auto const
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}

bool property ambushOnTrigger = false auto const
{By default, this is set to false. Set to true if you want encounter to come out of ambush when player enters trigger}

ActorValue property Aggression auto const
ActorValue property Suspicious auto const


;**********************************************

Event onReset()
	;messagebox ("in reset")
	self.setValue(Suspicious, fACtorVariableonReset)
	self.setValue(Aggression, fAggressionOnReset)
	self.evaluatePackage()
endEvent

;**********************************************

auto State waiting
	;The actor can exit the furniture in multiple ways.  We need to listen for all of these
	;events and if any are called, then go to All Done state, since we don't need to listen
	;for any other events because any of the events will get the actor out of the furniture.

	Event OnLoad()
		trace("onLoad " +self)
		if Is3DLoaded()
			RegisterForHitEvent(self) ; anyone hits us
		endif
	endEvent

	Event OnUnload()
		trace("onUnload " +self)
		UnregisterForAllHitEvents()
	EndEvent
	
	;Handle Activation
	Event onActivate(ObjectReference triggerRef)
		;trace("in onactivate")
		Actor actorRef = triggerRef as Actor
		if((actorRef == game.getPlayer()) || (ambushOnTrigger == true))
			;player has activated actor, so leave state
			gotoState("allDone")
		else
			;trigger activated them, so set their aggression to 2, but do not leave state
			self.setValue(Aggression, fAggression)
			self.EvaluatePackage()
		endif
	endEvent
	
	;Handle onHit
	Event onHit(ObjectReference akTarget, objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		;trace("in onhit")
		gotoState("allDone")
	endEvent
	
	;Handle other cases that cause them to come out of furniture
	
	;Using onGetUp as a safety net
	Event onGetUp(ObjectReference myFurniture)
		trace("onGetUp " + self)
		if(is3DLoaded())
			Cell parentCell = GetParentCell()
			if (parentCell && parentCell.IsAttached())
				gotoState("allDone")
			endif
		endif
	endEvent
	
	Event OnCombatStateChanged(Actor actorRef,int aeCombatState)
		;trace("in combatstatechanged")
		if (aeCombatState != 0) ; 0 = not in combat, so non-0 means we entered combat
			gotoState("allDone")
		endif
	endEvent
	
	;if any of the events above are caught, we leave this state, but first we need to take care
	;of setting up everything we need when we get out of our furniture.
	Event onEndState(string asNewState)
		;trace("in end state")
		;handle things like lids that are the linkedRef of the furniture
		if(getLinkedRef())
			getLinkedRef().activate(self)
		endif
		
		if(getNthLinkedRef(1))
			getNthLinkedRef(1).activate(self)
		endif
		
		if(getNthLinkedRef(2))
			getNthLinkedRef(2).activate(self)
		endif
		
		;set actor variables
		self.setValue(Suspicious, fACtorVariable)
		self.setValue(Aggression, fAggression)
		self.evaluatePackage()
		
		;check to see if actor has a linkedRef with this keyword, if so, then activate it
		if (GetLinkedRef(linkKeyword) as objectReference)
			(getLinkedRef(linkKeyword) as objectReference).activate(self)
		endif
	endEvent
endState

;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************