Scriptname BoS101QuestScript extends Quest

Quest Property BoS101 Auto Const
LeveledItem Property LL_Armor_Power_T60_Set_BOSPaladin_HelmetOnly Auto Const
ReferenceAlias Property BoS101Danse Auto Const

Function RegisterMe()

	Debug.Trace("Register Helmet Equip")

	RegisterForAnimationEvent(BoS101Danse.GetActorRef(), "EquipHelmet")

endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	Debug.Trace("akSource" + akSource + "asEventName" + asEventName)	
	
	if (akSource == BoS101Danse.GetActorRef()) && (asEventName == "EquipHelmet")
		Debug.Trace("Danse equips his helmet now")
		BoS101Danse.GetActorRef().AddItem(LL_Armor_Power_T60_Set_BOSPaladin_HelmetOnly)
	endIf

endEvent
