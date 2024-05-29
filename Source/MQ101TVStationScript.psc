Scriptname MQ101TVStationScript extends Quest

ReferenceAlias Property PlayerTV Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If akSource == PlayerTV.GetRef() && asEventName == "comEnd"
		SetStage(5)
		UnregisterForAnimationEvent(akSource, asEventName)
	EndIf
EndEvent

Function PlayWeatherLine01()
	PlayerTV.GetRef().PlayAnimation("LineWeather")
EndFunction

Function PlayWeatherLine02()
	PlayerTV.GetRef().PlayAnimation("LineColdFront")
EndFunction

Function PlayWeatherLine03()
	PlayerTV.GetRef().PlayAnimation("LineTemp52")
EndFunction

Function PlayRantLine01()
	PlayerTV.GetRef().PlayAnimation("LineOverseas")
EndFunction

Function PlayRantLine02()
	PlayerTV.GetRef().PlayAnimation("LineJamboree")
EndFunction

Function PlayRantLine03()
	PlayerTV.GetRef().PlayAnimation("LineHellcats")
EndFunction

Function PlaySportsLine01()
	PlayerTV.GetRef().PlayAnimation("LineSports")
EndFunction

Function PlaySportsLine02()
	PlayerTV.GetRef().PlayAnimation("LineBaseball")
EndFunction

Function PlaySportsLine03()
	PlayerTV.GetRef().PlayAnimation("LineSultans")
EndFunction

Function PlaySportsLine04()
	PlayerTV.GetRef().PlayAnimation("Line1918")
EndFunction

Function PlayNewsLine01()
	PlayerTV.GetRef().PlayAnimation("LineChina")
EndFunction

Function PlayNewsLine02()
	PlayerTV.GetRef().PlayAnimation("LineStalemate")
EndFunction

Function PlayNewsLine03()
	PlayerTV.GetRef().PlayAnimation("LineDiplomacy")
EndFunction

Function PlayNukeLine01()
	PlayerTV.GetRef().PlayAnimation("LineLost")
EndFunction

Function PlayNukeLine02()
	PlayerTV.GetRef().PlayAnimation("LineConfirmed")
EndFunction

Function PlayNukeLine03()
	PlayerTV.GetRef().PlayAnimation("LineOhGod")
EndFunction

