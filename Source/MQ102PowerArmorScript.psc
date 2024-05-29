ScriptName MQ102PowerArmorScript extends ReferenceAlias

Ammo Property AmmoFusionCore Auto
Keyword Property batteryInsertAnimKW Auto
Quest Property Min00 Auto

Event OnAliasInit()
	AddInventoryEventFilter(AmmoFusionCore)
EndEvent

;check if the power armor has a Fusion Core, swap objectives if it drops them
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akBaseItem == AmmoFusionCore
		If GetOwningQuest().GetStageDone(90) == 1 && GetOwningQuest().GetStageDone(110) == 0
			Min00.SetObjectiveCompleted(105, 1)
			Min00.SetObjectiveDisplayed(110, abForce = True)
			GetOwningQuest().SetStage(105)
		EndIf
	EndIf

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If akBaseItem == AmmoFusionCore
		;redisplay the objective if the player has no Fusion Core, except if the player just put the fusion core in the power armor
		If GetOwningQuest().GetStageDone(90) == 1 && (GetOwningQuest().GetStageDone(110) == 0) && (Self.GetRef().GetItemCount(AmmoFusionCore) <= 0)
			Min00.SetObjectiveDisplayed(110, abDisplayed = False)
			Min00.SetObjectiveDisplayed(105, abForce = True)
		EndIf
	EndIf

EndEvent


Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If (akActionref == PlayerREF) 
		If PlayerREF.IsInPowerArmor()
			;Do nothing if the player is in another suit of power armor
		ElseIf (akActionRef.HasKeyword(batteryInsertAnimKW) == FALSE)
			If (Self.GetRef().GetItemCount(AmmoFusionCore) >= 1)
				GetOwningQuest().Setstage(110)
			EndIf
		EndIf
	EndIf
EndEvent