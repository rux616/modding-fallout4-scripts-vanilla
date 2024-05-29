Scriptname DLC04:DLC04FlagpoleActivatorScript extends ReferenceAlias

Int ButtonPressed
Int Property StageGate Auto Mandatory
Int Property StageToSet Auto Mandatory
Quest Property DLC04MQ03 Auto Const Mandatory
Quest Property DLC04RaiderControllerQuest Auto Const Mandatory
Message Property DLC04MQ03Message Auto Const Mandatory
Message Property DLC04FlagpoleNotReclaimedMessage Auto Const Mandatory
GlobalVariable Property ZoneClaimedGlobal Auto Const Mandatory
ObjectReference Property DisciplesFlag Auto Const Mandatory
ObjectReference Property OperatorsFlag Auto Const Mandatory
ObjectReference Property PackFlag Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
debug.trace("I am activating a flagpole")

if DLC04MQ03.GetStageDone(StageGate) == 1 && DLC04MQ03.GetStageDone(StageToSet) == 0
	if akActionRef == Game.GetPlayer()
		Debug.Trace("FlagPole Activated")
		ButtonPressed = DLC04MQ03Message.Show()
		if ButtonPressed == 0
			Debug.Trace("Button 0 Pressed - Disciples")
			;Kick Off the Enable for the Flag and the Zone
			DLC04MQ03.SetStage(StageToSet)
			DisciplesFlag.Enable()
			DLC04RaiderControllerQuest.SetStage(10)
			ZoneClaimedGlobal.SetValue(1)
		elseif ButtonPressed == 1
			Debug.Trace("Button 1 Pressed - Operators")
			;Kick Off the Enable for the Flag and the Zone
			DLC04MQ03.SetStage(StageToSet)
			OperatorsFlag.Enable()
			DLC04RaiderControllerQuest.SetStage(20)
			ZoneClaimedGlobal.SetValue(2)
		elseif ButtonPressed == 2
			Debug.Trace("Button 2 Pressed - Pack")
			;Kick Off the Enable for the Flag and the Zone
			DLC04MQ03.SetStage(StageToSet)
			PackFlag.Enable()
			DLC04RaiderControllerQuest.SetStage(30)
			ZoneClaimedGlobal.SetValue(3)			
		endif
	endif
elseif DLC04MQ03.GetStageDone(StageGate) == 0
	DLC04FlagpoleNotReclaimedMessage.Show()
endif	

EndEvent