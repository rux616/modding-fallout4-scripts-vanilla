;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeAssaultronTermina_001680CF Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Assaultron Terminal: Sent Wake Up Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalAssaultron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalAssaultron)
	debug.trace("Terminal/Native Assaultron: Powering Up ref: "+linkedrefChain[i])
	;(linkedRefChain[i] as actor).setValue(ProtectronPodStatus, 1)
	(linkedRefChain[i] as actor).setUnconscious(TRUE)
	(linkedRefChain[i] as actor).evaluatePackage()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Assaultron Terminal: Sent Wake Up Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalAssaultron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalAssaultron)
	debug.trace("Terminal/Native Assaultron: Powering Up ref: "+linkedrefChain[i])
	;(linkedRefChain[i] as actor).setValue(ProtectronPodStatus, 1)
	(linkedRefChain[i] as actor).setUnconscious(FALSE)
	(linkedRefChain[i] as actor).evaluatePackage()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalAssaultron Auto Const
