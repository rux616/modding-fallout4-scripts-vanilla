Scriptname Hardcore:HC_EncumbranceEffect_CastScript extends ActiveMagicEffect

Group Data
spell Property SpellToCast const auto mandatory
{HC_EncumbranceEffect_DamagePlayer}

float Property CastTimerInterval = 45.0 const auto
{how often should we cast the spell on the actor}

message Property MessageToDisplay const auto mandatory

EndGroup

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	startTimer(CastTimerInterval)
EndEvent

Function CastSpellAndStartTimer()
	if IsBoundGameObjectAvailable() ;is effect still running on a legit object?
		actor actorRef = GetTargetActor()
		SpellToCast.cast(actorRef, actorRef)
		MessageToDisplay.show()
	
		startTimer(CastTimerInterval)
	endif
EndFunction

Event OnTimer(int aiTimerID)
	CastSpellAndStartTimer()
EndEvent
