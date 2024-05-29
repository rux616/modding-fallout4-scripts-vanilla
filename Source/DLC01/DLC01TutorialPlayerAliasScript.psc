Scriptname DLC01:DLC01TutorialPlayerAliasScript extends ReferenceAlias

Potion Property DLC01RepairKit Auto Const Mandatory
Message Property DLC01TutorialRobotRepairKit Auto Const Mandatory
Quest Property MQ102 Auto Const Mandatory

Actor PlayerRef
Bool bRepairKitTutorialOnce = false

Event OnInit()
	AddInventoryEventFilter(DLC01RepairKit)

	PlayerRef = Game.GetPlayer()
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
;debug.trace(self + "akBaseItem: " + akBaseItem)

	if MQ102.GetStageDone(10)

		;If player acquires Junk Jet, show tutorial
		if akBaseItem == DLC01RepairKit
			if !bRepairKitTutorialOnce
				RemoveInventoryEventFilter(DLC01RepairKit)
				DLC01RepairKitTutorial()
			endif
		endif

	endif

EndEvent

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function DLC01RepairKitTutorial()
	if !bRepairKitTutorialOnce
		bRepairKitTutorialOnce = true

		DLC01TutorialRobotRepairKit.ShowAsHelpMessage("DLC01RRK", 8, 0, 1, "NoMenu", 18)
	endif
EndFunction