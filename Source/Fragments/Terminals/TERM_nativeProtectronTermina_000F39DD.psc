;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeProtectronTermina_000F39DD Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("TERMINAL: set up globals for protectron info")
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalProtectron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	i += 1
endWhile

gTestProtectronCount.setValue(i)
akTerminalRef.addTextReplacementData("Connected", gTestProtectronCount)

debug.trace("TERMINAL: gTestProtectronCount= "+gTestProtectronCount.getValue())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalProtectron Auto Const

GlobalVariable Property gTestProtectronCount Auto Const
