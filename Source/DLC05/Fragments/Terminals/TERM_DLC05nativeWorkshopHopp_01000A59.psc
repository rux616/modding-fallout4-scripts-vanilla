;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC05:Fragments:Terminals:TERM_DLC05nativeWorkshopHopp_01000A59 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(5.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(10.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(25.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(50.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(100.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
SetOutputForce(150.0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function SetOutputForce(float newForce, ObjectReference terminalRef)
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	int i = 0
	while i < linkedRefArray.length
		ObjectReference theObject = linkedRefArray[i] 
		debug.trace(self + " " + i + ": " + theObject)
		if theObject is DLC05:WorkshopHopperScript
			(theObject as DLC05:WorkshopHopperScript).SetOutputForce(newForce)
		endif
		i += 1
	endWhile
	
EndFunction

Keyword Property LinkTerminalKeyword Auto Const
