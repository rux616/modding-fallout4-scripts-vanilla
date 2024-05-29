Scriptname DLC05:WorkshopSorterScript extends DLC05:WorkshopHopperScript

group SorterData
	String Property SortNode = "SortNode" auto const
	String Property SortNodeLarge = "SortNodeLarge" auto const
	Sound Property SortSuccessSound auto const mandatory

	Vector property sortVector auto const
	{ set to how much x/y/z direction you want to the force applied }

endGroup 

function TryToFireProjectile()
endFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
endEvent 

Event OnTriggerEnter(ObjectReference akActionRef)
	if bAllowTriggerInput
		debug.trace(self + "OnTriggerEnter akActionRef=" + akActionRef)
		if (akActionRef is Actor) == false
			; sort it
			SortItem(akActionRef)
		endif
	endif
EndEvent


function SortItem(ObjectReference refToSort)
	bFiring = true
	if IsPowered() && IsDestroyed() == false
		refToSort.Disable()
		debug.trace(self + " SortItem " + reftosort )
		String firingNode = GetSortNode(refToSort)
		refToSort.MoveToNode(self, firingNode)
		; calculate havok impulse with current rotation
	  	Vector realVector
		if firingNode == SortNodeLarge || firingNode == SortNode
			realVector = RotateVector(sortVector)			
		else
			realVector = RotateVector(baseVector)
		endif
		FireProjectile(refToSort, realVector, firingNode)				
	endif
	bFiring = false
endFunction

String function GetSortNode(ObjectReference refToSort)
	String firingNode
	if GetItemCount(refToSort.GetBaseObject()) > 0
		; sort me

		if IsLargeItem(refToSort)
			firingNode = SortNodeLarge
		else
			firingNode = SortNode
		endif
		debug.trace(self + "   SORT ME! use " + firingNode)
		SortSuccessSound.Play(self)
	else
		; spit me out other side
		if IsLargeItem(refToSort)
			firingNode = ProjectileNodeLarge
		else
			firingNode = ProjectileNode
		endif
		debug.trace(self + "   IGNORE ME! use " + firingNode)
	endif
	return firingNode
endFunction

bool function IsLargeItem(ObjectReference refToCheck)
	; check for large item node
	return ( LargeItemFormList && LargeItemFormList.HasForm(refToCheck.GetBaseObject()) )
endFunction