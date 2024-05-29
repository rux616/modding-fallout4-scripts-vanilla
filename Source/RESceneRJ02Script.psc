Scriptname RESceneRJ02Script extends Quest

FormList Property RESceneRJ02_FormList Auto 

Book[] Property RESceneRJ02Notes Auto

GlobalVariable Property RESceneRJ02GlobalDoOnce Auto

;Starting the quest and putting the array of notes into the empty formlist

Event OnQuestInit()

	Debug.Trace( Self + " has started")
	;Check formlist size.  If it is > 0, it has been filled, and we will skip all this
	if ((RESceneRJ02_FormList.GetSize() == 0) && (RESceneRJ02GlobalDoOnce.Getvalue() == 0.0))
		RESceneRJ02GlobalDoOnce.setvalue(1.0)
		int i = 0
		while (i < RESceneRJ02Notes.length)
			debug.trace("Array Index "+ i + " = " + RESceneRJ02Notes[i])
			RESceneRJ02_FormList.AddForm(RESceneRJ02Notes[i])
			debug.trace("Formlist Index "+ i + " = " + RESceneRJ02_FormList.GetAt(i))
			i += 1
		endwhile
	endif

endEvent


