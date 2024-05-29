Scriptname RECheckpointQuestScript extends Quest Conditional

ReferenceAlias property Defender01 auto
ReferenceAlias property Defender02 auto
ReferenceAlias property Defender03 auto
ReferenceAlias property Defender04 auto
ReferenceAlias property Defender05 auto
ReferenceAlias property Attacker01 auto
ReferenceAlias property Attacker02 auto
ReferenceAlias property Attacker03 auto
ReferenceAlias property Attacker04 auto
ReferenceAlias property Attacker05 auto
ReferenceAlias Property DefenderReinforcement01 Auto
ReferenceAlias Property DefenderReinforcement02 Auto

RefCollectionAlias property DefenderCollection auto

LocationAlias property CheckpointLocation auto
LocationRefType Property RECheckpointDefender Auto
ActorValue Property RECheckpointRole Auto Const ;0 = Standard defender, 1 = Attacker snadboxing pre assault, 2 = Attackers assaulting, 3 = Temp attacker now becomes defender; 4 = Non-occupying defender dropping into Default master package 
Faction Property RECheckpointOwnerFaction Auto Const
Faction Property RECheckpointFactionFriend Auto Const
Faction Property RECheckpointFactionAttacker Auto Const
Faction Property RECheckpointFactionDefender Auto Const
bool Property bReinforcementsBlocked = false Auto Conditional
bool Property bReinforcementsSpawned = false Auto Conditional
Quest Property myQuest Auto Const
GlobalVariable Property RECheckpointDefsAliveForBackup Auto Const
GlobalVariable Property RECheckpointAttackerDistanceEventTrigger Auto Const
Spell Property RECheckpoint_LessDamage90Spell Auto Const Mandatory

RECheckpointParentScript Property RECheckpointParent Auto Const
{ Optional - only needed for init quests }

Actor Defender01Act
Actor Defender02Act
Actor Defender03Act
Actor Defender04Act
Actor Defender05Act
Actor DefenderReinforcement01Act
Actor DefenderReinforcement02Act

Actor Attacker01Act
Actor Attacker02Act
Actor Attacker03Act
Actor Attacker04Act
Actor Attacker05Act

bool AssaultComplete = false
int DefenderCount = 0
int DefenderDeadCount = 0

;Used for watching deaths of Institute defenders in case we want reinforcements
Function RegisterDefendersForDeathEvents()
		int iDefenders = 0

		while (iDefenders < DefenderCollection.GetCount())
			RegisterForRemoteEvent((DefenderCollection.GetAt(iDefenders) as Actor), "OnDeath")
			iDefenders += 1
		endwhile
EndFunction

;If enough defenders have died, set Reinforcements stage (currently set up only for Institute)
Event Actor.OnDeath(Actor akSender, Actor akKiller)
	int iCount = 0
	int iLivingDefenders = GetLivingDefenderCount()

	;Only trigger reinforcements if assault has started
	if GetStageDone(200)
		while (iCount < DefenderCollection.GetCount())
			if akSender == (DefenderCollection.GetAt(iCount) as Actor) && iLivingDefenders <= RECheckpointDefsAliveForBackup.GetValue()

				myQuest.SetStage(250)

				;If we're spawning a defender, unregister the other defenders for events
				int iUnregisterCount = 0
				while (iUnregisterCount < DefenderCollection.GetCount())
					UnRegisterForRemoteEvent((DefenderCollection.GetAt(iUnregisterCount) as Actor), "OnDeath")
					iUnregisterCount += 1
				endwhile

				return
			else
				iCount += 1
			endif
		endwhile
	endif
EndEvent

