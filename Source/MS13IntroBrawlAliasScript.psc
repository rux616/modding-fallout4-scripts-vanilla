Scriptname MS13IntroBrawlAliasScript extends ReferenceAlias
{script on Paul and Cooke to detect non-brawl hits during intro fight}

Weapon Property UnarmedHuman auto const mandatory
ReferenceAlias Property Opponent auto const mandatory

event OnLoad()
	; register in case lose 3D during brawl
 	Quest myQuest = GetOwningQuest()
	; if I am hit with any weapon other than hands
	if myQuest.GetStageDone(12) == true && myQuest.GetStageDone(18) == false
		InitBrawl()
	endif
endEvent

function InitBrawl()
	RegisterForHitEvent(self) ; let us know when anyone hits us
	RegisterForMagicEffectApplyEvent(self) ; let us know when anyone hits us with a spell
	RegisterForAnimationEvent(GetRef(), "PairEnd")
endFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
 	debug.trace(self + " hit by " + akAggressor + " with weapon = " + akWeapon + ", Projectile = " + akProjectile)
 	Quest myQuest = GetOwningQuest()
	; if I am hit with any weapon other than hands
	if myQuest.GetStageDone(12) == true && myQuest.GetStageDone(18) == false
		Actor pActor = GetActorRef()
		if akProjectile || (akWeapon && akWeapon != UnarmedHuman) || akAggressor != Opponent.GetActorRef()
			debug.trace(self + " hit with weapon or projectile - end intro brawl")
			myQuest.SetStage(22)
		else
			debug.trace(self + " fair hit - reregister for OnHit event")
			RegisterForHitEvent(self) ; go around for another try
			;/
			if myQuest.GetStageDone(15) == false
				; skip timer on first hit
				myQuest.SetStage(15)
			endif
			/;
		endif
	endif
endEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
 	debug.trace(self + " OnMagicEffectApply: akCaster=" + akCaster + " akTarget= " + akTarget + ", akEffect=" + akEffect)
 	Quest myQuest = GetOwningQuest()
	if myQuest.GetStageDone(12) == true && myQuest.GetStageDone(18) == false
		debug.trace(self + " hit with magic effect - end intro brawl")
		; if hit with any magic effect
		myQuest.SetStage(22)
	elseif myQuest.GetStageDone(18)
		UnregisterForMagicEffectApplyEvent(self)
	endif
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + " OnAnimationEvent " + asEventName)
    if asEventName == "PairEnd"
	 	Quest myQuest = GetOwningQuest()
		; if I am hit with any weapon other than hands
		if myQuest.GetStageDone(12) == true && myQuest.GetStageDone(18) == false
			myQuest.SetStage(18)
			UnregisterForAnimationEvent(GetRef(), "PairEnd")
		endif
	endif
EndEvent

Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
	if asEventName == "PairEnd"
		; if unload during brawl, just end it
	 	Quest myQuest = GetOwningQuest()
		if myQuest.GetStageDone(12) == true && myQuest.GetStageDone(18) == false
			myQuest.SetStage(18)
		endif
	endif
endEvent