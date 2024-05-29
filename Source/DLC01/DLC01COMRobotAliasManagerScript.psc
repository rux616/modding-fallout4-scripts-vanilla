Scriptname DLC01:DLC01COMRobotAliasManagerScript extends Quest
{handles forcing current robot companion into proper aliases based on voice type after it's modified at a workbench}

Actor PlayerRef

struct AliasVoiceTypeDatum
	ReferenceAlias AliasToFill
{Fill this alias}

	VoiceType VoiceTypeRequired
{If bot has this voicetype, shove it into AliasToFill}
endstruct


Faction Property CurrentCompanionFaction const auto mandatory
{autofill}

AliasVoiceTypeDatum[] Property AliasVoiceTypeData const auto
{Data for what alias to shove into based on what voicetype.}

Event OnInit()
    PlayerRef = Game.GetPlayer()

    RegisterForRemoteEvent(PlayerRef, "OnPlayerModRobot")

EndEvent

Event Actor.OnPlayerModRobot(Actor akSender, Actor akRobot, ObjectMod akModBaseObject)
	;Assume akSender is the player

	debug.trace(self + "OnPlayerModRobot() akRobot: " + akRobot + ", akModBaseObject:" + akModBaseObject)

	;check if it's currently a companion
	if akRobot.IsInFaction(CurrentCompanionFaction)

		VoiceType VoicetypeToFind = akRobot.GetVoiceType()

		int iFound = 0
		int iMax = AliasVoiceTypeData.length
		while (iFound > -1 && iFound < iMax)
			
			;returns negative value if not found
			iFound = AliasVoiceTypeData.FindStruct("VoiceTypeRequired", VoicetypeToFind, iFound)

			if iFound > -1
				ReferenceAlias refAlias = AliasVoiceTypeData[iFound].AliasToFill
				debug.trace(self + "iFound: " + iFound)
				debug.trace(self + "OnPlayerModRobot() forcing refalias: " + refAlias + " to actor:" + akRobot)

				refAlias.ForceRefTo(akRobot)

				iFound += 1
			endif
		
		endwhile

	endif


EndEvent
