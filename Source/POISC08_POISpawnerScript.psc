Scriptname POISC08_POISpawnerScript extends ObjectReference Hidden
{When this object is activated, spawns an actor at the first spot out of the player's LoS.}

ObjectReference[] property SpawnPoints Auto Const
ActorBase property ActorToSpawn Auto Const
int property ActorDifficulty Auto Const
ObjectReference property LinkSandbox Auto Const
ObjectReference property LinkHoldPosition Auto Const

Keyword property DMP_Sandbox_Prim Auto Const
Keyword property DMP_Combat_HoldPosition_128 Auto Const


Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		Debug.Trace("POISpawnerScript: In OnActivate")
		GoToState("Done")

		;Find a spawn point.
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
		Debug.Trace("POISpawnerScript: mySpawnPoint=" + mySpawnPoint)

		;Spawn the actor.
		Actor myActor = mySpawnPoint.PlaceActorAtMe(ActorToSpawn, ActorDifficulty)
		if (LinkSandbox != None)
			myActor.SetLinkedRef(LinkSandbox, DMP_Sandbox_Prim)
		EndIf
		if (LinkHoldPosition != None)
			myActor.SetLinkedRef(LinkHoldPosition, DMP_Combat_HoldPosition_128)
		EndIf
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState