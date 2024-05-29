Scriptname TrapRadiationScript extends TrapBase 


;==================================================
;		Child Functions - Define in extended script
;==================================================


Group LocalProperties CollapsedOnRef
	Hazard Property RadTrapHazard Auto
	ObjectReference Property MyHazard Auto Hidden
	Sound Property TriggerSound Auto
	MiscObject Property Item01 auto
	int Property Item01Number auto
EndGroup


Function LocalFireTrap()
		;placeatme(ExplosionToPlace)
		TriggerSound.Play(self)
		PLayAnimation(FireTrapAnim)
		if(RadTrapHazard)
      		MyHazard = placeatme(RadTrapHazard)
      		starttimer(5, 10)
    	endif

EndFunction

Function LocalOnTimer(int aiTimerID)
	if(aiTimerID == 10 && MyHazard)
    	MyHazard.delete()
  	endif
  		self.setdestroyed(true)
endFunction

Function LocalDisarmReward()
	Game.getplayer().additem(item01,Item01Number)
EndFunction

;/Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Trip" auto
	String Property ArmAnim = "Arm" auto
	String Property TriggerEvent = "TransitionComplete" auto
	;String Property ResetAnim = "Stage1" auto
	;String Property ResetEvent = "TransitionComplete" auto
	;String Property DisarmAnim = "stage1" auto
	;String Property DisarmEvent = "TransitionComplete" auto
EndGroup

Sound Property TriggerSound auto
Sound Property TakeSound Auto

MiscObject Property Item01 auto
int Property Item01Number auto

Explosion Property RadTrapExplosion Auto 

Hazard Property RadTrapHazard Auto

ObjectReference Property MyHazard Auto Hidden
;==================================================
;		Events Block
;==================================================

Event OnReset()
    self.setdestroyed(false)
    gotostate("Active")
    reset()
EndEvent

;==================================================
;		State Block
;==================================================

Auto state Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		debug.Trace(self + ": Entered by >> " + akActionRef)
		;TriggerSound.play(self)
		playAnimation(ArmAnim)
		playAnimation(TriggerAnim)
		;placeatme(ExplosionToPlace)
		if(RadTrapHazard)
      		MyHazard = placeatme(RadTrapHazard)
      		starttimer(5, 10)
    	endif
    	gotostate("Inactive")
	EndEvent
	
	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		debug.Trace(self + ": Hit by >> " + akAggressor)
		TriggerSound.play(self)
		playAnimation(TriggerAnim)
		;placeatme(ExplosionToPlace)
		if(RadTrapHazard)
      		MyHazard = placeatme(RadTrapHazard)
      		starttimer(5, 10)
    	endif
    	gotostate("Inactive")
    EndEvent

	Event onActivate(objectReference akActivator)
		if akactivator == 
		debug.Trace(self + ": Activated by >> " + akActivator)
		TakeSound.play(self)
		playAnimation(DisarmAnim)
		Game.getplayer().additem(item01,Item01Number)
		gotostate("Inactive")
	EndEvent
EndState

state Inactive
	Event OnBeginState(string asOldState)
	   
	EndEvent

	Event OnTimer(int aiTimerID)
  		if(aiTimerID == 10 && MyHazard)
    		MyHazard.delete()
  		endif
  			self.setdestroyed(true)
	EndEvent

EndState

/;

