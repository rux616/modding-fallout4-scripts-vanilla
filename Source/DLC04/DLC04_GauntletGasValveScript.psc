Scriptname DLC04:DLC04_GauntletGasValveScript extends ObjectReference

DLC04:DLC04MQ01GauntletQuestScript property DLC04MQ01Gauntlet Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory

Function ReadyGasValve()
	GoToState("Ready")
EndFunction

Function ShutoffGasValve()
	GoToState("Waiting")
EndFunction

Auto State Waiting
	Event OnBeginState(String oldState)
		Self.BlockActivation(True, True)
	EndEvent

	Event OnCellLoad()
		Self.BlockActivation(True, True)
	EndEvent

	Event OnEndState(String newState)
		Self.BlockActivation(False, False)
		Debug.Trace("--Readyied " + Self)
	EndEvent
EndState

State Ready
	Event OnActivate(ObjectReference akActivator)
		if (!DLC04MQ01Gauntlet.GetStageDone(850))
			GoToState("Waiting")
			Self.Activate(Game.GetPlayer())
			Self.GetLinkedRef(LinkCustom01).DisableNoWait()
			DLC04MQ01Gauntlet.DisableGasValve()
		EndIf
	EndEvent
EndState