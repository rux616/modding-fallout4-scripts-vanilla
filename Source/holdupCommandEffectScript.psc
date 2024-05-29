Scriptname holdupCommandEffectScript extends ActiveMagicEffect


actor victimActor 
actorValue property HoldupCommandAV auto mandatory
actorValue property morality auto mandatory
actorValue Property IgnorePlayerWhileFrenzied auto mandatory
message property holdupMessageCommandSuccess auto mandatory
message property holdupMessageCommandFailure auto mandatory
scene property holdupCommandScene auto mandatory
ReferenceAlias property CommandVictimAlias auto mandatory
float property CommandChance auto mandatory
keyword property ActorTypeNPC auto mandatory
perk property blackwidow02 auto mandatory
perk property blackwidow03 auto mandatory
perk property ladykiller02 auto mandatory
perk property ladykiller03 auto mandatory
spell property holdupDispelSpell auto mandatory
float perkBonus = 0.0
globalvariable property blackWidow02HoldupBonus auto mandatory
globalvariable property blackWidow03HoldupBonus auto mandatory
int startingMorality
keyword property TeammateDontUseAmmoKeyword auto mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
    if CommandVictimAlias.getReference().getValue(HoldupCommandAV) == 1 && CommandVictimAlias.getReference() != None
         CommandVictimAlias.getActorReference().AddSpell(holdupDispelSpell, false)
         CommandVictimAlias.Clear()
    endif
	CommandVictimAlias.ForceRefto(akTarget)
    ;***Play player line and victim response***
    holdupCommandScene.stop()
	holdupCommandScene.start()
	getperkBonus()
	if utility.randomFloat(0.0, 100.0) + perkBonus < CommandChance
		victimActor = akTarget
	    victimActor.setcandocommand()
	    victimActor.SetCommandState(true)
		victimActor.changeAnimFlavor()
		victimActor.setplayerTeammate(true)
		victimActor.AddKeyword(TeammateDontUseAmmoKeyword)
		startingMorality = akTarget.GetValue(Morality) as int
		akTarget.SetValue(Morality, 0)
		victimActor.SetValue(HoldupCommandAV, 1 )
		victimActor.EvaluatePackage()

	else
		self.dispel()
		akTarget.AddSpell(holdupDispelSpell, false)
		holdupMessageCommandFailure.show()
	endif
EndEvent

Event onEffectFinish(Actor akTarget, Actor akCaster)
		akTarget.SetValue(Morality, startingMorality)
		akTarget.SetCanDoCommand(false)
		victimActor.SetCommandState(false)
		victimActor.setplayerTeammate(false)
		victimActor.RemoveKeyword(TeammateDontUseAmmoKeyword)
endEvent

function getperkBonus()
	;***Check to see if player has Black Widow or Lady Killer at the appropriate rank and check gender of the target to determine if there is a bonus to the pacify chance
	if victimActor.hasKeyword(ActorTypeNPC)
		if game.getplayer().hasperk(blackwidow02) && victimActor.getActorBase().getSex() ==0 
			if game.getplayer().hasperk(blackwidow03)
				perkBonus == blackWidow03HoldupBonus.getValue()
			else
				perkBonus == blackWidow02HoldupBonus.getValue()
			endif
		endif
		if game.getplayer().hasperk(ladykiller02) && victimActor.getActorBase().getSex() == 1
			if game.getplayer().hasperk(blackwidow03)
				perkBonus == blackWidow03HoldupBonus.getValue()
			else
				perkBonus == blackWidow02HoldupBonus.getValue()
			endif
		endif
	endif
endFunction