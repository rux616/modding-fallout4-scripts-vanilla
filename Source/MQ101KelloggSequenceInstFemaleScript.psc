Scriptname MQ101KelloggSequenceInstFemaleScript extends ReferenceAlias

ReferenceAlias Property MultiActorFurniture Auto
Armor Property babybundled auto


Event OnSit(ObjectReference akFurniture)
	If akFurniture == MultiActorFurniture.GetRef()
		Actor myActor = Self.GetActorRef()
		myActor.AddItem(babybundled, abSilent=True)
		myActor.EquipItem(babybundled, abSilent=True)
	EndIf
EndEvent


Event OnGetUp(ObjectReference akFurniture)
	If akFurniture == MultiActorFurniture.GetRef()
		Actor myActor = Self.GetActorRef()
		myActor.UnEquipItem(babybundled, abSilent=True)
		myActor.RemoveItem(babybundled, abSilent=True)
	EndIf
EndEvent