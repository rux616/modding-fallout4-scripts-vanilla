Scriptname DLC04:DLC04MS01QuestScript extends Quest

Quest Property DLC04MS01 Auto Const Mandatory
GlobalVariable Property DLC04MS01CappysFound Auto Const Mandatory
Scene Property DLC04MS01_PlayerClueComments Auto Const Mandatory

Function UpdateClues(ReferenceAlias myClue, ObjectReference myActivator)

	; Block activation on the activator
	myActivator.BlockActivation(True,True)

	; Add the written clue to the player's inventory
	;Game.GetPlayer().AddItem(myClue.GetReference(),1)

	; Increment the "Cappys found" global by 1.
	DLC04MS01CappysFound.Mod(1)

	; If this was the 10th clue (based on the above global), set stage 200
	if DLC04MS01CappysFound.GetValue() >= 10
   		SetStage(200)
	endif

	; Start the player comment scene. This has a stack of 10 say once infos where the player says something each time he finds a hidden cappy.
	DLC04MS01_PlayerClueComments.Start()

endfunction
