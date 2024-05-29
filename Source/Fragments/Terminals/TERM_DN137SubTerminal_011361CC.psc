;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN137SubTerminal_011361CC Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Protectron Terminal: Sent Wake Up Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkCustom01)

int i = 0

while i < akTerminalRef.countLinkedRefChain(LinkCustom01)
	debug.trace("Terminal/Native Protrectron: Powering Up ref: "+linkedrefChain[i])
	(linkedRefChain[i] as actor).setValue(ProtectronPodStatus, 1)
	(linkedRefChain[i] as actor).setUnconscious(FALSE)
	(linkedRefChain[i] as actor).evaluatePackage()
	i += 1
endWhile

DialogueDrinkingBuddy.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property ProtectronPodStatus Auto Const

Keyword Property LinkCustom01 Auto Const

Quest Property DialogueDrinkingBuddy Auto Const
