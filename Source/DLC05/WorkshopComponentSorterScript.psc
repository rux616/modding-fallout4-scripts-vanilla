Scriptname DLC05:WorkshopComponentSorterScript extends DLC05:WorkshopSorterScript


String function GetSortNode(ObjectReference refToSort)
	String firingNode

	; check if refToSort has any of the components in my inventory
	Component[] components = DLC05Init.Components
	int i = 0
	bool bSortMe = false
	while i < components.Length && bSortMe == false
		Component theComponent = components[i]
		if GetComponentCount(theComponent) > 0
			MiscObject refToSortMisc = refToSort.GetBaseObject() as MiscObject
			if refToSortMisc && refToSortMisc.GetObjectComponentCount(theComponent) > 0
				bSortMe = true 
			endif
		endif
		i += 1
	endWhile

	if bSortMe
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