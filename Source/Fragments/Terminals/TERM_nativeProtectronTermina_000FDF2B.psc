;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeProtectronTermina_000FDF2B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Protectron Terminal: Sent Shut Down Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalProtectron)

debug.trace("akTerminalRef.getLinkedrefChain(linkTerminalProtectron) = "+akTerminalRef.getLinkedrefChain(linkTerminalProtectron))

int i = 0

while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	debug.trace("Terminal/Native Protrectron: Shutting down ref: "+linkedrefChain[i])
	Actor Protectron = linkedRefChain[i] as actor
	ProtectronScript ProScript = Protectron as ProtectronScript
	ProScript.busy = true 
	Protectron.activate(akTerminalRef)
	Protectron.setValue(ProtectronPodStatus, 0)
	Protectron.evaluatePackage()

	if Protectron.getValue(MiscStatRobotHasBeenDisabled) == 0
		game.incrementStat("Robots Disabled", 1)
		Protectron.setValue(MiscStatRobotHasBeenDisabled, 1)
	endif

	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Protectron Terminal: Sent Wake Up Signal")

objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalProtectron)

int i = 0

while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	debug.trace("Terminal/Native Protrectron: Powering Up ref: "+linkedrefChain[i])
	Actor Protectron = linkedRefChain[i] as actor
	ProtectronScript ProScript = Protectron as ProtectronScript
	ProScript.busy = true 
	Protectron.setValue(ProtectronPodStatus, 1)
	Protectron.activate(akTerminalRef)
	Protectron.evaluatePackage()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property ProtectronPodStatus Auto Const

Keyword Property LinkTerminalProtectron Auto Const

ReferenceAlias Property defaultProtectronVIPescort Auto Const

ActorValue Property MiscStatRobotHasBeenDisabled Auto Const
