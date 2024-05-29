Scriptname VitaleCodeMaster extends ObjectReference

ObjectReference property doorToOpen auto Const

int[] property solution auto Const

objectReference[] property inputs auto Const

bool function checkForSolution()
	
	debug.trace("Number Puzzle Master Checker: GO!")

	int inputsToCheck = inputs.Length
	int inputsChecked = 0
	bool bFailed = FALSE

	while (inputsChecked < inputsToCheck) && !bFailed
		if (inputs[inputsChecked] as VitaleCodeButtonScript).currentValue == solution[inputsChecked]
			debug.trace("    input "+inputsChecked+" is GOOD!")
			inputsChecked += 1
		else
			debug.trace("    input "+inputsChecked+" is BAD!  Failing out.")
			bFailed = TRUE
			return FALSE
		endif
	endWhile

	debug.trace("    completed Check succesfully: open up "+doorToOpen)
	doorToOpen.unlock()
	doorToOpen.setOpen()
	
endFunction

	
