Scriptname DLC03:DLC03_VimDoorOpenScript extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const Mandatory

Event OnActivate(ObjectReference AkActivator)
	ObjectReference currentLink = getLinkedRef()
	ObjectReference doorParent = getLinkedRef(LinkCustom01)
	utility.wait(0.5)
	int isOpen = doorParent.GetOpenState()
	bool ShouldOpen = false
	if isOpen == 1 || isOpen == 2
		ShouldOpen = true
	endif
	while currentLink
		currentLink.SetOpen(ShouldOpen)
		currentLink = currentLink.getLinkedRef()
	endwhile
EndEvent