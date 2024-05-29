Scriptname DLC01:WorkshopResourceTargetParentScript extends Quest

struct ResourceType
	ObjectReference resourceMarker ; this gives the name and is used as a proxy for the actual component
endStruct

ResourceType[] property ResourceTypeArray auto const
{ array of resource types - used to match leveled list with "resource marker" for specific component type }

ActorValue Property DLC01WorkshopResourceTargetActive auto const
{ used by terminals to track when a quest is active }

CustomEvent DLC01ResourceTargetStopEvent ; event sent to tell quest associated with a particular terminal to stop

ObjectReference function GetResourceMarker(int resourceTypeIndex)
	if resourceTypeIndex > -1 && resourceTypeIndex < ResourceTypeArray.Length
		return ResourceTypeArray[resourceTypeIndex].resourceMarker
	else
		return NONE
	endif
endFunction

function SendResourceTargetStopEvent(ObjectReference terminalRef, int eventID)
	; send custom stop event
	Var[] kargs = new Var[2]
	kargs[0] = terminalRef
	kargs[1] = eventID
	; 1 = stop active scan (tell eyebot to return)
	; 2 = stop quest
	SendCustomEvent("DLC01ResourceTargetStopEvent", kargs)		
endFunction
