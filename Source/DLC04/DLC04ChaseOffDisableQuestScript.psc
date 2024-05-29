Scriptname DLC04:DLC04ChaseOffDisableQuestScript extends Quest

float Property fTimerLength = 300.0 Auto Const
{How frequently to check residents in alias}

RefCollectionAlias Property ChasedOffNPCs Auto Const Mandatory
{Ref collection to check}

Faction Property BrotherhoodofSteelFaction Auto Const Mandatory
{Brotherhood faction}

Faction Property RailroadFaction Auto Const Mandatory
{Railroad faction}

GlobalVariable Property DLC04PlayerKickedOut Auto Const Mandatory
{Variable used to know if we still need the timer}

;Local vars
int iTimerID = 1 Const
int iAliasEmptyCount = 0

Event OnQuestInit()
	;Start timer on Quest init
	StartTimer(fTimerLength, iTimerID)
EndEvent

Function StartChaseOffCheckTimer()
	StartTimer(fTimerLength, iTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iTimerID
		int iCount = 0
		iCount = ChasedOffNPCs.GetCount()

		;If there's anyone in the ref collection...
		if iCount > 0
			int i = iCount - 1
			
			;Roll through and check each one for removal
			while i >= 0
				;Ensure we still have the appropriate range to work with...
				if i < ChasedOffNPCs.GetCount()
					ObjectReference obj = ChasedOffNPCs.GetAt(i)
					debug.trace("DLC04 Chase Off Disable Quest: Checking NPC: " + obj)

					if obj != none
						CheckChasedOffNPC(obj)
					endif
				endif

				i -= 1
			endwhile
		endif

		;If there's no one left in the alias and the player's been kicked from the 
		;raiders, start incrementing the tracking var
		int iPostCount = 0
		iPostCount = ChasedOffNPCs.GetCount()
		debug.trace("DLC04 Chase Off Disable Quest: iPostCount: " + iPostCount)
		if iPostCount <= 0 && DLC04PlayerKickedOut.GetValue() >= 1
			iAliasEmptyCount += 1
			debug.trace("DLC04 Chase Off Disable Quest: iAliasEmptyCount: " + iAliasEmptyCount)
		endif
			
		;If it's been sufficent cycles with no one in alias and the player's been kicked
		;we can shut this down
		if iAliasEmptyCount < 5 && IsRunning()
			StartTimer(fTimerLength, iTimerID)
		endif
	endif
EndEvent

Function CheckChasedOffNPC(ObjectReference aiTarget)
	;If the target's currently unloaded...
	debug.trace("DLC04 Chase Off Disable Quest: Attempting to kill: " + aiTarget)
	if !aiTarget.Is3dLoaded()

		Actor act = (aiTarget as Actor)

		;If the unloading actor isn't essential (they shouldn't be in here anyway...)
		if !act.IsEssential() 

			;Kill them now and then disable them
			if !act.IsDead()
				;If the NPC is in either of the NPC factions, make the player the killer (ensuring event goes through)
				if act.IsInFaction(BrotherhoodofSteelFaction) || act.IsInFaction(RailroadFaction)
					act.KillEssential(Game.GetPlayer())
				else
					act.KillEssential()
				endif
			endif

			if !act.IsDisabled()
				act.Disable()
			endif
		endif

		;Finally, remove ref from collection
		ChasedOffNPCs.RemoveRef(aiTarget)
	endif
EndFunction