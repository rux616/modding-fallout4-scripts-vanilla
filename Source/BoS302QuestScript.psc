Scriptname BoS302QuestScript extends Quest

ObjectReference Property BoS302HaylenSpawnMarker01 Auto Const
ObjectReference Property BoS302HaylenSpawnMarker02 Auto Const
ObjectReference Property BoS302HaylenSpawnMarker03 Auto Const
ReferenceAlias Property Alias_BoS302Haylen Auto Const

Function HaylenSpawn()

if (Game.GetPlayer().HasDetectionLOS(BoS302HaylenSpawnMarker01)) == false
  	Debug.Trace("BoS302Spawn->The player can't see Marker01")
  	Alias_BoS302Haylen.GetActorRef().MoveTo(BoS302HaylenSpawnMarker01)
  	Alias_BoS302Haylen.GetActorRef().EvaluatePackage()
elseif (Game.GetPlayer().HasDetectionLOS(BoS302HaylenSpawnMarker02)) == false
  	Debug.Trace("BoS302Spawn->The player can't see Marker02")
  	Alias_BoS302Haylen.GetActorRef().MoveTo(BoS302HaylenSpawnMarker02)
  	Alias_BoS302Haylen.GetActorRef().EvaluatePackage()
elseif (Game.GetPlayer().HasDetectionLOS(BoS302HaylenSpawnMarker03)) == false
  	Debug.Trace("BoS302Spawn->The player can't see Marker03")
	Alias_BoS302Haylen.GetActorRef().MoveTo(BoS302HaylenSpawnMarker03)
	Alias_BoS302Haylen.GetActorRef().EvaluatePackage()
else
	Debug.Trace("BoS302Spawn->Haylen Moved using Failsafe")
  	Alias_BoS302Haylen.GetActorRef().MoveTo(BoS302HaylenSpawnMarker01)
  	Alias_BoS302Haylen.GetActorRef().EvaluatePackage()
endif	

endFunction