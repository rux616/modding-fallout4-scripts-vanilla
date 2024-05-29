Scriptname TestJBEnableDisableScript extends ObjectReference Hidden

ObjectReference myLink

Event OnLoad()
	myLink = getLinkedRef()    
EndEvent

Event OnTriggerEnter(ObjectReference akActivator)
	debug.notification("entered Trigger")
	myLink.enable()
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	debug.notification("left Trigger")
	myLink.disable()
EndEvent

