ScriptName MQ03PlayerScript extends ReferenceAlias

Ammo Property FusionCore Auto
Quest Property MQ03 Auto
Quest Property Min00 Auto
Cell Property ConcordMuseum01 Auto
ReferenceAlias Property PowerArmorFurniture Auto
ObjectReference Property MQPlayerCryopodREF Auto
Bool DoOnce = False

Event OnAliasInit()
	AddInventoryEventFilter(FusionCore)
EndEvent

Function PlayerRegister()
	(RegisterForAnimationEvent(MQPlayerCryopodREF, "exitStop"))
EndFunction


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If asEventName == "exitStop"
		UnRegisterForAnimationEvent(MQPlayerCryopodREF, "exitStop")
		;don't allow the player to activate the cryo furniture again
		;MQPlayerCryopodREF.BlockActivation()
		;activate button is removed
		MQPlayerCryopodREF.BlockActivation(true, true)
		GetOwningQuest().SetStage(2)
		;give the animation time to finish
		;Utility.Wait(5)
		;swap the furniture cropod for the door cryopod - Not doing this for now to preserve FX
		;MQPlayerCryopodREF.disable()
	EndIf
EndEvent


;check if the player has a Fusion Core, swap objectives if he drops them
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akBaseItem == FusionCore
		If MQ03.GetStageDone(90) == 1 && MQ03.GetStageDone(105) == 0
			Min00.SetObjectiveCompleted(90, 1)
			Min00.SetObjectiveDisplayed(105, abForce = True)
		EndIf
	EndIf

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If akBaseItem == FusionCore
		;redisplay the objective if the player has no Fusion Core, except if the player just put the fusion core in the power armor
		If MQ03.GetStageDone(90) == 1 && MQ03.GetStageDone(105) == 0 && Game.GetPlayer().GetItemCount(FusionCore) == 0 && akDestContainer != PowerArmorFurniture.GetRef()
			Min00.SetObjectiveDisplayed(105, abDisplayed = False)
			Min00.SetObjectiveDisplayed(90, abForce = True)
		EndIf
	EndIf

EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;make sure stage 70 is always set if the player enters the museum
	If MQ03.GetStageDone(70) == 0 && Game.GetPlayer().GetParentCell() == ConcordMuseum01
		GetOwningQuest().SetStage(70)
	EndIf
EndEvent

;check to see if the player gets the Power Armor on the roof
;Event OnSit(ObjectReference akFurniture)
;	;debug.trace(self + " PLAYER SITS IN POWER ARMOR")
;	If akFurniture == PowerArmorFurniture.GetRef()
;		;FIRST - set the stage when the player finishes the Battery Animation, THEN set the stage when the player finishes the ENTER POWER ARMOR animation
;		If GetOwningQuest().GetStageDone(105) == 0
;			;debug.trace(self + " POWER ARMOR BATTERY")
;			GetOwningQuest().SetStage(105)
;		ElseIf (GetOwningQuest().GetStageDone(110) == 0) && (PowerArmorFurniture.GetRef().GetItemCount(FusionCore) >= 1)
;			;debug.trace(self + " POWER ARMOR ENTER")
;			GetOwningQuest().SetStage(110)
;		EndIf
;	EndIf
;EndEvent
