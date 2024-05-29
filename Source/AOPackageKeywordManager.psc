Scriptname AOPackageKeywordManager extends Package Const
{Adds a keyword on package start, removes it on package change}

keyword Property keywordToAdd const auto
{OnStart add this keyword, OnChange, remove it.}

Event OnStart(Actor akActor)
	akActor.AddKeyword(keywordToAdd)
EndEvent


Event OnChange(Actor akActor)
	akActor.RemoveKeyword(keywordToAdd)
EndEvent