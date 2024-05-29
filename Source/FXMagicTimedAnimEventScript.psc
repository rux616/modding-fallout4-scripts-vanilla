Scriptname FXMagicTimedAnimEventScript extends ActiveMagicEffect 
{Cast a spell on death.}

String property AnimEventName auto
{We will send this anm event.}
float property fDelay = 0.00 auto
{We will wait this long to send the event.}


actor Victim

ObjectReference VictimRef

;======================================================================================;
;   EVENTS     /
;=============/

Event OnInit()
	victim = GetTargetActor()
	VictimRef = victim as ObjectReference
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)
	if fDelay > 0.0
		StartTimer(fDelay, 1)
	elseif AnimEventName
		VictimRef.PlayAnimation(AnimEventName)
	endif
EndEvent


Event OnTimer(int aiTimerID)
	If aiTimerID == 1
	    if AnimEventName
			VictimRef.PlayAnimation(AnimEventName)
	   	endif
	endif
EndEvent