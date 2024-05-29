;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeTripwireTerminalS_001680DF Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalTripwire)
int i = 0
while i < akTerminalRef.countLinkedRefChain(linkTerminalTripwire)
	debug.trace("TERMINAL: Attempt to shut down "+linkedRefChain[i])
	(linkedRefChain[i]).activate(akTerminalRef)
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalTripwire)
int i = 0
while i < akTerminalRef.countLinkedRefChain(linkTerminalTripwire)
	(linkedRefChain[i]).activate(akTerminalRef)
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalTripwire Auto Const
