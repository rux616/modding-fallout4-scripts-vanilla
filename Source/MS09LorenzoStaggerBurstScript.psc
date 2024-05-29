Scriptname MS09LorenzoStaggerBurstScript extends ActiveMagicEffect Const

MS09Script property MS09 auto const mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace(self + " OnMagicEffectApply akTarget=" + akTarget + ", akCaster=" + akCaster)
    ; send event from MS09
    MS09.SendCustomEvent("LorenzoTelekinesisEvent")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    debug.trace(self + " OnMagicEffectApply akTarget=" + akTarget + ", akCaster=" + akCaster)
EndEvent