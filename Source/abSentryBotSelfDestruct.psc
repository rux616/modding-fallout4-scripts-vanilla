Scriptname abSentryBotSelfDestruct extends RobotSelfDestructScript

Explosion Property selfDestructExplosionFX auto Const
{Explosion FX for this specific Robot when they self destruct}
Explosion Property onDeathExplosionFX auto Const
{Explosion FX for this specific Robot when they die, if they don't explode on death, leave blank}

bool onFire = false
;do once for setting on fire
bool blowingUp = false
;bool for when we start blowing up, to differentiate exploding on death and self destruct.
int ChaseSpeed = 200
;Actors chase speed once selfdestruct as started

auto State Waiting



	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		actor selfRef = self.GetTargetActor()
	    if ((aeCombatState == 1) && (selfRef.GetValue(braincondition) == 0))
	        frenzyFX()
	    endif

	EndEvent
	
	Event OnCripple(ActorValue akActorValue, bool abCrippled)
		if (abCrippled)
			actor selfRef = self.GetTargetActor()
			if akActorValue == braincondition
        			frenzyFX()
    			endIf
    
	    		;if cripple happens at low health chance to set on fire
	    		if onFire == false
	        		if selfRef.GetValue(health) as float < healthPercentToBurn && utility.randomInt(0, 3) == 0
	            		pRobotFireFXS.Play(SelfRef) 
	            		onFire = true
	            		FireTimer(selfRef)
	        		endIf 
	    		endif

			if selfRef.GetEquippedWeapon() || selfRef.GetValue(leftattackcondition) as int > 0 || selfRef.GetValue(rightattackcondition) as int  > 0     
				;donothing
	    		else
	    			if blowingUp == false
	    				blowingUp = true
		        		;explode
		       		goTostate("SelfDestruct")
	    			endif
	    		endif
	    	EndIf
	endEvent

	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef == RobotSelfDestructerREF
	        ;If I received activation from this reference I have had my self-destruct triggered!
	        goTostate("SelfDestruct")

	    endif

	EndEvent

endState


State SelfDestruct
    Event OnBeginState(string asOldState)
    	actor selfRef = self.GetTargetActor()
        ;let the actor change states from attacking to give the player a hint something changed
        selfRef.SetValue(SpeedMult, ChaseSpeed) 
        startSelfDestructAndWait(selfRef, selfDestructExplosionFX, false, timeTilDestruct)

    EndEvent
	
endState

Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
	if blowingUp == false
		blowingUp = true
	  	PRobotFrenzyFXS.Stop(selfref)
	    pRobotFireFXS.Stop(SelfRef)  
	  	Explode(SelfRef)
	  	GoToState("Done")
	    ;clean up particle fx on death
    endif

EndEvent

Function Explode(Actor selfRef)
    selfRef.DamageValue(availablecondition1, 100)
    selfRef.DamageValue(availablecondition2, 100)
    selfRef.DamageValue(availablecondition3, 100)
    utility.wait(0.3)
    selfRef.DamageValue(attackconditionalt1, 100)
    selfRef.DamageValue(attackconditionalt2, 100)
    utility.wait(0.13)
    selfRef.DamageValue(rightmobilitycondition, 100)
    utility.wait(0.15)
    selfRef.DamageValue(leftmobilitycondition, 100)
    utility.wait(0.2)
    selfRef.DamageValue(leftattackcondition, 100)
    selfRef.DamageValue(rightattackcondition, 100)   
    utility.wait(0.1)
    ;blow DF up
    selfRef.placeAtMe(onDeathExplosionFX)

endFunction

Function ResetSelfDestruct()
    GoToState("Waiting")
    Actor selfRef = self.GetTargetActor()
    selfRef.RemoveSpell(crCoreMeltdownCloak01)
    pRobotFireFXS.Stop(selfRef)
    onFire = False
    blowingUp = False
EndFunction