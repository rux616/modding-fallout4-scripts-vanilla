Scriptname testCatalogContainerContentsScript extends ObjectReference  
{A test to see if I can make a script that fills an array with every item in the container.}

ObjectReference[] property myContents auto
objectReference property mySortingBox auto

EVENT onLoad()
	registerForRemoteEvent(mySortingBox, "onItemAdded")
endEVENT

EVENT ObjectReference.onItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace("A " + akbaseItem + "was added to " + akSender)
endEVENT