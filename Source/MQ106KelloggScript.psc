Scriptname MQ106KelloggScript extends ReferenceAlias

Weapon Property p44 Auto

Event OnLoad()
	debug.trace(Self + " has loaded")
	If (GetOwningQuest().GetStageDone(10) == 1) && (GetOwningQuest().GetStageDone(900) == 0)
		;lock Kellogg's gun on Kellogg so he always uses it
		debug.trace(Self + " Kellogg's gun locked on him. Cannot be unequipped")
		Self.GetActorRef().EquipItem(p44, abPreventRemoval=True)
	EndIf
EndEvent