Scriptname DLC04:DLC04ArcadeScoreNumber extends ObjectReference 


Function DisplayNumber(int numberToDisplay)
	if numberToDisplay < 0 || numberToDisplay > 9
		Debug.Trace(Self + ": ERROR this is not a number between 0-9 >> " + numberToDisplay)
	else
		string myNum = numberToDisplay as string
		String AnimString = "Num0"
		AnimString += myNum
		PlayAnimation(AnimString)
		;/
		if numberToDisplay == 0
			PlayAnimation("0")
		elseif numberToDisplay == 1
			PlayAnimation("1")
		endif
		/;

		;string myNum = numberToDisplay as string
	endif
EndFunction

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent