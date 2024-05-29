Scriptname DN158LeakScript extends ObjectReference

int property PhaseNumber = 1 auto
{Which Phase is this leak part of?
	Default = 1}

Sound Property QSTDN158SubLeakLPM  auto
int property mySoundID auto hidden

Quest Property DN158 auto

;This is placeholder for later event
event onActivate(objectReference akActivator)
	StopLeakFX()
	self.Disable()
	objectReference objSelf = self
	(DN158 as DN158QuestScript).LeakFixed(PhaseNumber, objSelf)
endEvent

Function StartLeakFX()
	objectReference objSelf = self as objectReference
	mySoundID = QSTDN158SubLeakLPM.Play(objSelf )

EndFunction

Function StopLeakFX()
	Sound.StopInstance(mySoundID)
EndFunction