Scriptname MQ102CodsworthScript extends ReferenceAlias

int doOnce

Event OnAliasInit()
	If doOnce == 0
		doOnce = 1
		Self.GetActorRef().IgnoreFriendlyHits()
	EndIf
EndEvent