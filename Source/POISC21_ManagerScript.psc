Scriptname POISC21_ManagerScript extends Actor Hidden Const
{Manages the POISC21 Caged Animal POI. Lives on the dog.}

;Dog state AV.
ActorValue property POISC21_DogState Auto Const Mandatory

;Objects related to the POI event.
ObjectReference property POISC21_Door Auto Const Mandatory
ObjectReference property POISC21_CageTrigger Auto Const Mandatory
ObjectReference property POISC21_HomeTrigger Auto Const Mandatory

;Factions and Perk for the dog.
Faction property POISC21_DogFaction Auto Const Mandatory
Faction property POISC06_Faction Auto Const Mandatory
Faction property PlayerFaction Auto Const Mandatory
Perk property POISC21_EleanorsFriendshipPerk Auto Const Mandatory

;Keywords to change the dog's AnimArchetype.
Keyword property AnimArchetypeScared Auto Const Mandatory
Keyword property AnimArchetypeFriendly Auto Const Mandatory

;Spawn data for the hunters.
ObjectReference[] property SpawnPoints Auto Const Mandatory
ActorBase property ActorToSpawn Auto Const Mandatory
int property ActorDifficulty Auto Const Mandatory


Event OnInit()
	Self.RegisterForRemoteEvent(POISC21_Door, "OnLockStateChanged")
	Self.RegisterForRemoteEvent(POISC21_CageTrigger, "OnTriggerEnter")
	Self.RegisterForRemoteEvent(POISC21_CageTrigger, "OnTriggerLeave")
	Self.RegisterForRemoteEvent(POISC21_HomeTrigger, "OnTriggerEnter")
EndEvent

Event OnDeath(Actor akKiller)
	if (Self.GetValue(POISC21_DogState) == 0)
		;Unregister for all events.
		UnregisterForAllEvents()
		;Update the dog's state.
		Self.SetValue(POISC21_DogState, 1)
		;Find a spawn point and spawn the hunters.
		SpawnTrappers()
	EndIf
EndEvent

Event ObjectReference.OnLockStateChanged(ObjectReference source)
	if ((source == POISC21_Door) && (Self.GetValue(POISC21_DogState) == 0))
		;Unregister for future events on the door.
		Self.UnregisterForRemoteEvent(POISC21_Door, "OnLockStateChanged")

		;Update the dog's state.
		Self.SetValue(POISC21_DogState, 1)
		POISC21_DogFaction.SetAlly(PlayerFaction, True, True)
		Self.AddKeyword(AnimArchetypeFriendly)
		Self.RemoveKeyword(AnimArchetypeScared)
		Self.EvaluatePackage()

		;Find a spawn point and spawn the actors.
		SpawnTrappers()

		;Start a timer to advance the dog's state.
		StartTimer(5, 2)
	EndIf
EndEvent

Function SpawnTrappers()
	Actor player = Game.GetPlayer()
	ObjectReference mySpawnPoint
	int i = 0
	While ((mySpawnPoint == None) && (i < SpawnPoints.Length))
		if (!player.HasDetectionLoS(SpawnPoints[i]))
			mySpawnPoint = SpawnPoints[i]
		EndIf
		i = i + 1
	EndWhile
	if (mySpawnPoint == None)
		mySpawnPoint = SpawnPoints[0]
	EndIf
	mySpawnPoint.PlaceActorAtMe(ActorToSpawn, ActorDifficulty).EvaluatePackage()
	mySpawnPoint.PlaceActorAtMe(ActorToSpawn, ActorDifficulty).EvaluatePackage()

	POISC21_CageTrigger.Disable()
	Self.UnregisterForRemoteEvent(POISC21_CageTrigger, "OnTriggerEnter")
	Self.UnregisterForRemoteEvent(POISC21_CageTrigger, "OnTriggerLeave")
EndFunction

Event OnTimer(int timerID)
	if (timerID == 1)
		;Debug.Trace("Eval : " + Game.GetPlayer().GetDistance(Self))
		Self.EvaluatePackage()
	ElseIf (timerID == 2)
		if (Self.GetValue(POISC21_DogState) == 1)
			;Update the dog's state.
			Self.SetValue(POISC21_DogState, 2)
			Self.EvaluatePackage()

			;Enable the trigger for when the dog gets home.
			POISC21_HomeTrigger.Enable()
		EndIf
	EndIf
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActionRef)
	if ((source == POISC21_CageTrigger) && (akActionRef == Game.GetPlayer()))
		StartTimer(0.5, 1)
	ElseIf ((source == POISC21_HomeTrigger) && (akActionRef == Self) && (Self.GetValue(POISC21_DogState) == 2))
		;Unregister for future events from the trigger.
		Self.UnregisterForRemoteEvent(POISC21_HomeTrigger, "OnTriggerEnter")
		POISC21_HomeTrigger.Disable()

		;Update the dog's state.
		Self.SetValue(POISC21_DogState, 3)
		Self.EvaluatePackage()
		POISC21_DogFaction.SetAlly(POISC06_Faction)
		POISC21_DogFaction.SetAlly(PlayerFaction, True, True)

		Game.GetPlayer().AddPerk(POISC21_EleanorsFriendshipPerk)
	EndIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference source, ObjectReference akActionRef)
	if ((source == POISC21_CageTrigger) && (akActionRef == Game.GetPlayer()))
		StartTimer(0.5, 1)
	EndIf
EndEvent