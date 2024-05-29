Scriptname MS07bGraveDigScript extends ObjectReference Const

Quest Property MS07b Auto Const
int Property iMyStage Auto Const

Event OnActivate (ObjectReference akActionRef)
	if !MS07b.GetStageDone(iMyStage) && akActionRef == Game.GetPlayer()
		MS07b.SetStage(iMyStage)
	endif
EndEvent