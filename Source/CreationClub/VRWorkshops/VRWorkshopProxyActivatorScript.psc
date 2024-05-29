Scriptname CreationClub:VRWorkshops:VRWorkshopProxyActivatorScript extends ObjectReference
{A dummy container used as a proxy to activate the real workshop}

Keyword Property VRWorkshopShared_Keyword_DummyWorkshopLink Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	If(akActionRef == Game.GetPlayer())
		If(GetLinkedRef(VRWorkshopShared_Keyword_DummyWorkshopLink))
			GetLinkedRef(VRWorkshopShared_Keyword_DummyWorkshopLink).StartWorkshop()
		EndIf
	EndIf
EndEvent
