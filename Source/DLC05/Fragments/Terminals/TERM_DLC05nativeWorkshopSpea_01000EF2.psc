;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC05:Fragments:Terminals:TERM_DLC05nativeWorkshopSpea_01000EF2 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ChangePitch(akterminalRef, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ChangePitch(akterminalRef, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ChangePitch(akterminalRef, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
ChangePitch(akterminalRef, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
ChangePitch(akterminalRef, 4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function ChangePitch(ObjectReference terminalRef, int iNewPitch)
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)
	int i = 0
	while i < linkedRefArray.length
		WorkshopPoweredSpeakerScript theObject = linkedRefArray[i] as WorkshopPoweredSpeakerScript
		debug.trace(self + " " + i + ": " + theObject)
		if theObject
			theObject.ChangePitch(iNewPitch)
		endif
		i += 1
	endWhile
EndFunction


Keyword Property LinkTerminalKeyword Auto Const


