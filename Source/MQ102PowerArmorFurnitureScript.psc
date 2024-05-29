Scriptname MQ102PowerArmorFurnitureScript extends ReferenceAlias

Holotape Property MQPreWarSoldierHolotape01 Auto

Auto State WaitingForPlayer
	Event OnLoad()
		GotoState("doneState")
		Self.GetRef().AddItem(MQPreWarSoldierHolotape01)
	EndEvent
EndState

State doneState
	Event OnLoad()
		;empty State state
	EndEvent	
EndState