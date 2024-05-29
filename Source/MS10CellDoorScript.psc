Scriptname MS10CellDoorScript extends ObjectReference Const

Event OnLockStateChanged()
	If MS10b.GetStageDone(35) == false
		If IsLocked() == false
			MS10b.SetStage(35)
			MS10MiscTrinityTower.SetStage(500)
		EndIf
	EndIf
EndEvent

Quest Property MS10b Auto Const

Quest Property MS10MiscTrinityTower Auto Const
