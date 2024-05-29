ScriptName DN136_OldRoboticsSentryBotScript extends Actor
{sets sentry bot to unconscious}
import game
import debug

ObjectReference Property myActivator auto mandatory const

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

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

ActorValue property Aggression auto const
ActorValue property Suspicious auto const

bool doOnce = FALSE

;**********************************************

Auto State waiting
	Event OnLoad()
		if doOnce == FALSE
			doOnce = TRUE
			if(self.isDead() == FALSE)
				setUnconscious(TRUE)
			endif
		endif
	endEvent

	;Handle Activation
	Event onActivate(ObjectReference triggerRef)
		trace("in onactivate")
		if(triggerRef == myActivator)
			gotoState("allDone")
			if(self.isDead() == FALSE)
				setUnconscious(FALSE)
			endif
		endif

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