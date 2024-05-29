Scriptname FireFightStall_ActorScript extends Actor



Group DefaultValues
	float Property DistanceCheck = 768.0 auto Const
	Keyword Property LinkCombatStall_Master auto Const
	Bool Property Ally auto

endGroup

Group NonEditValues CollapsedOnRef
	FireFightStall_MasterScript Property FireFightStall_Master auto
	bool Property IsMelee = False auto
	bool Property damageStarted = False auto

endGroup

Group StatTracking CollapsedOnRef
	Quest Property TrackingQuest auto Const
	FireFightStall_QuestScript Property FireFightStall_Quest auto
	defaultCounterQuestA Property defaultCounterScript auto
	{GlobalVar Array on QuestScript
	0 == Assisted variable
	1 == Deaths variable
	2 == Kills variable}

endGroup

Event OnInit()

	if !IsDead() && !damageStarted
		;debug.trace("Initialized and not dead, ghosting if not ghosted.")
		FireFightStall_Master = GetLinkedRef(LinkCombatStall_Master) as FireFightStall_MasterScript
		FireFightStall_Master.RegisterRemoteEventOnDeath(self)
		SetGhost()

	endif

endEvent


Event OnLoad()
	Actor Player = Game.GetPlayer()

	if !IsDisabled()

		if !IsDead()
			
			;Debug.Trace("Loaded & Not Dead" + self)
			RegisterForDetectionLOSGain(Player, self)
			RegisterForDistanceLessThanEvent(Player, self, DistanceCheck)
			RegisterForCustomEvent(FireFightStall_Master, "StartDamage")

			FireFightStall_Master.TimerStart()

			if TrackingQuest != none
				FireFightStall_Quest = TrackingQuest as FireFightStall_QuestScript

				if !Ally && TrackingQuest.IsRunning()
					RegisterForHitEvent(self, Player)

				endif

			endif
			;Debug.Trace("Registered for Events")

		endif

	elseif IsDisabled() && IsMelee == False && GetLinkedRef(LinkCombatStall_Master).GetDistance(Player) > 9000
			FireFightStall_Master.RegisterDistanceLessThan()
			debug.trace(self + " registering for Remote Enable.")
			RegisterForCustomEvent(FireFightStall_Master, "RemoteEnable")

		elseif IsMelee == False && GetLinkedRef(LinkCombatStall_Master).GetDistance(Player) <= 9000
				self.EnableNoWait(false)

	endif

endEvent


Event OnUnload()

	;Debug.Trace("Unregistering due to unload")
		;FireFightStall_Master.UnregisterHitEvents(self)
		;FireFightStall_Master.UnregisterStartDamageEvents(self)

endEvent


Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)

	;debug.trace("LOS Check met with " + self)
	FireFightStall_Master.DamageStart()

endEvent


Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)

	;debug.trace("Distance check met with " + self)

	if IsGhost()
		FireFightStall_Master.DamageStart()

	endif


endEvent


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
	bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	Actor Player = Game.GetPlayer()
	;debug.trace("Player is helping, and we care.")
	(FireFightStall_Quest.FireFightStallGlobals[0] as GlobalVariable).SetValue(1)

endEvent


Event FireFightStall_MasterScript.StartDamage(FireFightStall_MasterScript akSender, Var[] akArgs)

	if IsGhost() || IsDisabled()
		Actor Player = Game.GetPlayer()	
		;debug.trace("Starting damage for " + self)
		damageStarted = true;
		SetGhost(False)
		FireFightStall_Master.UnregisterStartDamageEvents(self)
		

	endif

endEvent


Event FireFightStall_MasterScript.RemoteEnable(FireFightStall_MasterScript akSender, Var[] akArgs)

	;debug.trace("RemoteEnable fired, enabling " + self + "via Master script custom event.")
	debug.trace(self + " enabling remotely.")
	self.EnableNoWait(false)

endEvent
