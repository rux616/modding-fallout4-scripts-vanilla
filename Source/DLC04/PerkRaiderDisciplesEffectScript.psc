Scriptname DLC04:PerkRaiderDisciplesEffectScript extends activemagiceffect

; PROPERTIES
;////////////////////////////////////////////////////////////////;
ActorValue Property ActionPoints              Auto Const Mandatory
float      Property APPercentToRestore = 0.25 Auto Const
;////////////////////////////////////////////////////////////////;

; GLOBALS
;////////////////////////////////////////////////////////////////;
Actor PlayerRef
bool  bRestored
;////////////////////////////////////////////////////////////////;

; EVENTS
;////////////////////////////////////////////////////////////////;
Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("DLC04:PerkRaiderDisciplesEffectScript - OnEffectStart()")
	PlayerRef = Game.GetPlayer()
EndEvent

Event OnDying(Actor akKiller)
	debug.trace("DLC04:PerkRaiderDisciplesEffectScript - OnDying()")
	RestoreAP()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace("DLC04:PerkRaiderDisciplesEffectScript - OnEffectFinish()")
	if akTarget.IsDead()
		RestoreAP()
	endif
EndEvent

;////////////////////////////////////////////////////////////////;

; FUNCTIONS
;////////////////////////////////////////////////////////////////;
Function RestoreAP()
	if( bRestored == false )
		debug.trace("DLC04:PerkRaiderDisciplesEffectScript - RestoreAP(): TARGET IS DEAD!")
		float APToRestore = APPercentToRestore * ((1.0 / PlayerRef.GetValuePercentage(ActionPoints)) * PlayerRef.GetValue(ActionPoints))
		debug.trace("DLC04:PerkRaiderDisciplesEffectScript - RestoreAP(): APToRestore: "+APToRestore)
		PlayerRef.RestoreValue(ActionPoints, APToRestore)
		bRestored = true
	endif
EndFunction
;////////////////////////////////////////////////////////////////;