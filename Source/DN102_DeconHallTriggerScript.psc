Scriptname DN102_DeconHallTriggerScript extends ObjectReference
{Trigger in the gas-filled Decontamination Hall. Plays coughing scenes related to the gas.}


Scene property DN102_DeconHallPlayerCoughing Auto Const Mandatory
{Player coughing scene.}

Scene property DN102_DeconHallEnemyCoughing Auto Const Mandatory
{Enemy coughing scene.}

ReferenceAlias property DN102_LabDemoAffectedEnemy Auto Const Mandatory
{Alias used in the enemy coughing scene. Actors need to be forced into this alias for use in the scene.}

Faction property GunnerFaction Auto Const Mandatory
{Gunner faction.}


;Local refs
int playerEntryCount	;Trigger entry/exit count for the player.


Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActionActor = akActionRef as Actor
	if (akActionActor != None)
		if (akActionActor == Game.GetPlayer())
			UpdatePlayerCoughingScene(True)
		ElseIf (akActionActor.IsInFaction(GunnerFaction))
			UpdateEnemyCoughingScene(True, akActionActor)
		EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	Actor akActionActor = akActionRef as Actor
	if (akActionActor != None)
		if (akActionActor == Game.GetPlayer())
			UpdatePlayerCoughingScene(False)
		ElseIf (akActionActor.IsInFaction(GunnerFaction))
			UpdateEnemyCoughingScene(False, akActionActor)
		EndIf
	EndIf
EndEvent

Function UpdatePlayerCoughingScene(bool wasEnterEvent)
	if (wasEnterEvent)
		playerEntryCount = playerEntryCount + 1
	Else
		playerEntryCount = playerEntryCount - 1
	EndIf

	if (playerEntryCount > 0)
		DN102_DeconHallPlayerCoughing.Start()
	Else
		DN102_DeconHallPlayerCoughing.Stop()
	EndIf
EndFunction

Function UpdateEnemyCoughingScene(bool wasEnterEvent, Actor akActionActor)
	if (!DN102_DeconHallEnemyCoughing.IsPlaying() && wasEnterEvent)
		DN102_LabDemoAffectedEnemy.ForceRefTo(akActionActor)
		DN102_DeconHallEnemyCoughing.Start()
	ElseIf (DN102_DeconHallEnemyCoughing.IsPlaying() && !wasEnterEvent && (DN102_LabDemoAffectedEnemy.GetActorRef() == akActionActor))
		DN102_DeconHallEnemyCoughing.Stop()
		DN102_LabDemoAffectedEnemy.Clear()
	EndIf
EndFunction