;Set up defenders with required actor values/factions
Function InitDefenders(bool bBlockFaction = false)

	if AssaultComplete == true
		return
	endif

	;Populate actor vars
	GetCheckpointDefenders()

	if (Defender01Act != None)
		debug.trace(self + " initializing " + Defender01Act)
		if bBlockFaction == false
			Defender01Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Defender01Act.SetValue(RECheckpointRole, 0)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		debug.trace(self + " initializing " + Defender02Act)
		if bBlockFaction == false
			Defender02Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Defender02Act.SetValue(RECheckpointRole, 0)
		Defender02Act.EvaluatePackage()
	EndIf
	if (Defender03Act != None)
		debug.trace(self + " initializing " + Defender03Act)
		if bBlockFaction == false
			Defender03Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Defender03Act.SetValue(RECheckpointRole, 0)
		Defender03Act.EvaluatePackage()
	EndIf
	if (Defender04Act != None)
		debug.trace(self + " initializing " + Defender04Act)
		if bBlockFaction == false
			Defender04Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Defender04Act.SetValue(RECheckpointRole, 0)
		Defender04Act.EvaluatePackage()
	EndIf
	if (Defender05Act != None)
		debug.trace(self + " initializing " + Defender05Act)
		if bBlockFaction == false
			Defender05Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Defender05Act.SetValue(RECheckpointRole, 0)
		Defender05Act.EvaluatePackage()
	EndIf
EndFunction

;Set up attackers with required actor values
Function InitAttackers()

	if AssaultComplete == true
		return
	endif

	;Populate actor vars
	GetCheckpointDefenders()
	GetCheckpointAttackers()

	;If assault hasn't already begun, put attackers into sandbox packages
	if !GetStageDone(200)
		if (Attacker01Act != None)
			debug.trace(self + " initializing " + Attacker01Act)
			Attacker01Act.SetValue(RECheckpointRole, 1)
			Attacker01Act.EvaluatePackage()
		EndIf
		if (Attacker02Act != None)
			debug.trace(self + " initializing " + Attacker02Act)
			Attacker02Act.SetValue(RECheckpointRole, 1)
			Attacker02Act.EvaluatePackage()
		EndIf
		if (Attacker03Act != None)
			debug.trace(self + " initializing " + Attacker03Act)
			Attacker03Act.SetValue(RECheckpointRole, 1)
			Attacker03Act.EvaluatePackage()
		EndIf
		if (Attacker04Act != None)
			debug.trace(self + " initializing " + Attacker04Act)
			Attacker04Act.SetValue(RECheckpointRole, 1)
			Attacker04Act.EvaluatePackage()
		EndIf
		if (Attacker05Act != None)
			debug.trace(self + " initializing " + Attacker05Act)
			Attacker05Act.SetValue(RECheckpointRole, 1)
			Attacker05Act.EvaluatePackage()
		EndIf
	endif
EndFunction

;Assign the defenders the RECheckpointDefenderLocRef (used to grab the defenders in the attack quests)
Function AssignDefenderLocRef()
	if (Defender01Act != None)
		debug.trace(self + " adding Defender ref type " + Defender01Act)
		Defender01Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Defender02Act != None)
		debug.trace(self + " adding Defender ref type " + Defender02Act)
		Defender02Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Defender03Act != None)
		debug.trace(self + " adding Defender ref type " + Defender03Act)
		Defender03Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Defender04Act != None)
		debug.trace(self + " adding Defender ref type " + Defender04Act)
		Defender04Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Defender05Act != None)
		debug.trace(self + " adding Defender ref type " + Defender05Act)
		Defender05Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
EndFunction

;Assign the attackers the RECheckpointDefenderLocRef (used for encounter where player's faction start as
;attackers then moves in on victory)
Function AssignAttackDefenderLocRef()
	if (Attacker01Act != None)
		debug.trace(self + " adding Defender ref type " + Attacker01Act)
		Attacker01Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " adding Defender ref type " + Attacker02Act)
		Attacker02Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " adding Defender ref type " + Attacker03Act)
		Attacker03Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " adding Defender ref type " + Attacker04Act)
		Attacker04Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " adding Defender ref type " + Attacker05Act)
		Attacker05Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
	EndIf
EndFunction

