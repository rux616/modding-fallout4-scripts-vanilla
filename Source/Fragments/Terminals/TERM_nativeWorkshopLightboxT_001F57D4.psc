;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeWorkshopLightboxT_001F57D4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.SetValue(WorkshopTerminalLightColor, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
CycleLightColor(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
function CycleLightColor(ObjectReference akTerminalRef)
	RandomizeLightColor(akTerminalRef)
EndFunction

function RandomizeLightColor(ObjectReference akTerminalRef)
	ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalKeyword)

	int i = 0

	while i < linkedRefArray.length
		WorkshopLightboxScript theObject = linkedRefArray[i] as WorkshopLightboxScript
		; randomize starting color
		int iNewColor = Utility.RandomInt(0, theObject.LightColors.Length - 1)
		; pick random brightness
		int iNewBrightness = Utility.RandomInt(0, theObject.LightBrightness.Length - 1)

		debug.trace(self + " " + i + ": " + theObject + " color=" + iNewColor + " brightness=" + iNewBrightness)
		if theObject
			theObject.SetColor(iNewColor, iNewBrightness)
		endif
		i += 1
	endWhile
EndFunction

Keyword Property LinkTerminalKeyword Auto Const

ActorValue Property WorkshopTerminalLightColor Auto Const
