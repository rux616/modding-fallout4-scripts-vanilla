Scriptname MS17_PlayerScript extends ReferenceAlias 

auto STATE Stage10Initial
	Event OnSit(ObjectReference akFurniture)
		Debug.Trace("Player has sat on " + akFurniture)

		if (akFurniture == pInterrogateChair.GetReference() )
			Utility.Wait(3.0)
			pMS17.SetStage(150)
		EndIf
	EndEvent
EndState

Quest Property pMS17 Auto 

ReferenceAlias Property pInterrogateChair Auto 
