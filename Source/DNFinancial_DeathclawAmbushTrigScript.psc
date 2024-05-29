Scriptname DNFinancial_DeathclawAmbushTrigScript extends ObjectReference Hidden
{Trigger script for the Deathclaw ambush on the roof of Financial 10.}

int property myID auto const

Keyword property LinkCustom01 auto const 	;Link to Deathclaw A
Keyword property LinkCustom02 auto const 	;Link to Deathclaw B
Keyword property LinkCustom03 auto const 	;Link to the other trigger

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor player = Game.GetPlayer()
	if (akActionRef == player)
		Self.Disable()
		Self.GetLinkedRef(LinkCustom03).Disable()
		Actor myDeathclaw
		if (myID == 0)
			myDeathclaw = Self.GetLinkedRef(LinkCustom01) as Actor
		Else
			myDeathclaw = Self.GetLinkedRef(LinkCustom02) as Actor
		EndIf
		myDeathclaw.Enable()
		Utility.Wait(0.1)
		myDeathclaw.Activate(player)
		myDeathclaw.StartCombat(player)
	EndIf
EndEvent