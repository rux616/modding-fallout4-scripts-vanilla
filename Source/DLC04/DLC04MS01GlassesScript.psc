Scriptname DLC04:DLC04MS01GlassesScript extends ObjectReference Const
{Controls the enable and disable of the hidden cappy decals based on whether the player has the glasses equipped or not}

Quest Property DLC04MS01 Auto Const Mandatory
ObjectReference Property DLC04MS01CappyEnableMarker Auto Const Mandatory

Event OnEquipped(Actor akActor)
	if akActor == Game.GetPlayer()
    	Debug.Trace("Glasses equipped by the player")
    	DLC04MS01CappyEnableMarker.Enable()
    	DLC04MS01.SetStage(20)
	endIf
endEvent

Event OnUnequipped(Actor akActor)
	if akActor == Game.GetPlayer()
    	Debug.Trace("Glasses unequipped by the player")
    	DLC04MS01.SetStage(30)
	endIf
endEvent
