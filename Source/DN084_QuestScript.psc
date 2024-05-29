Scriptname DN084_QuestScript extends Quest Hidden Const
{Quest script for DN084 - Mass Fusion.}

;-----------------
;Descent Sequence
;-----------------
;
;During the elevator descent sequence, this script receives updates from the floor triggers (DN084_DescentFloorTriggerScript) as the elevator descends
;and notifies the descent enemies (DN084_DescentActorRefScript) of the player's progress.

Group Descent_Sequence
	RefCollectionAlias property DN084_DescentEnemies Auto Const Mandatory
	{Enemies involved in the descent sequence combat.}

	RefCollectionAlias property DN084_DescentDoors Auto Const Mandatory
	{All of the doors the descent enemies emerge from. These close and impossible-lock once the descent is finished.}

	GlobalVariable property DN084_DescentFloor Auto Const Mandatory
	{The floor the descending elevator is currently on.}

	int property DescentStartStage Auto Const Mandatory
	{DN084 Quest Stage representing the start of the descent sequence.}

	ActorValue property DN084_DescentEndFloor Auto Const Mandatory
	{AV used by the descent enemies to indicate the floor at which they withdraw from the battle.}
EndGroup


;Called each time the elevator reaches a new floor.
Function UpdateDescentFloor(int newFloor, ObjectReference akTrigger)
	;Debug.Trace("DESCENT: " + newFloor + ", " + DN084_DescentFloor.GetValue())
	if (Self.GetStageDone(DescentStartStage))
		;Debug.Trace("Descent Floor: " + newFloor)
		;Disable the descent floor trigger; we don't need it anymore.
		akTrigger.Disable()
		akTrigger.Delete()
		;Set the global that tracks the current floor. Used by the descent enemies' packages.
		DN084_DescentFloor.SetValue(newFloor)
		;Start the music override just after we pass Floor 20, when the first enemies trigger.
		if (newFloor == 20)
			StartTimer(2, 1)
		EndIf
		;Cycle through all of the descent enemies and update them on the new floor.
		int i = 0
		While (i < DN084_DescentEnemies.GetCount())
			DN084_DescentActorRefScript next = DN084_DescentEnemies.GetAt(i) as DN084_DescentActorRefScript
			if (next != None)
				;Notify the actor of the new floor.
				next.UpdateDescentActor(newFloor)
				;Clean up the actor if possible. We want to clean up...
				if (next.IsDead())
					;...dead actors...
					;Debug.Trace("Removing " + next + "; Dead.")
					DN084_DescentEnemies.RemoveRef(next)
					i = i - 1
				ElseIf (newFloor == 8)
					;...everyone, if the descent is over...
					DN084_DescentEnemies.RemoveRef(next)
					next.Kill()
					next.Delete()
					i = i - 1
				ElseIf ((next.GetValue(DN084_DescentEndFloor) > newFloor) && (!Game.GetPlayer().HasDetectionLOS(next)))
					;...or actors who are out of range and who the player can't see.
					;Debug.Trace("Removing " + next + "; Exited Descent.")
					DN084_DescentEnemies.RemoveRef(next)
					next.Kill()
					next.Delete()
					i = i - 1
				EndIf
			EndIf
			i = i + 1
		EndWhile
		if (newFloor == 8)
			;When we reach the bottom of the descent, close and impossible-lock all of the descent doors.
			;Debug.Trace("Closing doors.")
			UpdateDescentDoors(False)
		EndIf
	EndIf
	;Debug.Trace("Done")
EndFunction


;If the player bypasses the Descent combat, this function will clean them up when the quest completes.
Function CleanupDescentEnemies()
	While (DN084_DescentEnemies.GetCount() > 0)
		DN084_DescentActorRefScript next = DN084_DescentEnemies.GetAt(0) as DN084_DescentActorRefScript
		DN084_DescentEnemies.RemoveRef(next)
		next.Kill()
		next.Delete()
	EndWhile	
	UpdateDescentDoors(False)
EndFunction


