;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeDoorTerminalSubMe_00108BC3 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoor)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
	(linkedRefChain[i].setOpen())
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoor)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
	(linkedRefChain[i].setOpen(false))
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalDoor Auto Const
