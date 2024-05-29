ScriptName DN092QuestScript extends Quest conditional
; ==========================================================================;
import utility
; ==========================================================================;
Group Wave_Fight_Vars
{Properties for the wave fight in Concord street w/Raiders & Deathclaw}
	bool property bLeftRoofSafeZone Auto Hidden conditional
	{this flag simply tells us if the player has left the roof safe zone}
	Int Property iWaveRaiderKills Auto Hidden
	{Tracking Var for raiders killed in the wave.}
	Int Property iWaveKillsToSpawnDeathclaw Auto Const
	{When this many Wave raiders are dead, spawn the Deathclaw}
endGroup

Group General_Quest_Vars
	int property iDeathclawFailsafeTimer auto
	{Once the player leaves the roof, wait this many seconds before forcing the deathclaw to appear.}
	location property ConcordLocation auto
	musicType property MUSzCombatHigh auto
endGroup
; ==========================================================================;
; Handling for fallback timer to spawn deathclaw once player has bailed off the roof
Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == 76
    	; player is off the roof - start a long timer to spawn deathclaw
    	starttimer(300,76)
    	; this timer will be cancelled if the player spawns the deathclaw by killing raiders or getting too close
    endif

    if auiStageID == 77
    	; if the timer was still active, kill it.
    	cancelTimer(76)
    	; register for when the player leaves the area, and kill music if that happens.
    	Self.RegisterForRemoteEvent(game.getPlayer(), "OnLocationChange")
    endif
EndEvent

EVENT OnTimer(int aiTimerID)
    if aiTimerID == 76
    	; the timer expired.  Release the kraken!
    	setStage(77)
    endif
EndEvent
; ==========================================================================;
EVENT referenceAlias.OnLocationChange(referenceAlias RefChangingLoc, Location akOldLoc, Location akNewLoc)
	debug.trace("DN092: Location Change event on "+RefChangingLoc+", leaving "+akOldLoc)
    if akOldLoc == ConcordLocation
    	;MUSzCombatHigh.remove()
    	Self.UnregisterForAllRemoteEvents()
    endif
EndEvent
; ==========================================================================;
EVENT referenceAlias.onDeath(referenceAlias deceased, actor killer)
		debug.trace("DN092: Received RefAlias Death from Wave")
		iWaveRaiderKills += 1
		if iWaveRaiderKills >= iWaveKillsToSpawnDeathclaw && !getStageDone(77)
			setStage(77)
		endif
endEVENT

Function registerNewActor(referenceAlias actorToReg)
	registerForRemoteEvent(actorToReg, "onDeath")
endFUNCTION
; ==========================================================================;
