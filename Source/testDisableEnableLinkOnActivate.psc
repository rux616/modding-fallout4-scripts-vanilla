Scriptname testDisableEnableLinkOnActivate extends ObjectReference


objectReference property myLinkedRef auto hidden

Event onLoad()

endEvent


Event OnActivate(objectReference akActivator)
	myLinkedRef = self.GetLinkedRef()
	if myLinkedRef
		if myLinkedRef.isDisabled()
			myLinkedRef.Enable()
		else
			myLinkedRef.Disable()
		endif
	endif

endEvent