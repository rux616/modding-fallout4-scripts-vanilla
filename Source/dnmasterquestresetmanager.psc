ScriptName DNMasterQuestResetManager extends Quest Hidden
{Script on DNMasterQuest that improves cell reset in locations with named bosses.}
;
;We have ~20 locations with named bosses. When these dungeons reset, if their named boss is dead, we usually want the named boss to
;be swapped out for a generic one. A number of scripts have been used to achieve this (RaiderBossResetScript, etc.), but they're all
;reference scripts that swap the boss in response to an OnReset event.
;
;That creates a problem. After the player kills the named boss and clears the dungeon, the dungeon will not become available for Radiant
;quests until the player returns to it and triggers the swap. Most Radiant Quests want to find an enabled, living boss, and the dungeon won't
;have one-- the only enabled boss (the named guy) is dead and doesn't respawn; the generic guy is disabled until the swap occurs.
;
;This script tries to improve on that. When one of the objects with a swap script detaches, if the dungeon has been cleared, we store it off,
;together with its location and a timestamp. When the dungeon is ready to reset (after iHoursToRespawnCellCleared), we call OnReset on the swap
;script object to enable the new boss, then reset and un-clear the location. That should make it available for Radiant quests going forward.
;
;This script's timer is not the same as the timer used by the reset system code, so the two can be out of sync (the reset system timestamps the
;last time the player was in the encounter zone; this script timestamps when the swap script object last detached). The edge cases here are:
; - If this script triggers before cell reset, the boss will swap and the location will be reset a little early. No big deal.
; - If cell reset triggers before this script, everything will work as it did before this script went in (the boss swap will occur when the player
;   returns to the location). That should also be safe.
;
;Any scripts that want to take advantage of this scripted reset functionality should extend ScriptedResetRef.


Struct DungeonResetGroup
	Location DungeonLocation					;The location.
	ObjectReference DungeonRefToReset			;Reference we want to call OnReset on to flip the boss' state.
	float DungeonLastSeenTimestamp			;Timestamp of when we last 'saw' the location. (When DungeonRefToReset last detached.)
EndStruct

DungeonResetGroup[] DungeonsAwaitingReset		;Array of locations that the player has cleared and which are pending reset by this script.
Location[] DungeonsThatHaveReset				;Array of locations that have already been reset by this script. (Since we only do this once per location.)
bool hasRunInit					;Have we run our OnInit block?
Actor player 						;Local ref to the player.

Event OnQuestInit()
	if (!hasRunInit)
		DungeonsAwaitingReset = new DungeonResetGroup[0]
		DungeonsThatHaveReset = new Location[0]
		player = Game.GetPlayer()
		hasRunInit = True
	EndIf
EndEvent

;Called by reference scripts (eg. RaiderBossResetScript) to register their locations for reset.
Function RegisterForReset(ObjectReference myRef, Location myLocation, float myTimestamp)
	;Debug.Trace("DN_MASTER_RESET: " + myRef + " from " + myLocation + " trying to register.")
	;To support old saves: Make sure OnQuestInit runs if our properties haven't initialized.
	if (!hasRunInit)
		OnQuestInit()
	EndIf

	;Is this location in the list of Dungeons we've already reset? If so, we don't need to touch it again.
	if (DungeonsThatHaveReset.Find(myLocation) >= 0)
		;Debug.Trace("--DN_MASTER_RESET: " + myLocation + " previously reset. Block registration.")
		return
	EndIf

	;Is this location in the list of dungeons that are awaiting reset?
	int indexInAwaitingReset = DungeonsAwaitingReset.FindStruct("DungeonLocation", myLocation)
	if (indexInAwaitingReset >= 0)
		if (myLocation.IsCleared())
			;We were waiting for this location to reset, but the player returned to it while it was still cleared.
			;This is going to delay the reset, so update our timestamp. That's all we have to do in this case.
			DungeonsAwaitingReset[indexInAwaitingReset].DungeonLastSeenTimestamp = myTimestamp
			;Debug.Trace("--DN_MASTER_RESET: " + myLocation + " is already waiting. Updating timestamp.")
			return
		Else
			;We were waiting for this location to reset, but it's already reset on its own (it's no longer cleared).
			;This probably means the player returned to this location after the natural reset occurred, but before our timer got around to resetting it.
			;Move this location from the list awaiting reset to the list that have already reset.
			DungeonsThatHaveReset.Add(myLocation)
			DungeonsAwaitingReset.Remove(indexInAwaitingReset)
			;Debug.Trace("--DN_MASTER_RESET: " + myLocation + " had reset on its own.")
			return
		EndIf
	EndIf

	;Has this dungeon been cleared? If not, we don't want to add it to the list.
	if (!myLocation.IsCleared())
		;Debug.Trace("--DN_MASTER_RESET: " + myLocation + " isn't cleared. Aborting.")
		return
	EndIf

	;If it's in neither array, we need to add it to DungeonsAwaitingReset.
	DungeonResetGroup myGroup = new DungeonResetGroup
	myGroup.DungeonLocation = myLocation
	myGroup.DungeonRefToReset = myRef
	myGroup.DungeonLastSeenTimestamp = myTimestamp
	DungeonsAwaitingReset.Add(myGroup)
	;Debug.Trace("--DN_MASTER_RESET: " + myLocation + " added to Awaiting Reset with timestamp " + myTimestamp)

	;Then start the CheckForReset timer loop. We don't know if it's running or not, so just fire it immediately.
	StartTimerGameTime(0)
