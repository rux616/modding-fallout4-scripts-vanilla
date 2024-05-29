Scriptname DLC04:DLC04DisableGangsPostQuestScript extends ReferenceAlias

ObjectReference Property DLC04DisciplesFizztopDisablePostRef Auto Const Mandatory
ObjectReference Property DLC04OperatorsParlorDisablePostRef Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Location Property DLC04FizztopMountainLocation Auto Const Mandatory
Location Property DLC04TheParlorLocation Auto Const Mandatory

Quest Property DLC04MQ05 Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If DLC04MQ05.GetStageDone(5) == 1
		If akOldLoc == DLC04FizztopMountainLocation && DLC04EnemyGang.GetValue() == 1 && GetOwningQuest().GetStageDone(10) == 1 && GetOwningQuest().GetStageDone(20) ==1
			Debug.Trace("Left Fizztop")
			DLC04DisciplesFizztopDisablePostRef.Disable()
		EndIf
		If akOldLoc == DLC04TheParlorLocation && DLC04EnemyGang.GetValue() ==2 && GetOwningQuest().GetStageDone(30)
			DLC04OperatorsParlorDisablePostRef.Disable()
		EndIf
	EndIf
EndEvent