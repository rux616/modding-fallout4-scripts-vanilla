Scriptname damageHoldUpPoisonSCRIPT extends ActiveMagicEffect

keyword property AnimFlavorHandsup auto 
ReferenceAlias property VictimAlias auto
RefCollectionALias property victimAliasCollection auto
;quest property testHoldupQuest auto
scene property pHoldupScene auto
float distanceFromPlayer
actorValue property pHoldupAV auto
actorValue property pHoldupCommandAV auto
actorValue property pHoldupFleeAV auto
actorValue property Assistance auto
actorValue property Morality auto
actor victimActor 
magiceffect property pHoldupEffect auto
globalvariable property holdupDistanceGlobal auto
quest property holdupquest auto
;faction property holdupFaction auto
;faction property holdupFactionHostile auto



Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.stopCombat()

	distancefromplayer = game.getPlayer().getDistance(akTarget) 
	victimActor = aktarget
	pHoldupScene.start()
	akTarget.SetValue(Game.GetAggressionAV(), 0)
	akTarget.SetValue(Morality, 0)
	akTarget.createDetectionEvent(game.getplayer(), 25)
	utility.wait(1)
    akTarget.changeAnimFlavor(AnimFlavorHandsup)
    ;aktarget.SetAnimArchetypeNervous()
    VictimAliasCollection.addRef(akTarget)
    VictimAlias.ForceRefto(akTarget)
	akTarget.SetValue(pHoldupAV, 1)
	akTarget.createDetectionEvent(game.getplayer(), 25)
	;akTarget.SetPlayerTeammate(true)
	akTarget.EvaluatePackage()
		while victimActor.HasMagicEffect(pHoldupEffect)
			distancefromplayer = game.getPlayer().getDistance(akTarget) 
			if game.getPlayer().IsWeaponDrawn() == 0 ;|| game.getplayer().hasDirectLOS(akTarget) == false
				 	self.dispel()
			endif
			if distancefromplayer > holdupDistanceGlobal.getValue() 
				if victimActor.getValue(pHoldupCommandAV) != 1 && akTarget.getValue(pHoldupFleeAV) != 1
					self.dispel()
				endif
			endif
		endwhile
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if aeCombatState == 1 && victimActor.getValue(pHoldupCommandAV) != 1  && aktarget != game.getPlayer()
    	if akTarget.getValue(pHoldupFleeAV) != 1
    		self.dispel()
    	endif
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	VictimAliasCollection.RemoveRef(akTarget)
	holdupquest.resetSpeechChallenges()
	VictimAlias.Clear()
	akTarget.changeAnimFlavor()
	aktarget.SetAnimArchetypeIrritated()
	akTarget.SetValue(pHoldupAV, 0)
	aktarget.SetValue(pHoldupCommandAV, 0)
	aktarget.SetValue(pHoldupFleeAV, 0)
	akTarget.SetValue(Game.GetAggressionAV(), 2)
	akTarget.SetValue(Assistance, 2)
	aktarget.SetValue(Morality, 3)
	if aktarget.getValue(pHoldupCommandAV) == 1
		akTarget.SetCanDoCommand(false)
	endif
	akTarget.EvaluatePackage()
	;game.getPlayer().createDetectionEvent(game.getplayer(), )
EndEvent