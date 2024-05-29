Scriptname DNPrime_DismemberBehemoth extends Actor
{Prime plays a paired anim with a behemoth and explodes his head}

Bool DoOnce = FALSE
Event OnLoad()
    RegisterForAnimationEvent(self, "HeadExplode")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
  if (akSource == self) && (asEventName == "HeadExplode")
  	DoOnce = TRUE
  endIf
endEvent

Event OnDying(Actor akKiller)
	if(DoOnce == TRUE)
    	;debug.notification("boom")
		Dismember("Head1", TRUE, FALSE)
	endIf
EndEvent