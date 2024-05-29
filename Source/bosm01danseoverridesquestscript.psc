Scriptname BoSM01DanseOverridesQuestScript Extends Quest Hidden Const
{Script to handle Danse's Overrides for BoSM01.}

ReferenceAlias property BoSPaladinDanse Auto Const Mandatory
ReferenceAlias property FollowersQuestCompanion Auto Const Mandatory

Function BeginDanseScene()
	Actor Danse = BoSPaladinDanse.GetActorRef()
	if (FollowersQuestCompanion.GetActorRef() == Danse)
	     Danse.SetCanDoCommand(False)
	     FollowersScript.SetAutonomy(Self, False)
	     StartTimer(300) ;Failsafe
	EndIf
EndFunction

Function EndDanseScene()
	Actor Danse = BoSPaladinDanse.GetActorRef()
	if (FollowersQuestCompanion.GetActorRef() == Danse)
	     Danse.SetCanDoCommand(True)
	     StartTimer(5) ;Failsafe
	EndIf
EndFunction

Event OnTimer(int timerID)
	Debug.Trace("Timer Release")
	BoSPaladinDanse.GetActorRef().SetCanDoCommand(True)
	FollowersScript.SetAutonomy(Self, True)
EndEvent