;If assault hasn't already begun, register attackers for distance events
Function RegisterAttackerDistanceEvent()
	if !GetStageDone(200)

		ObjectReference PlayerRef = Game.GetPlayer()
		float fTriggerDistance = RECheckpointAttackerDistanceEventTrigger.GetValue()

		if (Attacker01Act != None)
			debug.trace(self + " registering attacker " + Attacker01Act + " for distance event.")
			RegisterForDistanceLessThanEvent(PlayerRef, Attacker01Act, fTriggerDistance)
		EndIf
		if (Attacker02Act != None)
			debug.trace(self + " registering attacker " + Attacker02Act + " for distance event.")
			RegisterForDistanceLessThanEvent(PlayerRef, Attacker02Act, fTriggerDistance)
		EndIf
		if (Attacker03Act != None)
			debug.trace(self + " registering attacker " + Attacker03Act + " for distance event.")
			RegisterForDistanceLessThanEvent(PlayerRef, Attacker03Act, fTriggerDistance)
		EndIf
		if (Attacker04Act != None)
			debug.trace(self + " registering attacker " + Attacker04Act + " for distance event.")
			RegisterForDistanceLessThanEvent(PlayerRef, Attacker04Act, fTriggerDistance)
		EndIf
		if (Attacker05Act != None)
			debug.trace(self + " registering attacker " + Attacker05Act + " for distance event.")
			RegisterForDistanceLessThanEvent(PlayerRef, Attacker05Act, fTriggerDistance)
		EndIf
	endif
EndFunction

;If assault hasn't kicked off, player has gotten close enough to an attacker to fire it off now
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)

	if AssaultComplete == true
		return
	endif

	if !GetStageDone(200)
		debug.trace(self + "Assault started via distance event between " + akObj1 + " and " + akObj2)
		SetStage(200)
	endif
endEvent

;Assault has begun. Toss the distance events between player and attackers
Function UnregisterForAttackDistanceEvents()
	ObjectReference PlayerRef = Game.GetPlayer()

	if (Attacker01Act != None)
		debug.trace(self + " pulling attacker distance event: " + Attacker01Act)
		UnregisterForDistanceEvents(PlayerRef, Attacker01Act)
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " pulling attacker distance event: " + Attacker02Act)
		UnregisterForDistanceEvents(PlayerRef, Attacker02Act)
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " pulling attacker distance event: " + Attacker03Act)
		UnregisterForDistanceEvents(PlayerRef, Attacker03Act)
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " pulling attacker distance event: " + Attacker04Act)
		UnregisterForDistanceEvents(PlayerRef, Attacker04Act)
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " pulling attacker distance event: " + Attacker05Act)
		UnregisterForDistanceEvents(PlayerRef, Attacker05Act)
	EndIf
EndFunction

