Scriptname DLC04:DLC04_AnimatronicControlOTScript extends DLC04:DLC04_AnimatronicControlBaseScript 

Event OnActivate(ObjectReference akActionRef)
    if ((akActionRef == Game.GetPlayer()) && shouldAnimate)
        PlayAnimation("anim01")
    EndIf
EndEvent