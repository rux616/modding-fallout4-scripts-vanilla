Scriptname CreationClub:VRWorkshops:VRWorkshopSummonObjectScript extends ObjectReference
{Object to summon settlers in VR}

Quest Property VRWorkshopShared_SummonSettlersQuest Auto Const Mandatory
ReferenceAlias Property CurrentSummonMarker Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	If(akActionRef == Game.GetPlayer())

		;If the quest is already running, check if it's a different summon marker being activated, and if so, re-start the quest
		If(VRWorkshopShared_SummonSettlersQuest.IsRunning())
			If(CurrentSummonMarker.GetRef() != self)
				VRWorkshopShared_SummonSettlersQuest.Stop()
				VRWorkshopShared_SummonSettlersQuest.Start()
			EndIf
		;If it's not running already, just start it
		Else
			VRWorkshopShared_SummonSettlersQuest.Start()
		EndIf

	EndIf
EndEvent