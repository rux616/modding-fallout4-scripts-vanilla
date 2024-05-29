Scriptname V81MutfruitScript extends ActiveMagicEffect

Quest Property DialogueVault81 Auto Const
MagicEffect Property V81MutfruitEffect Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Debug.Trace("Magic effect was started on " + akTarget)
  If akTarget == Game.GetPlayer()
  	DialogueVault81.SetStage(643)
  EndIf
endEvent