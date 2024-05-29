Scriptname DN128FreightSwitchScript extends ObjectReference 

message property DN128FreightSwitchMessage auto
message property DN128TrainExplosionMessageTEMP auto
message property CantUseInCombatMessage auto

ObjectReference property train01 auto
ObjectReference property train02 auto
ObjectReference property train03 auto

ObjectReference property turntableMarker auto
ObjectReference property basementTrain auto

Int ButtonPressed = 0

Quest Property MS16 const auto
int Property CompletionStage const auto


auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == game.getPlayer()
			if game.getPlayer().isInCombat() == 1
				CantUseInCombatMessage.show()
			else
				ButtonPressed = DN128FreightSwitchMessage.Show()
					If ButtonPressed == 0
						;do nothing
			    	ElseIf ButtonPressed == 1
			    		gotoState("Done")
			    		train01.disable()
			    		;train01.moveto(turntableMarker)
			    		utility.wait(3)
			    		basementTrain.enable()
		    		ElseIf ButtonPressed == 2
		    			gotoState("Done")
		    			;train02.moveto(turntableMarker)
			    		utility.wait(3)
		    			basementTrain.enable()
		    		ElseIf ButtonPressed == 3
		    			gotoState("Done")
		    			;train03.moveto(turntableMarker)
			    		utility.wait(3)
		    			basementTrain.enable()
					endif

					if (ButtonPressed > 0)
						(MS16 as MS16QuestScript).RewardChosen = ButtonPressed
					endif
			endif
    	endif
	EndEvent
endState

state Done
	Event OnBeginState(string asOldState)
	    DN128TrainExplosionMessageTEMP.show()
	    MS16.SetStage(CompletionStage)
	EndEvent
endState