;Called at the start of the Assault. Only want to throw the objective if the defenders are in combat with the attackers
Function CheckCombatTargetsForObjective()
	int iCount = 0
	Actor CurrentCombatTarget

	if AssaultComplete == true
		return
	endif

	;Check attacker combat targets
	if !GetStageDone(210)
		if (Attacker01Act != None)
			CurrentCombatTarget = Attacker01Act.GetCombatTarget()
			debug.trace(self + "Attacker01 combat target is: " + CurrentCombatTarget)
			
			if CurrentCombatTarget != none && CurrentCombatTarget.IsInFaction(RECheckpointFactionDefender)
				debug.trace(self + "Attacker 01 triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif
		EndIf

		if (Attacker02Act != None)
			CurrentCombatTarget = Attacker02Act.GetCombatTarget()
			debug.trace(self + "Attacker02 combat target is: " + CurrentCombatTarget)
			
			if CurrentCombatTarget != none && CurrentCombatTarget.IsInFaction(RECheckpointFactionDefender)
				debug.trace(self + "Attacker 02 triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif
		EndIf

		if (Attacker03Act != None)
			CurrentCombatTarget = Attacker03Act.GetCombatTarget()
			debug.trace(self + "Attacker03 combat target is: " + CurrentCombatTarget)
			
			if CurrentCombatTarget != none && CurrentCombatTarget.IsInFaction(RECheckpointFactionDefender)
				debug.trace(self + "Attacker 03 triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif
		EndIf

		if (Attacker04Act != None)
			CurrentCombatTarget = Attacker04Act.GetCombatTarget()
			debug.trace(self + "Attacker04 combat target is: " + CurrentCombatTarget)
			
			if CurrentCombatTarget != none && CurrentCombatTarget.IsInFaction(RECheckpointFactionDefender)
				debug.trace(self + "Attacker 04 triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif
		EndIf

		if (Attacker05Act != None)
			CurrentCombatTarget = Attacker05Act.GetCombatTarget()
			debug.trace(self + "Attacker05 combat target is: " + CurrentCombatTarget)
			
			if CurrentCombatTarget != none && CurrentCombatTarget.IsInFaction(RECheckpointFactionDefender)
				debug.trace(self + "Attacker 05 triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif
		EndIf

		;If none of the attackers are in combat with the defenders, check the defenders' targets
		while (iCount < DefenderCollection.GetCount())
			CurrentCombatTarget = (DefenderCollection.GetAt(iCount) as Actor).GetCombatTarget()
			debug.trace(self + "Defender " + iCount + " in combat with " + CurrentCombatTarget)
		
			if CurrentCombatTarget != none ;&& CurrentCombatTarget.IsInFaction(RECheckpointFactionAttacker)
				;Defender's combat target is an attacker. Throw the objective.
				debug.trace(self + "Defender " + iCount + " triggering objective via CheckDefenderCombatTargetsForObjective()")
				SetStage(210)
				return
			endif

			iCount += 1
		endwhile
	endif
EndFunction

;Return the object reference of a living defender (used for reinforcement spawning - stage 250)
ObjectReference Function GetLivingDefender()
	ObjectReference Defender
	int iCount = 0
	
	while (iCount < DefenderCollection.GetCount())
		if (DefenderCollection.GetAt(iCount) as Actor).IsDead() == false
			Defender = DefenderCollection.GetAt(iCount)
			return Defender
		else
			iCount += 1
		endif
	endwhile
EndFunction

;How may defenders are still alive? Used to ensure we're not spawning in more defenders than site can handle
Int Function GetLivingDefenderCount()
	int iCount = 0
	int iDefenderCount = 0
	
	while (iCount < DefenderCollection.GetCount())
		if (DefenderCollection.GetAt(iCount) as Actor).IsDead() == false
			iDefenderCount += 1
		endif
			iCount += 1
	endwhile

		return iDefenderCount
EndFunction

;Assign defender reinforcements necessary actor values/factions
Function SetUpDefenderReinforcements()
	
	DefenderReinforcement01Act = DefenderReinforcement01.GetActorRef()
	DefenderReinforcement02Act = DefenderReinforcement02.GetActorRef()

	if (DefenderReinforcement01Act != None)
		DefenderReinforcement01Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
		DefenderReinforcement01Act.AddToFaction(RECheckpointOwnerFaction)
		DefenderReinforcement01Act.SetValue(RECheckpointRole, 0)
		DefenderReinforcement01Act.EvaluatePackage()
	endif
	
	if (DefenderReinforcement02Act != None)
		DefenderReinforcement02Act.SetLocRefType(CheckpointLocation.GetLocation(), RECheckpointDefender)
		DefenderReinforcement02Act.AddToFaction(RECheckpointOwnerFaction)
		DefenderReinforcement02Act.SetValue(RECheckpointRole, 0)
		DefenderReinforcement02Act.EvaluatePackage()
	endif
EndFunction

;Called when the player moves in range of the trigger or player attacks someone. 
;Causes the attackers to begin their attack run.
Function StartAssault()
	Debug.Trace(self + "Starting assault.")

	;Remove friend faction from attackers and update their AV to start the attack run.
	if (Attacker01Act != None)
		debug.trace(self + " removing friend faction from " + Attacker01Act)
		Attacker01Act.SetValue(RECheckpointRole, 2)
		Attacker01Act.RemoveFromFaction(RECheckpointFactionFriend)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " removing friend faction from " + Attacker02Act)
		Attacker02Act.SetValue(RECheckpointRole, 2)
		Attacker02Act.RemoveFromFaction(RECheckpointFactionFriend)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " removing friend faction from " + Attacker03Act)
		Attacker03Act.SetValue(RECheckpointRole, 2)
		Attacker03Act.RemoveFromFaction(RECheckpointFactionFriend)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " removing friend faction from " + Attacker04Act)
		Attacker04Act.SetValue(RECheckpointRole, 2)
		Attacker04Act.RemoveFromFaction(RECheckpointFactionFriend)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " removing friend faction from " + Attacker05Act)
		Attacker05Act.SetValue(RECheckpointRole, 2)
		Attacker05Act.RemoveFromFaction(RECheckpointFactionFriend)
		Attacker05Act.EvaluatePackage()
	EndIf

	;Remove friend faction from defenders.
	if (Defender01Act != None)
		debug.trace(self + " removing friend faction from " + Defender01Act)
		Defender01Act.RemoveFromFaction(RECheckpointFactionFriend)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		debug.trace(self + " removing friend faction from " + Defender02Act)
		Defender02Act.RemoveFromFaction(RECheckpointFactionFriend)
		Defender02Act.EvaluatePackage()
	EndIf
	if (Defender03Act != None)
		debug.trace(self + " removing friend faction from " + Defender03Act)
		Defender03Act.RemoveFromFaction(RECheckpointFactionFriend)
		Defender03Act.EvaluatePackage()
	EndIf
	if (Defender04Act != None)
		debug.trace(self + " removing friend faction from " + Defender04Act)
		Defender04Act.RemoveFromFaction(RECheckpointFactionFriend)
		Defender04Act.EvaluatePackage()
	EndIf
	if (Defender05Act != None)
		debug.trace(self + " removing friend faction from " + Defender05Act)
		Defender05Act.RemoveFromFaction(RECheckpointFactionFriend)
		Defender05Act.EvaluatePackage()
	EndIf
EndFunction

Function RemoveDamageSpell()
	;Remove damage reduction spell from attackers.
	if (Attacker01Act != None)
		debug.trace(self + " removing damage spell from " + Attacker01Act)
		Attacker01Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " removing damage spell from " + Attacker02Act)
		Attacker02Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " removing damage spell from " + Attacker03Act)
		Attacker03Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " removing damage spell from " + Attacker04Act)
		Attacker04Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " removing damage spell from " + Attacker05Act)
		Attacker05Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf

	;Remove damage reduction spell from defenders.
	if (Defender01Act != None)
		debug.trace(self + " removing damage spell from " + Defender01Act)
		Defender01Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Defender02Act != None)
		debug.trace(self + " removing damage spell from " + Defender02Act)
		Defender02Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Defender03Act != None)
		debug.trace(self + " removing damage spell from " + Defender03Act)
		Defender03Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Defender04Act != None)
		debug.trace(self + " removing damage spell from " + Defender04Act)
		Defender04Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (Defender05Act != None)
		debug.trace(self + " removing damage spell from " + Defender05Act)
		Defender05Act.RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (DefenderReinforcement01 != None)
		debug.trace(self + " removing damage spell from " + DefenderReinforcement01)
		DefenderReinforcement01.GetActorRef().RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf
	if (DefenderReinforcement02 != None)
		debug.trace(self + " removing damage spell from " + DefenderReinforcement02)
		DefenderReinforcement02.GetActorRef().RemoveSpell(RECheckpoint_LessDamage90Spell)
	EndIf

