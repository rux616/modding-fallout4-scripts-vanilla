Scriptname DLC03:DLC03SubKlaxonEnableMarkers extends ObjectReference

Keyword Property LinkCustom01 Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

bool bTriggerOnce = false

Function TriggerKlaxons()
	;Direct call to get klaxons active
	if !bTriggerOnce
		bTriggerOnce = true
		ActivateLinkedRefChain(LinkCustom01)
	endif
EndFunction

Event OnLoad()
	;If nuke launch stage is active, turn on klaxons on load
	if DLC03MQ06_NukeHandling.GetStageDone(100) && !bTriggerOnce
		bTriggerOnce = true
		ActivateLinkedRefChain(LinkCustom01)
	endif
EndEvent

Function ActivateLinkedRefChain(keyword linkKeyword = none)
	ObjectReference[] KlaxonRefs = GetLinkedRefChain(linkKeyword)
	int i = 0

	while i < KlaxonRefs.Length
		KlaxonRefs[i].Activate(KlaxonRefs[i])
		i += 1
	endwhile
EndFunction