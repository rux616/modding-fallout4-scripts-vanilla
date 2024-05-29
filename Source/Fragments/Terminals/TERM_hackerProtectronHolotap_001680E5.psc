;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackerProtectronHolotap_001680E5 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
; VIP Hijacker Fragment


ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalProtectron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
if (linkedRefChain[i] as Actor).isUnconscious()

	while utility.IsInMenuMode() == true
		utility.wait(3.0)
		(linkedRefChain[i] as Actor).setUnconscious(false)
			if defaultProtectronVIPescort.getReference() != akTerminalRef.getLinkedRef(LinkTerminalProtectron)
				defaultProtectronVIPescort.forceRefTo(akTerminalRef.getLinkedref(LinkTerminalProtectron))
			endif
			if defaultProtectronVIPlocation.GetLocation() != akTerminalRef.getLinkedRef(LinkTerminalProtectron).GetCurrentLocation()
				defaultProtectronVIPlocation.forceLocationTo(akTerminalRef.getLinkedRef(LinkTerminalProtectron).GetCurrentLocation())
			endif
; start the scene
ProtectronVIPescortScene.start()
	endwhile
else
			if defaultProtectronVIPescort.getReference() != akTerminalRef.getLinkedRef(LinkTerminalProtectron)
				defaultProtectronVIPescort.forceRefTo(akTerminalRef.getLinkedref(LinkTerminalProtectron))
			endif
			if defaultProtectronVIPlocation.GetLocation() != akTerminalRef.getLinkedRef(LinkTerminalProtectron).GetCurrentLocation()
				defaultProtectronVIPlocation.forceLocationTo(akTerminalRef.getLinkedRef(LinkTerminalProtectron).GetCurrentLocation())
			endif

; start the scene
ProtectronVIPescortScene.start()

endif
		i += 1
endWhile





; force alias if it's already filled
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalProtectron)

int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	Actor currentProtectron = linkedRefChain[i] as actor
	currentProtectron .setValue(Aggression, 3)
	currentProtectron .setValue(IgnorePlayerWhileFrenzied, 3)
	currentProtectron .stopCombat()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalProtectron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	(linkedRefChain[i] as actor).stopCombat()
	(linkedRefChain[i] as actor).removeFromAllFactions()
	(linkedRefChain[i] as actor).setFactionRank(playerAllyFaction, 2)
	(linkedRefChain[i]).setFactionOwner(playerAllyFaction)
	(linkedRefChain[i] as actor).setValue(Aggression,1)
	i += 1
endWhile

debug.trace("holotape: update faction string replacer!")
akTerminalRef.addtextreplacementData("Faction", PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
keyword property LinkTerminalProtectron auto const
referenceAlias property defaultProtectronVIPescort auto const
locationAlias property defaultProtectronVIPlocation auto const
scene property ProtectronVIPescortScene auto const
scene property ProtectronShutdownReceived auto const
faction property playerAllyFaction auto const
faction property playerFaction auto const
ActorValue Property Aggression Auto Const
Keyword Property LinkCustom01 Auto Const
ActorValue Property ProtectronPodStatus Auto Const

ActorValue Property IgnorePlayerWhileFrenzied Auto Const

