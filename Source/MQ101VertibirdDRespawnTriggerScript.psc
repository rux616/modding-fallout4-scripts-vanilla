Scriptname MQ101VertibirdDRespawnTriggerScript extends ObjectReference Const

ObjectReference Property MQ101VertbirdDRespawnMarker Auto Const
Faction Property MQ101VertibirdRespawnFaction Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If (akActionRef as Actor).IsInFaction(MQ101VertibirdRespawnFaction)
		Utility.wait(30.0)
		akActionRef.moveto(MQ101VertbirdDRespawnMarker)
	EndIf
EndEvent