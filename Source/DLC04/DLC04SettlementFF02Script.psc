Scriptname DLC04:DLC04SettlementFF02Script extends Quest

Quest Property DLC04SettlementFF02 Auto Const Mandatory
GlobalVariable Property DLC04FF02MedallionsFound Auto Const Mandatory

Function UpdateMedallions(ReferenceAlias myMedallion, ObjectReference myActivator)

	; Block activation on the activator
	myActivator.BlockActivation(True,True)

	; Add the park medallion to the player's inventory
	Game.GetPlayer().AddItem(myMedallion.GetReference(),1)

	; Increment the "Medallions found" global by 1.
	DLC04FF02MedallionsFound.Mod(1)

	; If this was the 10th clue (based on the above global), set stage 200
	if DLC04FF02MedallionsFound.GetValue() >= 7
   		SetStage(200)
	endif

endfunction