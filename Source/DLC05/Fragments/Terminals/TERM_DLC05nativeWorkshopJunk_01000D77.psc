;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC05:Fragments:Terminals:TERM_DLC05nativeWorkshopJunk_01000D77 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("-45Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("-30Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("-15Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("0Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("15Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("30Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("45Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("60Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
SetFiringAngle("75Degrees", akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function SetFiringAngle(string newAngle, ObjectReference terminalRef)
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	int i = 0
	while i < linkedRefArray.length
		ObjectReference theObject = linkedRefArray[i] 
		debug.trace(self + " " + i + ": " + theObject)
		theObject.PlayAnimation(newAngle)
		i += 1
	endWhile
	
EndFunction

Keyword Property LinkTerminalKeyword Auto Const
