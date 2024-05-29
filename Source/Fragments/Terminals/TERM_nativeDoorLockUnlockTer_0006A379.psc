;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeDoorLockUnlockTer_0006A379 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoorLockUnlock)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoorLockUnlock)
	(linkedRefChain[i].Unlock())
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoorLockUnlock)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoorLockUnlock)
	(linkedRefChain[i].setLockLevel(253))
                (linkedRefChain[i].Lock())
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalDoorLockUnlock Auto Const
