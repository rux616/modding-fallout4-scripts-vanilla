;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:hackerHolotapeProtectronScript Extends Terminal Hidden

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalProtectron)
int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalProtectron)
	(linkedRefChain[i] as actor).setValue(Aggression, 3)
	(linkedRefChain[i] as actor).stopCombat()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
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
akTerminalRef.addtextreplacementData("Faction", game.getPlayer().getActorBase())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference myProtectron = akTerminalRef.getLinkedRef(LinkTerminalProtectron)
if (myProtectron as actor).isUnconscious()
	(myProtectron as actor).setValue(ProtectronPodStatus, 1)
	(myProtectron as actor).setUnconscious(FALSE)
endif

if defaultProtectronVIPescort.getReference() != myProtectron
	defaultProtectronVIPescort.forceRefTo(myProtectron)
endif

ProtectronVIPescortScene.start()

(myProtectron as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalProtectron Auto Const

ActorValue Property Aggression Auto Const
actorValue property ProtectronPodStatus auto

Scene Property ProtectronVIPescortScene Auto Const

referenceAlias property defaultProtectronVIPescort auto const

Faction Property PlayerAllyFaction Auto Const
