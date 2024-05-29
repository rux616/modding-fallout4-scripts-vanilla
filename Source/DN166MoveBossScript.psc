Scriptname DN166MoveBossScript extends ObjectReference Hidden Const

Keyword Property LinkCustom01 Auto Const

Event OnActivate(ObjectReference akActionRef)
    if (GetLinkedRef(LinkCustom01) as Actor).IsDead() == FALSE
    	GetLinkedRef(LinkCustom01).MoveTo(GetLinkedRef(LinkCustom01).GetLinkedRef())
    endif
EndEvent