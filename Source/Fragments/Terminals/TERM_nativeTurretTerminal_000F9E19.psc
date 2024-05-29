;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeTurretTerminal_000F9E19 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("TERMINAL: set up globals for turret info")
debug.trace("TERMINAL: Begin new array population")
objectReference[] linkedTurrets = akTerminalRef.getLinkedRefArray(linkTerminalTurret)

debug.trace("TERMINAL: My array is linkedTurrets is: "+linkedTurrets)

;;;; Figure out how many turrets are connected
debug.trace("TERMINAL: Counting Linked Items")
gNativeTermTurretsConnected.setValueInt(linkedTurrets.length)
dnmasterQuest.UpdateCurrentInstanceGlobal(gNativeTermTurretsConnected)
akTerminalRef.addtextreplacementData("TurretsConnected", gNativeTermTurretsConnected)
debug.trace("TERMINAL: Turret Count: "+gNativeTermTurretsConnected.getValueInt())

int i = 0
while i < linkedTurrets.length
	Actor actorTurret = linkedTurrets[i] as Actor
	if actorTurret .IsDead() != 1
		i = linkedTurrets.length
		gNativeTermTurretsStatus.SetValueInt(0)

		if actorTurret.IsUnconscious() == 1
			gNativeTermTurretsStatus.SetValueInt(1)

		endif
	else
		gNativeTermTurretsStatus.SetValueInt(2)
		
	endif

i += 1
endWhile


;;;; Text Replace - If I have faction owner, use that data.  Otherwise use default faction.
DEBUG.TRACE("TERMINAL: Linked Turret Faction Owner is: "+akTerminalRef.getLinkedRef(linkTerminalTurret).getFactionOwner())
debug.trace("TERMINAL: refresh text replacement data (faction)")

if (akTerminalRef.getLinkedRef(linkTerminalTurret)).getFactionOwner() != NONE
	debug.trace("TERMINAL: Faction = "+(akTerminalRef.getLinkedRef(linkTerminalTurret)).getFactionOwner())
	akTerminalRef.addtextreplacementData("TurretFaction", (akTerminalRef.getLinkedRef(linkTerminalTurret)).getFactionOwner())
else
	debug.trace("TERMINAL: no faction owner for turret: "+akTerminalRef.getLinkedref(linkTerminalTurret))
	akTerminalRef.addtextreplacementData("TurretFaction", turretFaction)
endif 

;;;; Check and update AI statuses
if (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).isDead()
	akTerminalRef.addtextReplacementData("TurretOnStatus", terminalTurretStatusDead)
	else
	if ((akTerminalRef.getLinkedref(linkTerminalTurret) as actor).isUnconscious())
		akTerminalRef.addtextreplacementData("TurretOnStatus", terminalTurretStatusOffline)
	else
		akTerminalRef.addtextreplacementData("TurretOnStatus", terminalTurretStatusOnline)
	endif
endif

if (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).getCombatState() == 0
	akTerminalRef.addTextReplacementData("TurretAIstatus", terminalTurretStatusNonCombat)
elseif (akTerminalRef.getLinkedref(linkTerminalTurret) as actor).getCombatState() == 1
	akTerminalRef.addTextReplacementData("TurretAIstatus", terminalTurretStatusCombat)
else
	akTerminalRef.addTextReplacementData("TurretAIstatus", terminalTurretStatusSearching)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalTurret Auto Const
GlobalVariable Property gNativeTermTurretsConnected Auto Const
Message Property terminalTurretStatusDead Auto Const
Message Property terminalTurretStatusOnline Auto Const
Message Property terminalTurretStatusOffline Auto Const
Message Property terminalTurretStatusCombat Auto Const
Message Property terminalTurretStatusSearching Auto Const
Message Property terminalTurretStatusNonCombat Auto Const
Faction Property TurretFaction Auto Const
Quest property dnmasterQuest auto const

GlobalVariable Property gNativeTermTurretsStatus Auto Const
