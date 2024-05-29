;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeWorkshopSpotlight_0022BF7A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetSpotlightTarget(1, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetSpotlightTarget(0, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
function SetSpotlightTarget(int iNewTarget, ObjectReference terminalRef = NONE)
	
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	int i = 0
	while i < linkedRefArray.length
		Actor theSpotlight = linkedRefArray[i] as Actor
		debug.trace(self + " " + i + ": " + theSpotlight)
		if theSpotlight
			theSpotlight.SetValue(WorkshopSpotlightTarget, iNewTarget)
			theSpotlight.EvaluatePackage(true)
		endif
		i += 1
	endWhile
	
EndFunction

Keyword Property LinkTerminalKeyword Auto Const

ActorValue Property WorkshopSpotlightTarget auto const
