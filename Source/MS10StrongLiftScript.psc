Scriptname MS10StrongLiftScript extends ReferenceAlias Hidden

Quest Property MS10 Auto

ObjectReference Property JumpMarker Auto
ObjectReference Property LiftButton Auto

Event OnGetUp(ObjectReference akFurniture)
    if akFurniture == JumpMarker
    	LiftButton.Activate(Game.GetPlayer())
    endif
EndEvent

Event OnSit(ObjectReference akFurniture)
    if akFurniture == JumpMarker
    	MS10.SetStage(618)
    endif
EndEvent