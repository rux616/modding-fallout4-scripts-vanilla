Scriptname PerkMagHuntsmanScript extends ObjectReference

Float Property GlobalAdd Auto Const
GlobalVariable Property ExtraMeatChance Auto Const
Bool ReadOnce

Event OnActivate(ObjectReference akActor)
	if ReadOnce == false
		ExtraMeatChance.SetValue(ExtraMeatChance.GetValue() + GlobalAdd)
		ReadOnce = true
	endif
EndEvent
