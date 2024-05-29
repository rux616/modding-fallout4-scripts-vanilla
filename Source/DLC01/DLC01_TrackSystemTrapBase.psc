ScriptName DLC01:DLC01_TrackSystemTrapBase extends ObjectReference Hidden
{Part of the DLC01 Track System. Parent script for all of the traps spawned by TrackSystemMachine.}

;Called by TrackSystemMachine after spawning the trap, to make sure the trap can store and reference the associated machine (if it wants to).
Function InitTrap(DLC01:DLC01_TrackSystemMachine myMachine)
	;Does nothing on its own.
EndFunction