;Enemies in the descent sequence emerge from 'fake' rooms and hallways. We unlock the doors to these areas at the beginning
;of the descent sequence (True) and close and re-lock them at the end (False).
Function UpdateDescentDoors(bool startingDescent)
	;Debug.Trace("Doors updated.")
	ObjectReference d
	int i = 0
	While (i < DN084_DescentDoors.GetCount())
		d = DN084_DescentDoors.GetAt(i)
		if (startingDescent)
			d.Lock(False)
		Else
			d.SetOpen(False)
			d.Lock(True)
		EndIf
		i = i + 1
	EndWhile
EndFunction


Event OnTimer(int timerID)
	if (timerID == 1)
		;During the descent sequence, apply the music override as the first enemy emerges to fight.
		StartMusicOverride()
	ElseIf (timerID == 2)
		;At the end of the descent sequence, in the case where the player's companion is dead, delay for a bit before starting the Descent Ambush encounter.
		Utility.Wait(3)
		SetStage(230)
	EndIf
EndEvent


;----------------
;Music Overrides
;----------------
;
;During the Descent and Lab Security combats, we force combat music for the duration of the fight, which sounds better
;than allowing the music to cut in and out like it normally would.

Group Music_Overrides
	MusicType property MUSzCombatMassFusion Auto Const Mandatory
	{Combat override music. When applied, forces combat music until it's removed.}
EndGroup

;Apply the music override.
Function StartMusicOverride()
	Actor p = Game.GetPlayer()
	Self.RegisterForRemoteEvent(p, "OnDying")
	Self.RegisterForRemoteEvent(p, "OnCellDetach")
	MUSzCombatMassFusion.Add()
EndFunction

;Remove the music override.
Function RemoveMusicOverride()
	Self.UnregisterForAllRemoteEvents()
	MUSzCombatMassFusion.Remove()
EndFunction

;If the player dies, be sure to remove the override.
Event Actor.OnDying(Actor sender, Actor akKiller)
	RemoveMusicOverride()
EndEvent

;If the player somehow leaves Mass Fusion, be sure to remove the override.
Event ObjectReference.OnCellDetach(ObjectReference sender)
	RemoveMusicOverride()
EndEvent


;----------------
;Teleport Ambush
;----------------
;
;On the midlevel floor, BoS303 players are ambushed by a group of teleporting synths.

Group Ambush_Properties
	ReferenceAlias property DN084_BoSAmbushFirstEncounter Auto Const Mandatory
	{The first of the enemies to teleport in.}

	Keyword property LinkCustom01 Auto Const Mandatory
	{Keyword of transient linkedrefs that connect the ambush enemies.}

	int property BoSTeleportAmbushMaxActive = 3 Auto Const Mandatory
	{Max number of ambushers who can be active at a time.}
EndGroup

;When an ambush enemy dies, DN084_BoSAmbushUpdateOnDeath calls back to this function to spawn additional enemies.
Function UpdateBoSTeleportAmbush()
	;Debug.Trace("UpdateBoSTeleportAmbush was called.")
	int activeCount = 0
	int i = 0

	Actor[] ambushActors
	if (DN084_BoSAmbushFirstEncounter != None)
		Actor first = (DN084_BoSAmbushFirstEncounter.GetReference() as Actor)
		ambushActors = (first.GetLinkedRefChain(LinkCustom01) as Actor[])
		ambushActors.Insert(first, 0)
	EndIf

	;Count the number of active enemies, enabling additional ones as needed.
	While ((ambushActors != None) && (i < ambushActors.Length) && (activeCount < BoSTeleportAmbushMaxActive))
		if (ambushActors[i].IsDead())
			;Do nothing.
			;Debug.Trace("Dead")
		ElseIf (ambushActors[i].IsDisabled())
			activeCount = activeCount + 1
			ambushActors[i].Enable()
			Utility.Wait(Utility.RandomFloat(0, 1.5))
			;Debug.Trace("Disabled")
		Else
			activeCount = activeCount + 1
			;Debug.Trace("Active")
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("Done")
EndFunction