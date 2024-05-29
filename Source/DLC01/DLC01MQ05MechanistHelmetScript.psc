Scriptname DLC01:DLC01MQ05MechanistHelmetScript extends ReferenceAlias

Event OnLoad()
	debug.trace(self + "EquipHelmet - Registered")
	RegisterForAnimationEvent(Self.GetActorRef(), "EquipHelmet")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + "EquipHelmet - Testing")
	if asEventName == "EquipHelmet"
		debug.trace(self + "EquipHelmet was called.")
		Self.GetActorRef().UnEquipItem(DLC01_ClothesMechanistHelmet)
		UnregisterForAnimationEvent(Self.GetActorRef(),"EquipHelmet")
	endif
EndEvent

Armor Property DLC01_ClothesMechanistHelmet Auto Const
