Scriptname MS10RexLiftScript extends ReferenceAlias Hidden

Quest Property MS10 Auto
ObjectReference Property FirstBox Auto
ObjectReference Property SecondBox Auto

Event OnGetUp(ObjectReference akFurniture)
    if akFurniture == FirstBox
    	MS10.SetStage(610)
    endif
    if akFurniture == SecondBox
    	MS10.SetStage(710)
    endif
EndEvent