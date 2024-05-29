;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeWorkshopLightboxT_001F57D6 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
int lightColor = akTerminalRef.GetValue(WorkshopTerminalLightColor) as int
SetLightColor(akTerminalRef, lightColor, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
int lightColor = akTerminalRef.GetValue(WorkshopTerminalLightColor) as int
SetLightColor(akTerminalRef, lightColor, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
int lightColor = akTerminalRef.GetValue(WorkshopTerminalLightColor) as int
SetLightColor(akTerminalRef, lightColor, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function SetLightColor(ObjectReference akTerminalRef, int iNewColor, int iNewBrightness)
	ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalMotor)

	int i = 0
	while i < linkedRefArray.length
		WorkshopLightboxScript theObject = linkedRefArray[i] as WorkshopLightboxScript
		debug.trace(self + " " + i + ": " + theObject + " color=" + iNewColor + " brightness=" + iNewBrightness)
		if theObject
			theObject.SetColor(iNewColor, iNewBrightness)
		endif
		i += 1
	endWhile
EndFunction

Keyword Property LinkTerminalMotor Auto Const

ActorValue Property WorkshopTerminalTimerIntervalType Auto Const

ActorValue Property WorkshopTerminalLightColor Auto Const
