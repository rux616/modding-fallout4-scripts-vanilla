Scriptname MS01ParentsNoteScript extends ObjectReference Const

Quest Property MS01 Auto Const

Event OnContainerChanged(ObjectReference akNew, ObjectReference akOld)
	MS01.SetStage(700)
EndEvent