EndFunction

Function AssignDefenderRole(bool bBlockFaction = false)

	;Assault's over. Everyone take up your posts.
	AssaultComplete = true

	;Attackers take up defender roles, new package sends them to mill around now captured checkpoint
	if (Attacker01Act != None)
		debug.trace(self + " assigning Defender roles/faction to attacker " + Attacker01Act)
		if bBlockFaction == false
			Attacker01Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Attacker01Act.SetValue(RECheckpointRole, 3)
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " assigning Defender roles/faction to attacker " + Attacker02Act)
		if bBlockFaction == false
			Attacker02Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Attacker02Act.SetValue(RECheckpointRole, 3)
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " assigning Defender roles/faction to attacker " + Attacker03Act)
		if bBlockFaction == false
			Attacker03Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Attacker03Act.SetValue(RECheckpointRole, 3)
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " assigning Defender roles/faction to attacker " + Attacker04Act)
		if bBlockFaction == false
			Attacker04Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Attacker04Act.SetValue(RECheckpointRole, 3)
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " assigning Defender roles/faction to attacker " + Attacker05Act)
		if bBlockFaction == false
			Attacker05Act.AddToFaction(RECheckpointOwnerFaction)
		endif	
		Attacker05Act.SetValue(RECheckpointRole, 3)
	EndIf

	Utility.Wait(0.5)

	if (Attacker01Act != None)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		Attacker05Act.EvaluatePackage()
	EndIf
