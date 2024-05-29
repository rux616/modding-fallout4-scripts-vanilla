Scriptname DLC06:WorkshopObjectNoMultiResourceScript extends workshopobjectscript
{ override parent script functions to block multiresource designation }

; returns true if this object has a "multi resource" actor value
bool function HasMultiResource()
	return false
endFunction


; returns "multi resource" actor value, if any; otherwise returns NONE
ActorValue function GetMultiResourceValue()
	return NONE
endFunction
