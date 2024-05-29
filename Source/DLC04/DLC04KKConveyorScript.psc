Scriptname DLC04:DLC04KKConveyorScript extends ObjectReference

Group AnimProperties
	String Property OnAnim = "Play01" Auto Const
	String Property OffAnim = "Play02" AUto Const
EndGroup

Struct SpeedSetting
	float VelX
	float VelY 
	Float VelZ 
	bool abOn
	String myState
	String myAnimString
EndStruct

SpeedSetting[] Property SpeedSettings Auto Const Mandatory

float currentSpeed

State Off
	Event OnBeginState(string asOldState)
	    int i = 0
	    ApplyConveyorBelt("Belt", SpeedSettings[i].VelX, SpeedSettings[i].VelY, SpeedSettings[i].VelZ, SpeedSettings[i].abOn)
	    ;SetAnimationVariableFloat(speedVar, currentSpeed)
	    PlayAnimation(SpeedSettings[i].myAnimString)
	EndEvent

EndState

State Slow
	Event OnBeginState(string asOldState)
	    int i = 1
	    ApplyConveyorBelt("Belt", SpeedSettings[i].VelX, SpeedSettings[i].VelY, SpeedSettings[i].VelZ, SpeedSettings[i].abOn);SetAnimationVariableFloat(speedVar, currentSpeed)
	    ;
	    PlayAnimation(SpeedSettings[i].myAnimString)
	EndEvent

EndState

State Medium
	Event OnBeginState(string asOldState)
	    int i = 2
	    ApplyConveyorBelt("Belt", SpeedSettings[i].VelX, SpeedSettings[i].VelY, SpeedSettings[i].VelZ, SpeedSettings[i].abOn);SetAnimationVariableFloat(speedVar, currentSpeed)
	    PlayAnimation(SpeedSettings[i].myAnimString)
	EndEvent

EndState


State Fast
	Event OnBeginState(string asOldState)
	    int i = 3
	    ApplyConveyorBelt("Belt", SpeedSettings[i].VelX, SpeedSettings[i].VelY, SpeedSettings[i].VelZ, SpeedSettings[i].abOn);SetAnimationVariableFloat(speedVar, currentSpeed)
	    PlayAnimation(SpeedSettings[i].myAnimString)
	EndEvent

EndState


Function SetSpeed(int Speed)
	if GetState() != SpeedSettings[Speed].myState
		GoToState(SpeedSettings[Speed].myState)
	endif
EndFunction

;call play01 is fastest, play02-04 get progressively slower
;call reset to go back to off
