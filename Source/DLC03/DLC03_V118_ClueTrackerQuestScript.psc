Scriptname DLC03:DLC03_V118_ClueTrackerQuestScript extends Quest Conditional

Int Property iClueFound = 0 Auto Conditional
{This is used to tell scene where the player announces a clue which clue was found.}
Int Property iBloodTrail = 0 Auto Conditional
{Used to specify how many blood trail / paint trail triggers the player has found}

Scene Property DLC03_V118_ClueFoundScene Auto Const Mandatory
Quest Property DLC03_V118_Quest Auto Const Mandatory

Function SetClueFoundAndStartScene(int clueNumber)
	if DLC03_V118_Quest.IsRunning()
		while DLC03_V118_ClueFoundScene.isPlaying()
			utility.Wait(1.0)
		endwhile
		iClueFound = clueNumber
		DLC03_V118_ClueFoundScene.Start()
	endif
EndFunction

Function IncreaseBloodFound()
	iBloodTrail += 1
EndFunction

Bool Property NoCaseFiles = false auto const
Function AddClue(ReferenceAlias myCaseFile, String TextIcon, Message myText, bool silent = false)

	ObjectReference myCaseFileRef = myCaseFile.GetReference()
	ObjectReference P = Game.GetPlayer()
	;If the player does not already have this case file give it to them
	; if silent, skip this as it isn't enough info to warrent giving the player the file
	if P.GetItemCount(myCaseFileRef) < 1 && !silent && !NoCaseFiles
		P.AddItem(myCaseFileRef)
	endif
	myCaseFileRef.AddTextReplacementData(TextIcon, myText)

EndFunction	
