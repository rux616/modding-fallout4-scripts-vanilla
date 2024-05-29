Scriptname DLC04:DLC04NukacadeTerminalScript extends ObjectReference Const

DLC04:DLC04_NukaCadeQuestScript Property DLC04NukaCade Auto Const Mandatory

	; Forces the linked vending machine into the correct aliases, then tells it to update it's info with the latest counts.
Event OnActivate(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		if !DLC04NukaCade.BusyRefilling
			DLC04NukaCade.UpdateTerminal(Self)
    		activate(game.GetPlayer(), true)
    	endif
	endif
EndEvent


Event OnCellAttach()
	BlockActivation(true)
EndEvent