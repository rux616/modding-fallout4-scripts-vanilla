Scriptname DNPOI_ActivateLinkedRefOnDeath extends Actor Hidden

Keyword property LinkKeyword Auto Const
float property delay Auto Const

Event OnDeath(Actor akKiller)
	StartTimer(delay)
EndEvent

Event OnTimer(int timerID)
	Self.GetLinkedRef(LinkKeyword).Activate(Self)
EndEvent