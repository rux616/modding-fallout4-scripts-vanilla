;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC05:Fragments:Terminals:TERM_DLC05nativeWorkshopBuil_01000A6E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetRecipe(0, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetRecipe(1, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SetRecipe(2, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SetRecipe(3, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
SetRecipe(4, akterminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function SetRecipe(int newRecipeIndex, ObjectReference terminalRef)
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	DLC05:WorkshopBuilderScript builderRef

	int i = 0
	while i < linkedRefArray.length
		ObjectReference theObject = linkedRefArray[i] 
		debug.trace(self + " " + i + ": " + theObject)
		if theObject is DLC05:WorkshopBuilderScript
			(theObject as DLC05:WorkshopBuilderScript).SetCurrentRecipeIndex(newRecipeIndex)
			if builderRef == NONE 
				builderRef = (theObject as DLC05:WorkshopBuilderScript)
			endif
		endif
		i += 1
	endWhile
	
	; set up text replacement data
	if builderRef 
		DLC05Init.SetTextReplacementData(terminalRef, builderRef, newRecipeIndex)
	endif
EndFunction

Keyword Property LinkTerminalKeyword Auto Const

DLC05:DLC05InitScript property DLC05Init auto const mandatory 
