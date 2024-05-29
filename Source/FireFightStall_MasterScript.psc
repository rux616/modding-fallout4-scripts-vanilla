Scriptname FireFightStall_MasterScript extends ObjectReference


Group DefaultValues
	float Property TimerCheck = 45.0 auto Const
	;Timer length. How long until the script allows damage to actors regardless if the player has met another check.
	float Property DistanceCheck = 0.0 auto
	;Distance from this Master Marker that the player must be within to ENABLE the actors associated with it.
	Keyword Property LinkCombatStall_Melee auto Const
	;Keyword identifying linked, disabled, Melee users or Enable Marker that enables them.

endGroup

Group NonEditValues CollapsedOnRef
	bool Property RegisteredForDistance = false auto
	;Has a Distance event been registered for.
	bool Property MeleeEnabled = false auto
	;Have the melee actors been enabled yet.
	bool Property TimerSet = false auto
	;Dynamic, doesn't need to be set. For checking if actors are set to be disabled at start.

	int Property LocalAssistedVar auto
	int Property LocalDeathsVar auto
	int Property LocalKillsVar auto
endGroup

Group StatTracking CollapsedOnRef
	Quest Property TrackingQuest auto Const
	FireFightStall_QuestScript Property FireFightStall_Quest auto
	{GlobalVar Array on QuestScript
	0 == Assisted variable
	1 == Deaths variable
	2 == Kills variable}

	Scene Property IntroScene auto

endGroup

CustomEvent StartDamage
CustomEvent RemoteEnable

Event OnLoad()
	if TrackingQuest.IsRunning() == False && TrackingQuest != none
		TrackingQuest.Start()
		FireFightStall_Quest = TrackingQuest as FireFightStall_QuestScript

	endif

endEvent


Event OnUnload()

	;debug.trace("Canceling CombatStall_Master script timer on Unload")

	if TrackingQuest.GetStage() == 199
		TrackingQuest.Stop()
		UnRegisterForDistanceEvents(Game.GetPlayer(), self)
		debug.trace("Stopping Quest, unregistering checks.")

	endif 

	;Not using currently, will revisit if we decide to make this script reusable.

	;if TrackingQuest != none

		;if TrackingQuest.IsRunning()

		;	(FireFightStall_Quest.FireFightStallGlobals[0] as GlobalVariable).SetValue(LocalAssistedVar)
		;	(FireFightStall_Quest.FireFightStallGlobals[1] as GlobalVariable).SetValue(LocalDeathsVar)
		;	(FireFightStall_Quest.FireFightStallGlobals[2] as GlobalVariable).SetValue(LocalKillsVar)
		;	debug.trace("Storing Globals..")

		;endif

	;endif

endEvent


Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)

	if IsDisabled()
		debug.trace("Sending RemoteEnable event")
		SendCustomEvent("RemoteEnable")

	else
		;Not using currently, will revisit if we decide to make this script reusable.

		;(FireFightStall_Quest.FireFightStallGlobals[0] as GlobalVariable).SetValue(LocalAssistedVar)
		;(FireFightStall_Quest.FireFightStallGlobals[1] as GlobalVariable).SetValue(LocalDeathsVar)
		;(FireFightStall_Quest.FireFightStallGlobals[2] as GlobalVariable).SetValue(LocalKillsVar)
		;debug.trace("Storing Globals..")
		;RegisterDistanceGreaterThan()


	endif

endEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)

	;Not using currently, will revisit if we decide to make this script reusable.

	;if TrackingQuest != none && TrackingQuest.IsRunning()

		;LocalAssistedVar = (FireFightStall_Quest.FireFightStallGlobals[0] as GlobalVariable).GetValueInt()
		;LocalDeathsVar = (FireFightStall_Quest.FireFightStallGlobals[1] as GlobalVariable).GetValueInt()
		;LocalKillsVar = (FireFightStall_Quest.FireFightStallGlobals[2] as GlobalVariable).GetValueInt()

		;debug.trace("Retrieving Globals..")
		;RegisterForDistanceLessThanEvent(Game.GetPlayer(), self, 3072)

	;endif

