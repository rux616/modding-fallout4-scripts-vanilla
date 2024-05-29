Scriptname MQ101RunnerRespawnTriggerScript extends ObjectReference Const

ObjectReference Property SpawnRunnersMarker01 Auto Const
ObjectReference Property SpawnRunnersMarker02 Auto Const
Faction Property MQ101RunnerRespawnFaction Auto Const
Faction Property MQ101RunnerRespawnFaction02 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If (akActionRef as Actor).IsInFaction(MQ101RunnerRespawnFaction)
		Actor PlayerREF = Game.GetPlayer()
		If (PlayerREF.HasDetectionLos(akActionRef) == False) && (PlayerREF.HasDetectionLos(SpawnRunnersMarker01) == False)
			akActionRef.moveto(SpawnRunnersMarker01)
		EndIf
	ElseIf (akActionRef as Actor).IsInFaction(MQ101RunnerRespawnFaction02)
		Actor PlayerREF = Game.GetPlayer()
		If (PlayerREF.HasDetectionLos(akActionRef) == False) && (PlayerREF.HasDetectionLos(SpawnRunnersMarker02) == False)
			akActionRef.moveto(SpawnRunnersMarker02)
		EndIf
	EndIf
EndEvent