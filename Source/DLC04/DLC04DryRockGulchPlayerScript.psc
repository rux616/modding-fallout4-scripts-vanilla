Scriptname DLC04:DLC04DryRockGulchPlayerScript extends ReferenceAlias

FormList Property DLC04_DRG_GiddyupList Auto Const Mandatory
FormList Property DLC04_DRG_GiddyupListParts Auto Const Mandatory
FormList Property DLC04_DRG_GiddyupListWhole Auto Const Mandatory
ReferenceAlias Property CorralTrigger Auto Const Mandatory
Book Property DLC04_DRG_Combo01 Auto Const Mandatory
Book Property DLC04_DRG_Combo02 Auto Const Mandatory
Book Property DLC04_DRG_Combo03 Auto Const Mandatory
Key Property DLC04_DRG_MineKey Auto Const Mandatory

Event OnAliasInit()
	AddInventoryEventFilter(DLC04_DRG_GiddyupList)
	AddInventoryEventFilter(DLC04_DRG_Combo01)
	AddInventoryEventFilter(DLC04_DRG_Combo02)
	AddInventoryEventFilter(DLC04_DRG_Combo03)
	AddInventoryEventFilter(DLC04_DRG_MineKey)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	Quest MyQuest = GetOwningQuest()
	;check if the player drops a Giddyup Buttercup or its pieces while in the Corral Trigger
	If (MyQuest.GetStageDone(300) == 1) && (MyQuest.GetStageDone(330) == 0) && (MyQuest.GetStageDone(325) == 0)
		If CorralTrigger.GetRef().GetTriggerObjectCount() >= 1
			;player dropped an intact Buttercup
			If  DLC04_DRG_GiddyupListWhole.HasForm(akBaseItem)
				MyQuest.SetStage(330)
			ElseIf DLC04_DRG_GiddyupListParts.HasForm(akBaseItem)
				MyQuest.SetStage(325)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Quest MyQuest = GetOwningQuest()

    If (MyQuest.GetStageDone(120) == 0) && (akBaseItem == DLC04_DRG_Combo01)
    	MyQuest.SetStage(120)
    ElseIf (MyQuest.GetStageDone(220) == 0) && (akBaseItem == DLC04_DRG_Combo02)
    	MyQuest.SetStage(220)
    ElseIf (MyQuest.GetStageDone(320) == 0) && (akBaseItem == DLC04_DRG_Combo03)
    	MyQuest.SetStage(320)
    EndIf


    If (MyQuest.GetStageDone(410) == 0) && (akBaseItem == DLC04_DRG_MineKey)
    	MyQuest.SetStage(410)
    EndIf
EndEvent