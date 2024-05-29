Scriptname SkillMagazineBaseScript extends ObjectReference Const

Float Property GlobalAdd Auto Const
GlobalVariable Property ExtraMeatChance Auto Const

Event OnActivate(ObjectReference akActor)
	ExtraMeatChance.SetValue(ExtraMeatChance.GetValue() + GlobalAdd)	
EndEvent
