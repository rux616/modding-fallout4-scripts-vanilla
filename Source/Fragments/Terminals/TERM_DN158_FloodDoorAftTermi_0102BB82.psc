;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN158_FloodDoorAftTermi_0102BB82 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain()
int i = 0
while i < akTerminalRef.countLinkedRefChain()
	(linkedRefChain[i].setOpen())
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain()
int i = 0
while i < akTerminalRef.countLinkedRefChain()
	(linkedRefChain[i].setOpen(false))
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
