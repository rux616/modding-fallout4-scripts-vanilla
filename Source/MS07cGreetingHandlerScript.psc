Scriptname MS07cGreetingHandlerScript extends Quest Conditional

Quest Property pMS07c Auto Const
Quest Property pMS07cGreetingHandler Auto Const
GlobalVariable Property MS07cNickGreetingGlobal Auto Const
ReferenceAlias Property Nick Auto Const
GlobalVariable Property NickOfferGlobal Auto Const

Function StartGreetingTimer()
	StartTimerGameTime(NickOfferGlobal.GetValue(), 333)
EndFunction

Function CancelGreetingTimer()
	CancelTimerGameTime(333)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, if player hasn't already accepted Nick's MS07c quest, let it become available again
	;debug.messagebox("OnTimer fired")
	if iTimer == 333
		;debug.messagebox("Timer has correct ID")
		if !pMS07c.GetStageDone(10)
			;debug.messagebox("Stage 280 not set")
			MS07cNickGreetingGlobal.SetValue(0)
			Nick.GetActorRef().EvaluatePackage()
		endif
	endif
EndEvent
