Scriptname abAssaultronSelfDestruct extends RobotSelfDestructScript

Explosion Property selfDestructExplosionFX auto Const
{Explosion FX for this specific Robot when they self destruct}

bool onFire = false
;do once for setting on fire
int ChaseSpeed = 140
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
	        		;Debug.Trace("No more WEPS") 
	        		;explode
	        		goTostate("SelfDestruct")
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
        startSelfDestructAndWait(selfRef, selfDestructExplosionFX, true, timeTilDestruct)

    EndEvent

endState

Function ResetSelfDestruct()
    GoToState("Waiting")
    Actor selfRef = self.GetTargetActor()
    selfRef.RemoveSpell(crCoreMeltdownCloak01)
    pRobotFireFXS.Stop(selfRef)
    onFire = False
EndFunction