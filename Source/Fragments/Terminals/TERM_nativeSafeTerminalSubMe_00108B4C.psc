;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeSafeTerminalSubMe_00108B4C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalSafe)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalSafe)
     linkedRefChain[i].lock(1)
     i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalSafe)
debug.trace("Native Terminal: Safes")
debug.trace("Attempt to unlock "+akTerminalRef.getLinkedRef(LinkTerminalSafe))
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalSafe)
     linkedRefChain[i].Unlock()
     i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSafe Auto Const
