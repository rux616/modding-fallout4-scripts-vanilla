;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeProtectronTermina_001CB005 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(0, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(1, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(2, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(3, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(4, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
SetPersonalityParam(5, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

actorvalue property ProtectronPersonalityValue auto const
keyword property linkTerminalProtectron auto const

function SetPersonalityParam(int iPersonalityvalue, ObjectReference akTerminalRef)

	debug.trace("Protectron Terminal: Changing personality type to "+iPersonalityvalue)
	debug.trace("0: Default")
	debug.trace("1: Subway")
	debug.trace("2: Police")
	debug.trace("3: Fire")
	debug.trace("4: Medical")
	debug.trace("5: Construction")

	objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(linkTerminalProtectron)

	int i = 0

	while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
		debug.trace("Terminal/Native Protrectron: Setting Personality for: "+linkedrefChain[i])
		(linkedRefChain[i] as actor).setValue(ProtectronPersonalityValue, iPersonalityvalue)
		i += 1
	endWhile

EndFunction
