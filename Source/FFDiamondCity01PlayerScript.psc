ScriptName FFDiamondCity01PlayerScript extends ReferenceAlias

FormList Property FFDiamondCity01PaintList Auto

Event OnInit()
	AddInventoryEventFilter(FFDiamondCity01PaintList)
EndEvent

;check if the player picks up any paint, swap objectives if he drops them
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Quest MyQuest = GetOwningQuest()
	;advance quest when player gets any paint
	If MyQuest.GetStageDone(20) == 0 && MyQuest.GetStageDone(10) == 1
		MyQuest.SetStage(20)
	EndIf

	;redisplay objectives if player picks up the paint again
	If MyQuest.GetStageDone(40) == 0 && MyQuest.GetStageDone(20) == 1
		MyQuest.SetObjectiveCompleted(10)
		MyQuest.SetObjectiveDisplayed(20)
	EndIf
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	Quest MyQuest = GetOwningQuest()
	;change objectives if player no longer has any paint
	If (Game.GetPlayer().GetItemCount(FFDiamondCity01PaintList) == 0)
		If MyQuest.GetStageDone(40) == 0 && MyQuest.GetStageDone(20) == 1
			MyQuest.SetObjectiveDisplayed(20, abDisplayed = False)
			MyQuest.SetObjectiveDisplayed(10, abForce = True)
		EndIf
	EndIf
EndEvent