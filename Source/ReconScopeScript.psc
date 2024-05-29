Scriptname ReconScopeScript extends ActiveMagicEffect

RefCollectionAlias Property ReconTargets Auto Const
float Property ReconMarkerTime = 4000.0 Auto Const

Actor TargetRef

Event OnEffectStart(Actor akTarget, Actor akCastor)
	TargetRef = akTarget
	ReconTargets.AddRef(TargetRef)
	StartTimer(ReconMarkerTime, 6546)
EndEvent

Event OnTimer(Int aiTimerID)
	If aiTimerID == 6546
		ReconTargets.RemoveRef(TargetRef)
	endif
EndEvent

;REMINDER: Can't do remove marker on effect finish because recasts stomp each other
;Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;ReconTargets.RemoveRef(TargetRef)
;EndEvent