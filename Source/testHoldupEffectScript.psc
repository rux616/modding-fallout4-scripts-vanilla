Scriptname testHoldupEffectScript extends ActiveMagicEffect

keyword property AnimFlavorHandsup auto 
ReferenceAlias property VictimAlias auto
RefCollectionALias property victimAliasCollection auto
;quest property testHoldupQuest auto
scene property holdupScene auto
float distanceFromPlayer
actorValue property testHoldupAV auto
actorValue property HoldupCommandAV auto
actorValue property HoldupFleeAV auto
actorValue property Assistance auto
actorValue property Morality auto
actor victimActor 
magiceffect property holdupEffect auto
globalvariable property holdupDistanceGlobal auto
quest property holdupquest auto
;faction property holdupFaction auto
;faction property holdupFactionHostile auto



Event OnEffectStart(Actor akTarget, Actor akCaster)
	distancefromplayer = game.getPlayer().getDistance(akTarget) 
	victimActor = aktarget
	holdupScene.start()
	akTarget.SetValue(Game.GetAggressionAV(), 0)
	akTarget.SetValue(Morality, 0)
	akTarget.createDetectionEvent(game.getplayer(), 25)
	utility.wait(1)
    akTarget.changeAnimFlavor(AnimFlavorHandsup)
    ;aktarget.SetAnimArchetypeNervous()
    VictimAliasCollection.addRef(akTarget)
    VictimAlias.ForceRefto(akTarget)
	akTarget.SetValue(testHoldupAV, 1)
	akTarget.createDetectionEvent(game.getplayer(), 25)
	;akTarget.SetPlayerTeammate(true)
	akTarget.EvaluatePackage()
		while victimActor.HasMagicEffect(holdupEffect)
			distancefromplayer = game.getPlayer().getDistance(akTarget) 
			if game.getPlayer().IsWeaponDrawn() == 0 ;|| game.getplayer().hasDirectLOS(akTarget) == false
				 	self.dispel()
			endif
			if distancefromplayer > holdupDistanceGlobal.getValue() 
				if victimActor.getValue(HoldupCommandAV) != 1 && akTarget.getValue(HoldupFleeAV) != 1
					self.dispel()
				endif
			endif
		endwhile
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if aeCombatState == 1 && victimActor.getValue(HoldupCommandAV) != 1  && aktarget != game.getPlayer()
    	if akTarget.getValue(HoldupFleeAV) != 1
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
	akTarget.SetValue(testHoldupAV, 0)
	aktarget.SetValue(HoldupCommandAV, 0)
	aktarget.SetValue(HoldupFleeAV, 0)
	akTarget.SetValue(Game.GetAggressionAV(), 2)
	akTarget.SetValue(Assistance, 2)
	aktarget.SetValue(Morality, 3)
	if aktarget.getValue(HoldupCommandAV) == 1
		akTarget.SetCanDoCommand(false)
	endif
	akTarget.EvaluatePackage()
	;game.getPlayer().createDetectionEvent(game.getplayer(), )
EndEvent

;Event OnCommandModeGiveCommand(int aeCommandType, ObjectReference akTarget)
;	if aeCommandType == 4
;		victimActor.RemoveFromAllFactions()
;		victimActor.SetValue(Game.GetAggressionAV(), 1)
;		victimActor.startCombat(akTarget as actor)
;	endif
;	;victimActor.changeAnimFlavor()
;EndEvent

;Event OnCommandModeEnter()

;	victimActor.SetValue(Assistance, 0)

;EndEvent