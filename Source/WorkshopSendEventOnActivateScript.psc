Scriptname WorkshopSendEventOnActivateScript extends ObjectReference Const
{send a scripted story event on activation}

Keyword Property StoryEvent Auto Const

Event OnActivate(ObjectReference akActionRef)
	; allow activation by anybody
	StoryEvent.SendStoryEvent(GetCurrentLocation(), self)
EndEvent