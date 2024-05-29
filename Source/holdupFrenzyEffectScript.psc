Scriptname holdupFrenzyEffectScript extends ActiveMagicEffect

actor victimActor 
actorValue property HoldupFrenzyAV auto mandatory
actorValue Property IgnorePlayerWhileFrenzied auto mandatory
message property holdupMessageInciteSuccess auto mandatory
message property holdupMessageInciteFailure auto mandatory
scene property holdupInciteScene auto mandatory
ReferenceAlias property FrenzyVictimAlias auto mandatory
float property FrenzyChance auto mandatory
keyword property ActorTypeNPC auto mandatory
perk property blackwidow02 auto mandatory
perk property blackwidow03 auto mandatory
perk property ladykiller02 auto mandatory
perk property ladykiller03 auto mandatory
spell property holdupDispelSpell auto mandatory
float perkBonus = 0.0
globalvariable property blackWidow02HoldupBonus auto mandatory
globalvariable property blackWidow03HoldupBonus auto mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrenzyVictimAlias.ForceRefto(akTarget)
	;***Play player line and victim response***
    holdupInciteScene.stop()
	holdupInciteScene.start()
	getperkBonus()
	if utility.randomFloat(0.0, 100.0) + perkBonus < FrenzyChance
		victimActor = akTarget
		victimActor.SetValue(Game.GetAggressionAV(), 3)
		victimActor.SetValue(Game.GetConfidenceAV(), 4)
		victimActor.SetValue(IgnorePlayerWhileFrenzied, 1)
		victimActor.SetValue(HoldupFrenzyAV, 1)
		victimActor.evaluatePackage()
	else 
		self.dispel()
		akTarget.AddSpell(holdupDispelSpell, false)
		holdupMessageInciteFailure.show()
	endif
EndEvent

Event onEffectFinish(Actor akTarget, Actor akCaster)
	
endEvent

function getperkBonus()
	;***Check to see if player has Black Widow or Lady Killer at the appropirate rank and check gender of the target to determine if there is a bonus to the pacify chance
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
	else
		perkBonus = 0.0
	endif
endFunction