Scriptname DN119FightController extends Quest
{Script for controlling the DN119Fight fight. Based on DefaultQuestRespawnScript and BoS00FightMonitor to handle respawning.}

import Utility
import Debug

ReferenceAlias property Enemy01 Auto Const
ReferenceAlias property Enemy02 Auto Const
ReferenceAlias property Enemy03 Auto Const
ReferenceAlias property Enemy04 Auto Const
ReferenceAlias property Defender01 Auto Const
ReferenceAlias property Defender02 Auto Const

Actor property Attacker01Act Auto 
Actor property Attacker02Act Auto 
Actor property Attacker03Act Auto 
Actor property Attacker04Act Auto 
Actor property Defender01Act Auto 
Actor property Defender02Act Auto 

Faction property REAssaultFactionFriend auto

int property EndRespawningDeathCount = 8 Auto Const
int property EndRespawningStageToSet = 90 Auto Const

int property EndFightStageToSet = 100 Auto Const

int count

Group Respawn_Markers
	ObjectReference[] Property RespawnMarkers Auto Const
	{array of respawn markers - actors will randomly respawn at these out of player's LOS}

	ObjectReference Property RespawnMarkerFailsafe Auto Const
	{this is where I will respawn if player has LOS
	on other respawn points}
endGroup

Group Quest_Stages
	int Property startStage = 0  Auto Const
	{Quest stage that needs to be set for respawning
	to start}

	int Property doneStage = 0  Auto Const
	{Respawning will stop if this stage is set}
endGroup

Group Respawning_Values
	int Property respawnTimeMin = 5 Auto
	{min time between death and respawn in seconds}

	int Property respawnTimeMax = 10 Auto
	{max time between death and respawn in seconds}

	int Property respawnPool = 0 Auto
	{how many NPCs can be respawned?
	0 = infinite
	}
endGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

int Property minRespawnDistance = 512 Auto Hidden
{if the player is within this distance of a respawn point, don't use it
}

int respawnCount = 0
;how many NPCs have been respawned?

;Start the fight, adapted from REAssaultQuestScript
Function StartAssault()
	Debug.Trace("Starting assault.")

	;Store off actors.
	Attacker01Act = Enemy01.GetActorRef()
	Attacker02Act = Enemy02.GetActorRef()
	Attacker03Act = Enemy03.GetActorRef()
	Attacker04Act = Enemy04.GetActorRef()
	Defender01Act = Defender01.GetActorRef()
	Defender02Act = Defender02.GetActorRef()

	;Remove friend faction from attackers and update their AV to start the attack run.
	if (Attacker01Act != None)
		Attacker01Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker01Act.EvaluatePackage()
	EndIf
	if (Attacker02Act != None)
		Attacker02Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker02Act.EvaluatePackage()
	EndIf
	if (Attacker03Act != None)
		Attacker03Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker03Act.EvaluatePackage()
	EndIf
	if (Attacker04Act != None)
		Attacker04Act.RemoveFromFaction(REAssaultFactionFriend)
		Attacker04Act.EvaluatePackage()
	EndIf

	;Remove friend faction from defenders.
	if (Defender01Act != None)
		Defender01Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender01Act.EvaluatePackage()
	EndIf
	if (Defender02Act != None)
		Defender02Act.RemoveFromFaction(REAssaultFactionFriend)
		Defender02Act.EvaluatePackage()
	EndIf
EndFunction


;When the player approaches the fight, we start monitoring death events from the enemies.
Function StartFightMonitor()
	RegisterForRemoteEvent(Enemy01, "OnDeath")
	RegisterForRemoteEvent(Enemy02, "OnDeath")
	RegisterForRemoteEvent(Enemy03, "OnDeath")
	RegisterForRemoteEvent(Enemy04, "OnDeath")
EndFunction

;After enemy dies, check to see where we are in the battle.
Event ReferenceAlias.OnDeath(ReferenceAlias akSender, Actor akKiller)
	IncrementDeathCount()
EndEvent

Function IncrementDeathCount()
	count = count + 1
	Debug.Trace("Enemy " + count + " died.")
	If (count >= EndRespawningDeathCount)
		Debug.Trace("Set End Respawning Stage.")
		SetStage(EndRespawningStageToSet)
		StartTimer(1)
	EndIf
EndFunction

Event OnTimer (int timer)
	Debug.Trace("In Timer Loop")
	if (Enemy01.GetActorRef().IsDead() && Enemy02.GetActorRef().IsDead() && Enemy03.GetActorRef().IsDead() && Enemy04.GetActorRef().IsDead() )
		SetStage(EndFightStageToSet)
		Debug.Trace("Done")
	Else
		StartTimer(1)
	EndIf
EndEvent

; this will always respawn (ignores all the checks and waits)
; (this is what TryToRespawn calls when ready to respawn)
function Respawn(ReferenceAlias aliasToRespawn)
		; respawn me and force me into my alias
		ObjectReference marker = GetRespawnMarker(RespawnMarkers)
		DefaultScriptFunctions.DefaultScriptTrace(self + " respawning at " + marker, ShowTraces)

		; only respawn if current alias is actually dead
		if aliasToRespawn.GetActorRef().IsDead()
			aliasToRespawn.ForceRefTo(marker.PlaceAtMe( aliasToRespawn.GetActorRef().GetActorBase() ) )
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn done", ShowTraces)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn - current actor isn't dead!", ShowTraces)
		endif
endFunction

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
 	DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn called by " + aliasToRespawn, ShowTraces)
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Waiting to respawn...", ShowTraces)
		Wait( RandomInt(respawnTimeMin, respawnTimeMax) )
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Finding a respawn spot", ShowTraces)
		if (aliasToRespawn as DN119AliasRespawnScript).bRespawningOn
			Respawn(aliasToRespawn)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction

ObjectReference function GetRespawnMarker(ObjectReference[] markers)
		; totally unnecessary but nice randomization of which point to choose
	int tryIndex = RandomInt(0, markers.Length - 1)
	DefaultScriptFunctions.DefaultScriptTrace(self + " rolling for respawn spot... " + tryIndex, ShowTraces)

	; find a spot the player can't see
	actor playerActor = Game.GetPlayer() as actor
	ObjectReference marker	; the marker we'll return to respawn at

	int loopCount = 0	; we'll use this to make sure we only loop through once
	while loopCount < markers.Length
		if markers[tryIndex] != None && playerActor.HasDetectionLOS(markers[tryIndex]) == False && playerActor.GetDistance(markers[tryIndex]) > minRespawnDistance
			; player doesn't have LOS on this marker, and is outside min distance - pick it
			return markers[tryIndex]
		else
			loopCount = loopCount + 1
			; increment index
			if tryIndex >= markers.Length - 1
				; we're at the end, start over
				tryIndex = 0
			else
				tryIndex = tryIndex + 1
			endif
		endif
	endWhile

	; we didn't find a marker so use the failsafe
	return RespawnMarkerFailsafe

endFunction