endEvent

Function TimerStart()


		TimerSet = True
		;debug.trace("Setting timer at " + TimerCheck + " seconds.")
		StartTimer(TimerCheck, 0)


endFunction


Event OnTimer(int aiTimerID)

	;debug.trace("Ding! Timer " + aiTimerID + " hit.")

	if aiTimerID == 0
		DamageStart()

	endif

endEvent

Event Actor.OnDying(Actor akSender, Actor akKiller)


	Actor Player = Game.GetPlayer()

	GlobalVariable AlliesDied = (FireFightStall_Quest.FireFightStallGlobals[1])
	GlobalVariable KilledByPlayer = (FireFightStall_Quest.FireFightStallGlobals[2])
	defaultCounterQuestA defaultCounterScript = TrackingQuest as defaultCounterQuestA
	FireFightStall_ActorScript FireFightStall_Actor = akSender as FireFightStall_ActorScript

	bool Ally = FireFightStall_Actor.Ally

	UnregisterHitEvents(AkSender)

	if TrackingQuest != none && akKiller == Player && !Ally && TrackingQuest.IsRunning()
		;debug.trace("Player killed " + self + " and we care.")
		KilledByPlayer.SetValue(KilledByPlayer.GetValue() + 1)

	elseif TrackingQuest != none && Ally && akKiller != Player && TrackingQuest.IsRunning()
		;debug.trace("Player ally died.")
		AlliesDied.SetValue(AlliesDied.GetValue() + 1)

		elseif akKiller == Player
			;Do nothing, for now.

	endif

	if TrackingQuest != none && !Ally && TrackingQuest.IsRunning()
		defaultCounterScript.Increment()

	endif

EndEvent


Function RegisterRemoteEventOnDeath(Actor ActorRef = none)

	RegisterForRemoteEvent(ActorRef, "OnDying")

endFunction


Function RegisterDistanceLessThan()

	if !RegisteredForDistance && DistanceCheck != 0.0
		;debug.trace("Registering Master script for remoteEnable distance check.")
		RegisterForDistanceLessThanEvent(Game.GetPlayer(), self, DistanceCheck)
		RegisteredForDistance = True

	endif

endFunction


Function RegisterDistanceGreaterThan()

	;debug.trace("Registering for Greater than Distance check.")
	RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), 4096)
	;Registers to see if the player is far enough away that we should store the globalvar info locally
	;So that the globalvars can be used by other scenarios with this script.}

endFunction


Function UnregisterStartDamageEvents(Actor ActorRef = none)

	if !ActorRef.IsDisabled() || !ActorRef.IsGhost()
		;debug.trace("Unregistering LOS and DistanceEvents")
		ActorRef.UnRegisterForLOS(Game.GetPlayer(), ActorRef)
		ActorRef.UnRegisterForDistanceEvents(Game.GetPlayer(), ActorRef)

	endif

endFunction


Function UnregisterHitEvents(Actor ActorRef = none)

	if ActorRef.IsDead() && TrackingQuest != none
		;debug.trace("Unregistering OnHit on " + ActorRef)
		ActorRef.UnregisterForHitEvent(ActorRef, Game.GetPlayer())
	endif

endFunction


Function DamageStart()

	SendCustomEvent("StartDamage")

	if TrackingQuest.IsRunning()
		IntroScene.Start()

	endif

	;debug.trace("Canceling CombatStall_Master script timer on DamageStart")

	if GetLinkedRef(LinkCombatStall_Melee) != none && MeleeEnabled == False
		;Debug.trace("Enabling disabled melee")
		MeleeEnabled = True
		ObjectReference[] LinkedRefs = GetLinkedRefChain(LinkCombatStall_Melee)

		int i = 0
		while i < LinkedRefs.length
			LinkedRefs[i].Enable(False)
			i += 1

		endWhile

	else
		if MeleeEnabled == False
			;Debug.trace("No LinkedRef with keyword LinkCombatStall_Melee")

		else
			;Debug.trace("Melee enabled already")

		endif

	endif

endFunction




