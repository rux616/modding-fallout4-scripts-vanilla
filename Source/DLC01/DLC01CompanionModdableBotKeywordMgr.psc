Scriptname DLC01:DLC01CompanionModdableBotKeywordMgr extends Quest

keyword Property DLC01ModdableBot const auto mandatory
{autofill}

actor Property CurieRef const auto mandatory
{autofill}

actor Property Codsworth1Ref const auto mandatory
{autofill}

FollowersScript Property Followers const auto mandatory
{autofill}

bool CodsworthHasKeyword

Event OnInit()
	debug.trace(self + "OnInit()")

	RegisterForCustomEvent(Followers, "CompanionChange") ;for codsworth
	
    CurieRef.addkeyword(DLC01ModdableBot)
EndEvent


Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)
	Actor ActorThatChanged = akArgs[0] as actor
	bool IsNowCompanion = akArgs[1] as bool

	debug.trace(self + "FollowersScript.CompanionChange() ActorThatChanged: " + ActorThatChanged + ", IsNowCompanion: " + IsNowCompanion)

	if CodsworthHasKeyword == false && ActorThatChanged == Codsworth1Ref && IsNowCompanion
		Codsworth1Ref.addkeyword(DLC01ModdableBot)

		CodsworthHasKeyword = true

	endif

EndEvent
