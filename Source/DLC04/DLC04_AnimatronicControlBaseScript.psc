Scriptname DLC04:DLC04_AnimatronicControlBaseScript extends ObjectReference 

bool property shouldAnimate = True Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if ((akActionRef == Game.GetPlayer()) && shouldAnimate)
    		PlayAnimation("anim01")
	EndIf
EndEvent