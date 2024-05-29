Scriptname DLC04:AliasRemoveItemIfNotTaken extends ReferenceAlias
{removes objectref if not picked up by the time the quest shuts down}

ObjectReference SelfRef
ObjectReference ContainerRef

Event OnAliasInit()
    SelfRef = GetReference()
    ContainerRef = SelfRef.GetContainer()
EndEvent

Event OnAliasShutdown()
  
    ObjectReference currentContainer = SelfRef.GetContainer()

    if currentContainer == ContainerRef

    	debug.trace(self + "OnAliasShutdown() removing self, because not yet removed from my container")

    	currentContainer.RemoveItem(SelfRef)

	   	;remove pointers
	   	ContainerRef = None
	    SelfRef = None
	endif

EndEvent

