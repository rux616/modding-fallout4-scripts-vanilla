Scriptname DNPrime_PrimeAliasScript extends ReferenceAlias Hidden
{Script on the Prime alias on DNPrime_BoS304. Handles OnSit/OnGetUp events}

Quest Property DNPrime_BoS304 Auto Const

ObjectReference Property PunchGround Auto Const

ReferenceAlias Property Behemoth Auto Const

;************************************

Event OnSit(ObjectReference akFurniture)
	if akFurniture == PunchGround
		;Prime used the punch ground furniture
		DNPrime_BoS304.SetStage(600)
	endif
EndEvent

;************************************

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture == PunchGround
		;Prime exited the punch ground furniture
		DNPrime_BoS304.SetStage(610)
	endif
EndEvent

;************************************