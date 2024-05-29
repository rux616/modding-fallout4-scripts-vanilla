;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN137ProtectronSubMenu_00176434 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Protectron Terminal: Sent Wake Up Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkCustom01)

int i = 0

while i < akTerminalRef.countLinkedRefChain(LinkCustom01)
	debug.trace("Terminal/Native Protrectron: Powering Up ref: "+linkedrefChain[i])
	Actor CurrentActor = (linkedRefChain[i] as actor)
	if !CurrentActor.IsDead()
		CurrentActor.setValue(ProtectronPodStatus, 1)
		CurrentActor.setUnconscious(FALSE)
		CurrentActor.evaluatePackage()
		(linkedRefChain[i] as DrinkingBuddyprotectronScript).SetDrinkingBuddyAwake()
	Endif
	i += 1
endWhile

DialogueDrinkingBuddy.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property ProtectronPodStatus Auto Const

Keyword Property LinkCustom01 Auto Const

Quest Property DialogueDrinkingBuddy Auto Const
