Scriptname DLC03:VRCubeScript extends ObjectReference Const

Form property myResourceBase const auto
int property myResourceCount = 1 const auto

ObjectReference property myWorkshop const auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    ; when destroyed, give workshop back resources
	if myWorkshop && myResourceBase
		myWorkshop.AddItem(myResourceBase, myResourceCount)
	endif
EndEvent