EndFunction

;Every six hours, cycle through the dungeons that need to be reset to see if they're ready for reset.
;Then, if there are still dungeons awaiting reset, reset the timer for another 6 hours.
Event OnTimerGameTime(int aiTimerID)
	CheckForReset()
	if (DungeonsAwaitingReset.Length > 0)
		StartTimerGameTime(6)
	EndIf
EndEvent

Function CheckForReset()
	;To support old saves: Make sure OnQuestInit runs if our properties haven't initialized.
	if (!hasRunInit)
		OnQuestInit()
	EndIf

	float currentGameTime = Utility.GetCurrentGameTime()
	;NOTE: Utility.GetCurrentGameTime is time in days, so we have to convert iHoursToRespawnCellCleared to days as well.
	float iHoursToRespawnCellCleared = Game.GetGameSettingInt("iHoursToRespawnCellCleared") / 24.0
	;Debug.Trace("DN_MASTER_RESET: CheckForReset. " + currentGameTime + ", " + iHoursToRespawnCellCleared)

	int i = 0
	While (i < DungeonsAwaitingReset.Length)
		DungeonResetGroup myGroup = DungeonsAwaitingReset[i]
		;For each dungeon, trigger a reset only if:
		; - It's been iHoursToRespawnCellCleared since the ref we care about has detached (as close as we can get to the usual reset timestamp).
		; - The player isn't in the location.
		;Debug.Trace("-DN_MASTER_RESET: Testing " + myGroup.DungeonLocation + ": " + (myGroup.DungeonLastSeenTimestamp + iHoursToRespawnCellCleared) + ", " + currentGameTime + ", " + ((myGroup.DungeonLastSeenTimestamp + iHoursToRespawnCellCleared) < currentGameTime) + ", " + (myGroup.DungeonLocation != player.GetCurrentLocation()))
		if (((myGroup.DungeonLastSeenTimestamp + iHoursToRespawnCellCleared) < currentGameTime) && \
			(myGroup.DungeonLocation != player.GetCurrentLocation()))
			(myGroup.DungeonRefToReset as ScriptedResetRef).ScriptedReset()	;- Call the ScriptedReset function on RefToReset, which flips the bosses.
			myGroup.DungeonLocation.Reset()							;- Force the location to reset, to cover an edge case where a natural reset may not occur because the game's
																;reset timestamp is out of sync with the timestamp being maintained by this script, which would cause the
																;boss to be the only thing alive in the dungeon.
			myGroup.DungeonLocation.SetCleared(False)					;- Remove Cleared from the location, since code apparently doesn't do that otherwise.
			DungeonsThatHaveReset.Add(myGroup.DungeonLocation)			;- Add this dungeon to the list of dungeons that have reset.
			DungeonsAwaitingReset.Remove(i)							;- Remove this dungeon from the list awaiting reset. (So we don't need to increment the array on this loop.)
			;Debug.Trace("--DN_MASTER_RESET: Reset.")
		Else
			i = i + 1
			;Debug.Trace("--DN_MASTER_RESET: Wasn't ready for reset.")
		EndIf
	EndWhile
EndFunction
