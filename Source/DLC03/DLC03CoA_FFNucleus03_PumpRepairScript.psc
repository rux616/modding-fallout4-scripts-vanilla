Scriptname DLC03:DLC03CoA_FFNucleus03_PumpRepairScript extends ObjectReference

Quest Property DLC03CoA_FFNucleus03_PumpHandler Auto Const Mandatory
{Quest used to set pump state}

Message Property DLC03CoA_FFNucleus03_RepairPump Auto Const Mandatory
{The message that displays when the player attempts to fix the pump}

ActorValue Property Intelligence Auto Const Mandatory
{Used to determine if player has sufficent int to reverse pump}

GlobalVariable Property DLC03_FFNucleus03_IntThreshold Auto Const Mandatory
{Intelligence stat player needs to have to repair pump}

Message Property DLC03CoA_FFNucleus03_RepairDecomFAIL Auto Const Mandatory
{Message that displays if player is unable to repair decon}
Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		Actor Player = Game.GetPlayer()

		;If player is activating and the appropriate stage is done...
		if akActionRef == Player && DLC03CoA_FFNucleus03_PumpHandler.GetStageDone(10)

			;Check to see what button is pressed
			int ButtonPressed = DLC03CoA_FFNucleus03_RepairPump.Show()

			if ButtonPressed == 1
				;If the player simply installed the pump, set the appropriate stage
				GoToState("Complete")
				PlayAnimationAndWait("PLAY01", "Done")
				DLC03CoA_FFNucleus03_PumpHandler.SetStage(30)		
								
				;self.Disable()
			elseif ButtonPressed == 2
				;If the player repaired the system, set the appropriate stage
				if Player.GetValue(Intelligence) >= DLC03_FFNucleus03_IntThreshold.GetValue()
					GoToState("Complete")
					PlayAnimationAndWait("PLAY01", "Done")
					DLC03CoA_FFNucleus03_PumpHandler.SetStage(20)		
				else
					DLC03CoA_FFNucleus03_RepairDecomFAIL.Show()
				endif
			endif
		endIf
	EndEvent
EndState

State Complete
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing
	EndEvent
EndState