Scriptname MoveRefToMeOnDeath extends Actor Const
{This script moves a linked object to this actor on death, meant for commentary markers}

Keyword Property LinkCustom01 Auto Const

Event OnDeath(Actor akKiller)
	if LinkCustom01
		objectReference myObject = GetLinkedRef(LinkCustom01)
		if myObject
			objectReference objSelf = self as ObjectReference
			myObject.moveto(objSelf)
		endif
	endif
EndEvent