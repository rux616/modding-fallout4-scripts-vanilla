Scriptname DLC03:MQ04VREnterTerminalScript extends ObjectReference Const

Perk property PowerArmorPerk auto const mandatory 

Message property PowerArmorNoActivate auto const mandatory 

Message property DLC03MQ04TerminalNoPowerMessage auto const mandatory 

Quest property DLC03MQ04 auto const mandatory 

Event OnLoad()
	SetNoFavorAllowed()
   	BlockActivation(true, false)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate " + akActionRef)
	if akActionRef == Game.GetPlayer()
	; switch to "Retrieve memories" objective
		if DLC03MQ04.GetStageDone(50) == false
			DLC03MQ04TerminalNoPowerMessage.Show()
		elseif (akActionRef as Actor).HasPerk(PowerArmorPerk)
			PowerArmorNoActivate.Show()
		;93454: Terminal entry can send additional activations while the player is midway
		;through animating into the terminal. As a workaround, ignore any other activates.
		elseif (akActionRef as Actor).GetSitState() == 0
			Activate(akActionRef, true)
		endif 
	endif
EndEvent