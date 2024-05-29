Scriptname RR102Script extends Quest Conditional

Int Property bDeaconTalkedTo Auto Conditional
Int Property bAskedAboutDezJoining Auto Conditional

MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RR102Script Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(1100)                   ; Fail the quest
	endif

EndEvent

Int Property bDeaconKnowsNothing Auto Conditional

Int Property bNoToSynthFreedom Auto Conditional

Int Property bNoToAgainstInstitute Auto Conditional

Int Property bNotInterestedInRailroad Auto Conditional

Int Property bDeaconMentionsSwitchboard Auto Conditional

Int Property bInsideSecretTunnel Auto Conditional

Int Property bDeaconSeesTourist Auto Conditional
