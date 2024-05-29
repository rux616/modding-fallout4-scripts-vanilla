Scriptname MS10BillyScript extends ReferenceAlias

Actor Property BulletRef Auto Const Mandatory
Quest Property MS01 Auto Const Mandatory
Message Property CallElevatorMSG Auto Const Mandatory
Message Property DogmeatNameMSG Auto Const Mandatory

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == game.GetPlayer() && MS01.GetStage() == 500
		BulletRef.StartCombat(game.GetPlayer())
	endif
EndEvent	
