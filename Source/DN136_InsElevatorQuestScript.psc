ScriptName DN136_InsElevatorQuestScript extends Quest Conditional
{Elevator master quest for DN136}

Int property CurrentFloor = 1 auto Conditional
Int property ElevatorCurrentFloor = 1 auto Conditional
Int property TargetFloor = 0 auto Conditional
bool property CallingElevator = false auto Conditional
ObjectReference property Door01 auto
ObjectReference property Door02 auto
ObjectReference property Door03 auto
ObjectReference property Door04 auto
ObjectReference property Door05 auto
ReferenceAlias property myElevator auto
Bool Property ElevatorReady Auto Conditional

;elevator graph variables for when calling elevator
Float property fLevelOneSpeedFast = 5.0 auto const
Float property fLevelTwoSpeedFast = 5.0 auto const
Float property fLevelThreeSpeedFast = 5.0 auto const 
Float property fLevelFourSpeedFast = 5.0 auto const
Float property fLevelFiveSpeedFast = 5.0 auto const
Float property fFirstDescentSpeedFast = 5.0 auto const

;elevator graph variables for when riding in elevator
Float property fLevelOneSpeedSlow = 10.0 auto const
Float property fLevelTwoSpeedSlow = 15.0 auto const
Float property fLevelThreeSpeedSlow = 20.0 auto const
Float property fLevelFourSpeedSlow = 25.0 auto const
Float property fLevelFiveSpeedSlow = 30.0 auto const
Float property fFirstDescentSpeedSlow = 60.0 auto const

;************************************	

Function SetElevatorVars(bool bCallElevator)
	if(bCallElevator)
		;means we're calling the elevator, so speed it up
		myElevator.getReference().SetAnimationVariableFloat("fLevelOneSpeed", fLevelOneSpeedFast)
		myElevator.getReference().SetAnimationVariableFloat("fLevelTwoSpeed", fLevelTwoSpeedFast)
		myElevator.getReference().SetAnimationVariableFloat("fLevelThreeSpeed", fLevelThreeSpeedFast)
		myElevator.getReference().SetAnimationVariableFloat("fLevelFourSpeed", fLevelFourSpeedFast)
		myElevator.getReference().SetAnimationVariableFloat("fLevelFiveSpeed", fLevelFiveSpeedFast)
		myElevator.getReference().SetAnimationVariableFloat("fFirstDescentSpeed", fFirstDescentSpeedFast)
	else
		;means we're in elevator, so slow it down
		myElevator.getReference().SetAnimationVariableFloat("fLevelOneSpeed", fLevelOneSpeedSlow)
		myElevator.getReference().SetAnimationVariableFloat("fLevelTwoSpeed", fLevelTwoSpeedSlow)
		myElevator.getReference().SetAnimationVariableFloat("fLevelThreeSpeed", fLevelThreeSpeedSlow)
		myElevator.getReference().SetAnimationVariableFloat("fLevelFourSpeed", fLevelFourSpeedSlow)
		myElevator.getReference().SetAnimationVariableFloat("fLevelFiveSpeed", fLevelFiveSpeedSlow)
		myElevator.getReference().SetAnimationVariableFloat("fFirstDescentSpeed", fFirstDescentSpeedSlow)
	endif

endFunction

;************************************	
Quest Property MQ207 Auto Const

Bool Property FirstDescentDone Auto Conditional

ObjectReference Property Door00 Auto Const
