;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeWorkshopLightboxT_00210C73 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ChangeCycleType(1, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ChangeCycleType(2, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ChangeCycleType(0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function ChangeCycleType(int newType, ObjectReference terminalRef)	
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	int i = 0
	while i < linkedRefArray.length
		WorkshopLightboxScript theObject = linkedRefArray[i] as WorkshopLightboxScript 
		debug.trace(self + " " + i + ": " + theObject)
		if theObject
			theObject.SetCyclingType(newType)
		endif
		i += 1
	endWhile
	
EndFunction

Keyword Property LinkTerminalKeyword Auto Const

ActorValue Property WorkshopLightboxCyclingType Auto Const
