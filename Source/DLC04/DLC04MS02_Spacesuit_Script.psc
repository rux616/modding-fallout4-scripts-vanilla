Scriptname DLC04:DLC04MS02_Spacesuit_Script extends ObjectReference Const

GlobalVariable Property DLC04MS02_Spacesuit_Count Auto Const Mandatory
Quest Property DLC04MS02 Auto Const Mandatory

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if DLC04MS02_Spacesuit_Count.GetValue() < 5.0
		if DLC04MS02.GetStage() == 300
			if akNewContainer == game.GetPlayer()
				DLC04MS02.ModObjectiveGlobal(1.0, DLC04MS02_Spacesuit_Count, 300, 5, true, true)
				if DLC04MS02_Spacesuit_Count.GetValue() >= 5.0
					DLC04MS02.SetStage(400)
				endif
			elseif akOldContainer == game.GetPlayer()
				DLC04MS02.ModObjectiveGlobal(-1.0, DLC04MS02_Spacesuit_Count, 300, 5, true, true)
			endif
		else
			if akNewContainer == Game.GetPlayer()
				DLC04MS02_Spacesuit_Count.SetValue(DLC04MS02_Spacesuit_Count.GetValue() + 1.0)
			elseif akOldContainer == game.GetPlayer()
				DLC04MS02_Spacesuit_Count.SetValue(DLC04MS02_Spacesuit_Count.GetValue() - 1.0)
			endif
		endif
	endif
EndEvent
