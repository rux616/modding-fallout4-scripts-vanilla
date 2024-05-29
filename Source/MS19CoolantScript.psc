Scriptname MS19CoolantScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == game.getplayer()
		MS19.Setstage(150)
	endif
EndEvent

Quest Property MS19 Auto Const
