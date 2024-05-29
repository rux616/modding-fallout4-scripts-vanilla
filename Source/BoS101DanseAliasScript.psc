Scriptname BoS101DanseAliasScript extends ReferenceAlias Const Hidden

Armor Property Armor_Power_T60_Helm Auto Const
LeveledItem Property LL_Armor_Power_T60_Set_BOSPaladin_HelmetOnly Auto Const

Event OnAliasInit()
	RegisterForAnimationEvent(Self.GetActorRef(),"EquipHelmet")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "EquipHelmet"
		debug.trace("EquipHelmet")
		Self.GetActorRef().AddItem(LL_Armor_Power_T60_Set_BOSPaladin_HelmetOnly)
		UnregisterForAnimationEvent(Self.GetActorRef(),"EquipHelmet")
	endif
EndEvent