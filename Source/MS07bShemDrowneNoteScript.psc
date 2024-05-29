Scriptname MS07bShemDrowneNoteScript extends ObjectReference Const

Quest Property MS07b Auto Const


Event OnRead()

if MS07b.GetStageDone(30) == 0

	MS07b.SetStage(30)
;	debug.messagebox("This is firing!")

endif

EndEvent