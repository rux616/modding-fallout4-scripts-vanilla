;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackedTurretTerminalSub_00108B54 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Terminal fragment for "scrambling targeting parameters" of turrets by frenzying them
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalTurret)
;linkedrefchain of all linked turrets to the terminal.
int i = 0

while i < linkedRefChain.Length
;Iterate through the linked turrets and set their aggression to 3 (frenzying them) and stopcombat to reevaluate.
	Actor currentTurret = (linkedRefChain[i] as actor)
	currentTurret.setValue(Aggression, 3)
	currentTurret.setValue(IgnorePlayerWhileFrenzied, 1)
	currentTurret.SetPlayerTeammate(False)
	currentTurret.stopCombat()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
;Terminal fragment for Overriding the turrets faction with the players.
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalTurret)
;linkedrefchain of all linked turrets to the terminal.

int i = 0
while i < linkedRefChain.Length
;Iterate through the linked turrets and removeallfactions to override them with the playerfaction property and set the player as the faction owner, then set all of their aggression to 1 so they attack enemies on sight.
	
	Actor currentTurret = (linkedRefChain[i] as actor)
	currentTurret.stopCombat()
	currentTurret.SetPlayerTeammate(abCanDoFavor = False)
	currentTurret.setFactionOwner(playerFaction)
	currentTurret.setValue(Aggression,1)

	i += 1
endWhile
;Update relevant Tokens to reflect new faction owner in the terminal
akTerminalRef.addtextreplacementData("Faction", playerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
;Terminal fragment for sabotaging turrets via the sabotage spell.
ObjectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalTurret)
;linkedrefchain of all linked turrets to the terminal.

int i = 0
while i < linkedRefChain.Length
;Iterate through the linked turrets and apply the sabotage spell to each of them if they don't have it on them already.

Actor currentTurret = (linkedRefChain[i] as actor)
	if !(currentTurret.hasMagicEffect(hackerTurretSabotageEffect))
		;debug.trace("Holotape: Apply "+hackerTurretSabotageSpell+" to "+linkedrefChain[i])
		currentTurret.doCombatSpellApply(hackerTurretSabotageSpell, currentTurret)
	endif

	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalTurret Auto Const

ActorValue Property Aggression Auto Const

Faction Property PlayerFaction Auto Const

SPELL Property hackerTurretSabotageSpell Auto Const

MagicEffect Property hackerTurretSabotageEffect Auto Const

ActorValue Property IgnorePlayerWhileFrenzied Auto Const