EndFunction

;Prevent further initializations for quest
Function DefenderVictory()
	AssaultComplete = true
EndFunction

;Prevent further initializations for quest. Used for attackers we don't want to mill around 
;checkpoint (Deathclaws, etc.)
Function NonOccupyingAttackerVictory()
	DefenderVictory()

	if (Attacker01Act != None)
		debug.trace(self + " setting to default master " + Attacker01Act)
		Attacker01Act.SetValue(RECheckpointRole, 4)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		debug.trace(self + " setting to default master " + Attacker02Act)
		Attacker02Act.SetValue(RECheckpointRole, 4)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		debug.trace(self + " setting to default master " + Attacker03Act)
		Attacker03Act.SetValue(RECheckpointRole, 4)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		debug.trace(self + " setting to default master " + Attacker04Act)
		Attacker04Act.SetValue(RECheckpointRole, 4)
		Attacker04Act.EvaluatePackage()
	EndIf
	if (Attacker05Act != None)
		debug.trace(self + " setting to default master " + Attacker05Act)
		Attacker05Act.SetValue(RECheckpointRole, 4)
		Attacker05Act.EvaluatePackage()
	EndIf
EndFunction

;Assign the attacker vars
Function GetCheckpointAttackers()
	if (Attacker01 != None)
		Attacker01Act = Attacker01.GetActorRef()
		debug.trace(self + "filled attacker var: " + Attacker01Act)
	endif
	if (Attacker02 != None)
		Attacker02Act = Attacker02.GetActorRef()
		debug.trace(self + "filled attacker var: " + Attacker02Act)
	endif
	if (Attacker03 != None)
		Attacker03Act = Attacker03.GetActorRef()
		debug.trace(self + "filled attacker var: " + Attacker03Act)
	endif
	if (Attacker04 != None)
		Attacker04Act = Attacker04.GetActorRef()
		debug.trace(self + "filled attacker var: " + Attacker04Act)
	endif
	if (Attacker05 != None)
		Attacker05Act = Attacker05.GetActorRef()
		debug.trace(self + "filled attacker var: " + Attacker05Act)
	endif
EndFunction

;Assign the defender vars
Function GetCheckpointDefenders()
	if (Defender01 != None)
		Defender01Act = Defender01.GetActorRef()
		debug.trace(self + "filled defender var: " + Defender01Act)
	endif
	if (Defender02 != None)
		Defender02Act = Defender02.GetActorRef()
		debug.trace(self + "filled defender var: " + Defender02Act)
	endif
	if (Defender03 != None)
		Defender03Act = Defender03.GetActorRef()
		debug.trace(self + "filled defender var: " + Defender03Act)
	endif
	if (Defender04 != None)
		Defender04Act = Defender04.GetActorRef()
		debug.trace(self + "filled defender var: " + Defender04Act)
	endif
	if (Defender05 != None)
		Defender05Act = Defender05.GetActorRef()
		debug.trace(self + "filled defender var: " + Defender05Act)
	endif
EndFunction

;Empty out all actor script vars
Function CleanupActorVars()
	Attacker01Act = None
	Attacker02Act = None
	Attacker03Act = None
	Attacker04Act = None
	Attacker05Act = None

	Defender01Act = None
	Defender02Act = None
	Defender03Act = None
	Defender04Act = None
	Defender05Act = None
	DefenderReinforcement01Act = None
	DefenderReinforcement02Act = None
EndFunction

function InitializeDone()
	RETriggerScript triggerRef = ((self as Quest) as REScript).myTrigger
	RECheckpointParent.InitializeCheckpointDone(triggerRef)
	Stop()
endFunction
