Scriptname FFDiamondCity04ItemScript extends ReferenceAlias Conditional

Int Property var_PickedUp Auto Conditional

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		gotoState("hasbeentriggered")
		;set variable used for quest target tracking
		var_PickedUp = 1
		;Run function on quest script to track count
		(GetOwningQuest() as FFDiamondCity04Script).ItemCollected()
	EndEvent
EndState

State hasbeentriggered
	;empty state
EndState