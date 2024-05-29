Scriptname WorkshopSynthAttackScript extends WorkshopAttackScript

; used for synth attacks
function StartSynthAttack(bool bAllowTeleport = true)
	debug.trace(self + " StartSynthAttack")

	bool bTeleport = bAllowTeleport
	; no teleporting if:
	;  * Institute is destroyed, OR
	;  * Player has never been to Institute
	if WorkshopParent.PlayerInstitute_Destroyed.GetValue() > 0 || WorkshopParent.PlayerBeenToInstitute.GetValue() == 0
		bTeleport = false
	endif

	; record attack on this workshop
	WorkshopParent.RecordAttack(WorkshopAlias.GetRef() as WorkshopScript, attackerFaction)

	; enable/kill attackers
	debug.trace(self + "    enabling " + numAttackers + " attackers")
	int i = 0
	while i < Attackers.GetCount()
		if i < numAttackers
			TeleportActorScript teleportSynth = Attackers.GetAt(i) as TeleportActorScript
			if teleportSynth && bTeleport
				teleportSynth.teleportInOnLoad = true
				debug.trace(self + "    " + teleportSynth + ": teleport in")
			endif
			Attackers.GetAt(i).Enable()
		else
			debug.trace(self + "    " + Attackers.GetAt(i) + ": kill")
			; kill the rest
			(Attackers.GetAt(i) as Actor).Kill()
		endif
		i += 1
	endWhile

	; if attack isn't resolved in an hour, can resolve offscreen
	StartTimerGameTime(1.0)
endFunction
