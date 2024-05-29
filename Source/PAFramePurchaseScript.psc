Scriptname PAFramePurchaseScript extends ObjectReference

Furniture Property PowerArmorFrameFurnitureNoCore Auto Const
ObjectReference Property SpawnedFrameRef Auto
ObjectReference Property FrameSpawnMarker Auto Const
Message Property SpawnedFrameMessage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

  if akNewContainer == Game.GetPlayer()
    Debug.Trace("Doing frame stuff for Player")
   	SpawnedFrameRef == FrameSpawnMarker.PlaceAtMe(PowerArmorFrameFurnitureNoCore, 1, TRUE)
   	SpawnedFrameRef.MoveToNearestNavmeshLocation()
   	SpawnedFrameMessage.Show()
   	Delete()
   	Game.GetPlayer().RemoveItem(SELF)
  endIf

endEvent