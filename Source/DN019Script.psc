Scriptname DN019Script extends Quest Conditional

function SetCultistHostility(bool bMakeHostile)
	if bMakeHostile
		; make enemy
		DN019CultistFaction.SetEnemy(PlayerFaction)
	else
		; make neutral
		DN019CultistFaction.SetEnemy(PlayerFaction, true, true)
	endif
endFunction

function ResetLocation()
	; reset encounter zone
	CharlesViewAmphitheaterZone.Reset()

	; clear hostility
	SetCultistHostility(false)
	
	; reset join cult quest
	DN019JoinCult.Stop()
	DN019JoinCult.Start()

endFunction

Bool Property PlayerJoinedCult Auto Conditional
{true = player has joined the cult}

Bool Property PlayerTalkedToLeader Auto Conditional
{true = player has talked to cult leader}

Bool Property PlayerAskedAboutEmogene Auto Conditional
{true = player has asked about Emogene in current conversation}

Bool Property PlayerKilledLeader Auto Conditional
{true = player has killed the cult leader (at least once...)}

Bool Property PlayerAllowedEmogeneRoom Auto Conditional
{true = player is allowed into the locked room}

Bool Property AttackOnWalkaway Auto Conditional
{true = player will be attacked if he tries to walk away from conversation}

Faction Property DN019CultistFaction Auto Const
Faction Property PlayerFaction Auto Const

EncounterZone Property CharlesViewAmphitheaterZone Auto Const

Quest Property DN019JoinCult Auto Const
