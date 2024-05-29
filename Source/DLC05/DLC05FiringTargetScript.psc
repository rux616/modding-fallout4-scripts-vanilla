Scriptname DLC05:DLC05FiringTargetScript extends ObjectReference



bool property IsToggle = false Auto Const
String property MaterialForOnHit = "MetalSolid" Auto Const
bool TransmittingPower = false

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	DoHitRegister()
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	UnregisterForAllEvents()
EndEvent

Event OnLoad()
	DoHitRegister()
EndEvent

Event OnUnload()
	UnregisterForAllEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
			bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Debug.Trace(Self + " OnHit")
	Debug.Trace("::: apMaterial >>" + apMaterial + "<<")
	Debug.Trace("::: akSource >> " + akSource)
	Debug.Trace("::: akProjectile >> " + akProjectile)
	if apMaterial == MaterialForOnHit
		DoMyHit()
	endif
	DoHitRegister()
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Debug.Trace(Self + " OnTriggerEnter > " + akTriggerRef)
	;The objects should already be filtered by the conditions on the base object
	;so we should just be able to trigger
	DoMyHit()
EndEvent



Function DoMyHit()
	if IsPowered()
		Debug.Trace(Self + ": DoMyHit")
		if IsToggle
			if !TransmittingPower
				PlayAnimationAndWait("TurnOn", "TransitionComplete")
				TransmittingPower = true
			else
				PlayAnimationAndWait("TurnOff", "TransitionComplete")
				TransmittingPower = false
			endif
		else
			PlayAnimationAndWait("TurnOn", "TransitionComplete")
		endif
	Endif
EndFunction

Function DoHitRegister()
	Debug.Trace(Self + ": DoHitRegister")
	RegisterForHitEvent(self, akAggressorFilter = None, akSourceFilter = None, \
  		akProjectileFilter = None, aiPowerFilter = -1, aiSneakFilter = -1, \
   		aiBashFilter = -1, aiBlockFilter = -1, abMatch = true)
EndFunction