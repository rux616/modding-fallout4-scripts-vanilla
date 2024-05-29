Scriptname MS19EnterOverseerOfficeScript extends ObjectReference Const

Scene Property MS19PCArrivesOverseer Auto Const
Quest Property MS19 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if MS19.GetStage() == 300
		if akActionRef == game.getplayer()
			MS19PCArrivesOverseer.start()
			Disable()
		endIf
	endIf
EndEvent
