Scriptname holdupEffectScript extends ActiveMagicEffect
;Script attached to an actor through an effect that is applied when the player holds up an actor using the perk "Put 'Em Up"
;This script manages changing actor variables for the effect and checking for conditions which should dispel the effect.


keyword property AnimFlavorHandsup auto mandatory
ReferenceAlias property VictimAlias auto mandatory
RefCollectionALias property victimAliasCollection auto mandatory
;quest property HoldupQuest auto
scene property holdupScene auto mandatory
actorValue property HoldupAV auto mandatory
actorValue property HoldupCommandAV auto mandatory
actorValue property HoldupFleeAV auto mandatory
actorValue property HoldupFrenzyAV auto mandatory
actorValue property Assistance auto mandatory
actorValue property Morality auto mandatory
actorValue property HoldupImmuneAV auto mandatory
actorValue Property IgnorePlayerWhileFrenzied auto mandatory
int startingMorality
int startingAssistance
int startingAggression
int startingConfidence
actor victimActor 
magiceffect property holdupEffect auto mandatory
globalvariable property holdupDistanceGlobal auto mandatory
globalvariable property holdupBreakDistanceGlobal_Ext auto mandatory
quest property holdupquest auto mandatory
message property holdupMessagePacifySuccess auto mandatory
message property holdupMessagePacifyFailure auto mandatory
float property IntimidateBase auto mandatory
float property IntimidateMult auto mandatory
float property MaxChance auto mandatory
float property MinChance auto mandatory
keyword property ActorTypeNPC auto mandatory
perk property blackwidow02 auto mandatory
perk property blackwidow03 auto mandatory
perk property ladykiller02 auto mandatory
perk property ladykiller03 auto mandatory
float perkBonus = 0.0
globalvariable property pacifyChance auto mandatory
globalvariable property blackWidow02HoldupBonus auto mandatory
globalvariable property blackWidow03HoldupBonus auto mandatory
spell property holdupDispelSpell auto mandatory
string Property CharismaSwfName Auto const
Sound Property UISpeechChallengePass Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
		;***Add victim to alias so I can play player scene
		VictimAliasCollection.addRef(akTarget)
	    VictimAlias.ForceRefto(akTarget)
	    ;***Play player line and victim response***
	    holdupScene.stop()
		holdupScene.start()
	;***When the player holds up victim actor, effect is applied after checking a formula based on the player's level vs the victim's level***
	getperkBonus()
	;pacifyChance = IntimidateBase + perkBonus + (IntimidateMult *  game.getPlayer().getLevel() as float / akTarget.getLevel() as float) * 100
	;if pacifyChance > MaxChance
	;	pacifyChance = MaxChance
	;elseif pacifyChance < MinChance
	;	pacifyChance = MinChance
	;endif	
	if utility.randomFloat(0.0, 100.0) + perkBonus < pacifyChance.getValue()
		victimActor = aktarget
		akTarget.SetValue(HoldupAV, 1)
		Game.IncrementStat("Holdups", 1)
		Game.ShowPerkVaultBoyOnHUD(CharismaSwfName, UISpeechChallengePass)
		;***Store actor variables that this effect will change
		startingAssistance = akTarget.GetValue(Assistance) as int
		startingConfidence = akTarget.GetValue(Game.GetConfidenceAV()) as int
		startingAggression = akTarget.GetValue(Game.GetAggressionAV()) as int
		;***Make victim unaggressive and make them not care about crime***
		akTarget.SetValue(Game.GetAggressionAV(), -1)
		;akTarget.SetValue(Morality, 0)
		akTarget.SetValue(Assistance, 0)
		;***Send an assault alarm and detection event so nearby actors can react. Then stop combat on victim actor.***
		akTarget.enableAI(False)
		akTarget.createDetectionEvent(game.getplayer(), 66)
		akTarget.sendAssaultAlarm()
		akTarget.stopCombat()
		akTarget.enableAI()
		;***Put Actor in Animation flavor state, causes them to raise arms***
	    akTarget.changeAnimFlavor(AnimFlavorHandsup)
		akTarget.EvaluatePackage()
		;***Registering for all events that can break the holdup state
		;RegisterForDetectionLOSLost(Game.GetPlayer(), victimActor)
		RegisterForDistanceGreaterThanEvent(Game.GetPlayer(), victimActor, holdupBreakDistanceGlobal_Ext.getValue())
		RegisterForAnimationEvent(Game.GetPlayer(), "weaponSheathe")
		RegisterForHitEvent(akTarget, game.getPlayer(), abMatch = true)
		RegisterForPlayerTeleport()
	elseif akTarget.getValue(HoldupAV) == 0
		self.dispel()
		holdupMessagePacifyFailure.show()
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;dispel effect if the player sheathes their weapon
    if victimActor.getValue(HoldupFrenzyAV) !=1
	    if (akSource == game.getPlayer()) && (asEventName == "weaponSheathe") && victimActor.getValue(HoldupFrenzyAV) !=1
	    	self.dispel()
	    	debug.trace("dispelling due to weapon sheathe")
		endif
	endif
