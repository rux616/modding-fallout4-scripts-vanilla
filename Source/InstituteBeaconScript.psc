Scriptname InstituteBeaconScript extends ObjectReference Hidden Const
{Inst307Fight. Part of the Institute Beacon system.}
;
;For Inst307, the player is given three Institute Beacons. These are grenades that, when thrown:
; 1. Spawn a marker, which snaps itself to the Navmesh, then spawns a beacon activator and explosion vfx. [InstituteBeaconSpawnerScript]
; [2. The beacon activator registers itself with Inst307Fight, which moves an aliased marker to it. [THIS SCRIPT]]
; 3. The aliased marker tracks whether it's operating or not, based on events from Inst307Fight. [Inst307Fight_BeaconAliasScript]
; 4. When the Beacons are enabled, synths spawn and respawn at their locations. [Inst307Fight_BeaconAliasRespawn/Inst307Fight_BeaconQuestRespawn]

Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
{Inst307Fight}

Location property BostonAirportLocation Auto Const Mandatory
{Airport location. These Beacons don't work anywhere else.}

Quest Property Inst307 Auto Const


Event OnLoad()
	if ((Self.GetCurrentLocation() == BostonAirportLocation) && (Inst307Fight.IsRunning()))
		Inst307Fight.PlaceBeacon(Self)

;if the player has no more in his inventory, complete the associated objective
		if Game.GetPlayer().GetItemCount(InstituteBeaconGrenade)==0
			Inst307.SetObjectiveCompleted(40)
		endif

	EndIf
EndEvent
Weapon Property InstituteBeaconGrenade Auto Const
