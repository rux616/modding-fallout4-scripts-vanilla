Scriptname BoS302TagScript extends ReferenceAlias

Quest Property BOS302 Auto Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		
		if akNewContainer == Game.GetPlayer()
			if BOS302.GetStage() == 90
				BOS302.SetStage(110)
			endif	
		endif
			
endEvent		