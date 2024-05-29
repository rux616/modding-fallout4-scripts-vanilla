Scriptname Inst307Fight_BeaconAliasScript extends ReferenceAlias Hidden
{Inst307Fight. Part of the Institute Beacon system.}
;
;For Inst307, the player is given three Institute Beacons. These are grenades that, when thrown:
; 1. Spawn a marker, which snaps itself to the Navmesh, then spawns a beacon activator and explosion vfx. [InstituteBeaconSpawnerScript]
; 2. The beacon activator registers itself with Inst307Fight, which moves an aliased marker to it. [InstituteBeaconScript]
; [3. The aliased marker tracks whether it's operating or not, based on events from Inst307Fight. [THIS SCRIPT]]
; 4. When the Beacons are enabled, synths spawn and respawn at their locations. [Inst307Fight_BeaconAliasRespawn/Inst307Fight_BeaconQuestRespawn]

Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
{Inst307Fight}

bool hasActivated	;Has this beacon ever activated?


Event OnLoad()
	;Debug.Trace("BeaconAliasScript " + Self + "OnLoad")
	SetBeaconActive()
EndEvent

Event OnUnload()
	;Debug.Trace("BeaconAliasScript " + Self + "OnUnload")
	SetBeaconInactive()
EndEvent

;This function is called:
; - When the player sets the beacon (grenade is thrown, activator appears, etc., etc., triggering the OnLoad event above).
; - By Inst307Fight when Phase 2 begins (Stage 200), and subsequently when the player leaves and reenters the area.
;
;This function allows Inst307Fight to set the beacon active (and begin spawning synths) when:
; - The player has set the beacon.
; - The fight is in Phase 2 or 3 and not paused.
Function SetBeaconActive()
	if ((!Self.GetReference().IsDisabled()) && (!Inst307Fight.battlePaused) && (Inst307Fight.GetStage() >= 200) && (Inst307Fight.GetStage() < 400))
		;Debug.Trace("Setting beacon " + beacon + " to active.")
		Inst307Fight.SetBeaconActive(Self.GetReference(), !hasActivated)
		hasActivated = True
	Else
		;Debug.Trace("Beacon " + beacon + " is still inactive.")
	EndIf
EndFunction

Function SetBeaconInactive()
	Inst307Fight.SetBeaconInactive(Self.GetReference())
	;Debug.Trace("Beacon " + Self.GetReference() + " becomes inactive.")
EndFunction