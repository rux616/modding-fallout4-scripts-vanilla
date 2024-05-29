Scriptname RESceneCT04SpawnsScript extends Quest Hidden
{Uses a helper function to spawn creatures for REObjectSC03.}

ReferenceAlias property CenterMarker Auto
{Center marker for the RE}

ActorBase property EncBrahmin Auto
{Brahmin to spawn.}

ActorBase property LvlRadstag Auto
{Radstag to spawn.}

ActorBase property LvlYaoGuai Auto
{YaoGuai to spawn.}

ActorBase property LvlBloatflyAggro1500 Auto
{Bloatfly to spawn.}

ActorBase property LvlBloodbugAggro1500 Auto
{Bloodbug to spawn.}

ActorBase property EncRadRoach Auto
{Radroach to spawn.}

ObjectReference Function SpawnCorpse()
	;33% Brahmin, 33% Radstag, 34% YaoGuai.
	int roll = Utility.RandomInt(1, 3)
	if (roll == 1) ;Brahmin
		return CenterMarker.GetReference().PlaceAtMe(EncBrahmin)
	ElseIf (roll == 2) ;Radstag
		return CenterMarker.GetReference().PlaceAtMe(LvlRadstag)
	ElseIf (roll == 3) ;YaoGuai
		return CenterMarker.GetReference().PlaceAtMe(LvlYaoGuai)
	EndIf
EndFunction

ObjectReference Function SpawnCreature()
	;33% Bloatfly, 33% Bloodbug, 34% Radroach.
	int roll = Utility.RandomInt(1, 3)
	if (roll == 1) ;Bloatfly
		return CenterMarker.GetReference().PlaceAtMe(LvlBloatflyAggro1500)
	ElseIf (roll == 2) ;Bloatfly
		return CenterMarker.GetReference().PlaceAtMe(LvlBloodbugAggro1500)
	ElseIf (roll == 3) ;Stingwing
		return CenterMarker.GetReference().PlaceAtMe(EncRadRoach)
	EndIf
EndFunction