Scriptname InstituteBeaconSpawnerMarkerScript extends ObjectReference Hidden Const
{Inst307Fight. Part of the Institute Beacon system.}
;
;For Inst307, the player is given three Institute Beacons. These are grenades that, when thrown:
; [1. Spawn a marker, which snaps itself to the Navmesh, then spawns a beacon activator and explosion vfx. [THIS SCRIPT]]
; 2. The beacon activator registers itself with Inst307Fight, which moves an aliased marker to it. [InstituteBeaconScript]
; 3. The aliased marker tracks whether it's operating or not, based on events from Inst307Fight. [Inst307Fight_BeaconAliasScript]
; 4. When the Beacons are enabled, synths spawn and respawn at their locations. [Inst307Fight_BeaconAliasRespawn/Inst307Fight_BeaconQuestRespawn]

Activator property InstituteBeaconSpawner Auto Const Mandatory
{The Beacon object to place.}

Explosion property InstituteBeaconExplosion Auto Const Mandatory
{The explosion to spawn to cover the Beacon's appearance.}

Event OnLoad()
	Self.MoveToNearestNavmeshLocation()
	Self.PlaceAtMe(InstituteBeaconExplosion)
	Self.PlaceAtMe(InstituteBeaconSpawner)
	Self.Disable()
	Self.Delete()
EndEvent