EndEvent

;Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
	;When player's Line of Sight is broken with the victim. 
;	if victimActor.getValue(HoldupFrenzyAV) !=1 && victimActor.getValue(HoldupCommandAV) !=1
;    	self.dispel()
;    	debug.trace("dispelling due to Lost LOS")
;    endif
;EndEvent

Event onDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;When the player leaves the holdup distance range from the victim, dispel. Do not dispel outright if actor is fleeing or in command mode.
	    if victimActor.getValue(HoldupCommandAV) != 1 && victimActor.getValue(HoldupFrenzyAV) !=1
	    	;if the victim is in an exterior location, dispel the effect. If in an interior, do not dispel. 
	    	if victimactor.isininterior() == false
    			self.dispel()
    			debug.trace("dispelling due to distance check")
    		endif
    	endif
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	;***If actor enters combat and is not in command  or frenzy mode, dispel effect
	;***If actor is in command mode, only combat with the player will dispel effect
    if aeCombatState == 1 && victimActor.GetValue(HoldupAV) == 1
    	if victimActor.getValue(HoldupFrenzyAV) != 1 && victimActor.getValue(HoldupCommandAV) !=1
    		debug.trace("dispelling due to entering combat, not frenzied or commanded")
    		self.dispel()
    	elseif victimActor.getValue(HoldupCommandAV) == 1  && aktarget == game.getPlayer()
    		debug.trace("dispelling due to player attack in command mode")
    		self.dispel()
    	endif
    endif
EndEvent

Event onHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;Dispel if the player hits the target actor, unless they are frenzied
	if akAggressor == game.getPlayer() && victimActor.getValue(HoldupFrenzyAV) != 1
		debug.trace("dispelling due to player hit")
		self.dispel()
	elseif victimActor.GetValue(HoldupCommandAV) !=1 && victimActor.getValue(HoldupFrenzyAV) != 1
		self.dispel()
	endif
EndEvent

Event onPickpocketFailed()
	;If the player gets caught pickpocketing the victim actor, dispel the effect.
	self.dispel()
EndEvent

Event onPlayerTeleport()
	;If the player goes through a load door, fast travels, or is moved; dispel the effect.
	self.dispel()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;remove all effects and reset actor values upon dispel
	debug.trace("Holdup onEffectFinish block ran")
	if aktarget.getValue(HoldupAV) == 1
		holdupquest.resetSpeechChallenges()
		if aktarget.getValue(HoldupCommandAV) == 1
			akTarget.SetCanDoCommand(false)
		endif
		if akTarget.getValue(HoldupFrenzyAV) == 1
			akTarget.SetValue(IgnorePlayerWhileFrenzied, 0)
		endif
		akTarget.changeAnimFlavor()
		akTarget.SetValue(HoldupAV, 0)
		aktarget.SetValue(HoldupCommandAV, 0)
		aktarget.SetValue(HoldupFrenzyAV, 0)
		akTarget.SetValue(Game.GetAggressionAV(), startingAggression)
		akTarget.SetValue(Game.GetConfidenceAV(), startingConfidence)
		akTarget.SetValue(Assistance, startingAssistance)
		akTarget.EvaluatePackage()
	endif
	akTarget.AddSpell(holdupDispelSpell, false)
	VictimAlias.Clear()
	VictimAliasCollection.RemoveRef(akTarget)
	game.getPlayer().createDetectionEvent(game.getplayer(), 66)
	akTarget.sendAssaultAlarm()
EndEvent

function getperkBonus()
	;***Check to see if player has Black Widow or Lady Killer at the appropirate rank and check gender of the target to determine if there is a bonus to the pacify chance
	if getTargetActor().hasKeyword(ActorTypeNPC)
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