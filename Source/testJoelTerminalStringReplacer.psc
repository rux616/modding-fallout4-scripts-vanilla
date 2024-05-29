Scriptname testJoelTerminalStringReplacer extends ObjectReference Const
{This script handles text replacement for native terminals}

import debug

faction property factionToShow auto const
message property messageToShow auto const
actorBase Property actorToShow const auto

GlobalVariable Property gNativeTermTurretsConnected Auto Const
GlobalVariable Property gNativeTermTurretsStatus Auto Const
GlobalVariable Property gNativeTermProtectronsConnected Auto Const
GlobalVariable Property gNativeTermAssaultronsConnected Auto Const

Keyword Property LinkTerminalTurret Auto Const
Keyword Property LinkTerminalProtectron Auto Const
Keyword Property LinkTerminalAssaultron Auto Const

faction property turretFaction auto const

message property terminalTurretStatusOnline auto const
message property terminalTurretStatusOffline auto const
message property terminalTurretStatusSearching auto const
message property terminalTurretStatusCombat auto const
message property terminalTurretStatusNoncombat auto const
message property terminalTurretStatusDead auto const

; more test hijacking...
Quest Property DNMasterQuest Auto Const
ReferenceAlias Property terminalToReceiveGlobal Auto Const



Event OnLoad()
    ; let's try to set up replacemennt text.
    addtextreplacementData("Faction", factionToShow)
    addtextreplacementData("Message", messageToShow)
    ; syntax in-editor = <Token.Name=Message>
    addtextreplacementData("Actor", actorToShow)

    trace("text repl. data added.")

    ; UNRELATED!!!!!  Hijacking this script to test linked ref on native-loaded subterminals
    debug.trace("Terminal linked protectron = "+getLinkedRef(LinkTerminalProtectron))
    debug.trace("Terminal linked ref, no keyword = "+getLinkedRef())
    ; END UNRELATED THING
;EndEvent

    debug.trace("TERMINAL: Attempt to force alias for global repl. text")
    terminalToReceiveGlobal.forceRefTo(self)
    debug.trace("TERMINAL: alias is now: "+terminalToReceiveGlobal)

    debug.trace("TERMINAL: attempting to set globals for text replacement")
    ; upon activation, set some sweet globals to make sure the status panel displays as it should.

    debug.trace("TERMINAL: Counting Linked Items")
    gNativeTermTurretsConnected.setValue(countLinkedRefChain(linkTerminalTurret))
    dnmasterQuest.UpdateCurrentInstanceGlobal(gNativeTermTurretsConnected)
    addtextreplacementData("TurretsConnected", gNativeTermTurretsConnected)
    debug.trace("TERMINAL: Turret Count: "+gNativeTermTurretsConnected.getValue())

    ; count up linked robots, update global
    gNativeTermProtectronsConnected.setValue(countLinkedRefChain(LinkTerminalProtectron))
    dnmasterquest.UpdateCurrentInstanceGlobal(gNativeTermProtectronsConnected)
    addtextreplacementData("ProtectronsConnected", gNativeTermProtectronsConnected)
    debug.trace("TERMINAL: Protectron Count: "+gNativeTermProtectronsConnected.getValue())

    gNativeTermAssaultronsConnected.setValue(countLinkedRefChain(LinkTerminalAssaultron))
    dnmasterquest.UpdateCurrentInstanceGlobal(gNativeTermAssaultronsConnected)
    addtextreplacementData("AssaultronsConnected", gNativeTermAssaultronsConnected)
    debug.trace("TERMINAL: Assaultron Count: "+gNativeTermAssaultronsConnected.getValue())


    ; Check faction info for turrets
    if (getLinkedRef(linkTerminalTurret)).getFactionOwner()
        ; Faction Ownership takes precedence
        debug.trace("TERMINAL: refresh text replacement data (faction)")
        addtextreplacementData("TurretFaction", (getLinkedRef(linkTerminalTurret)).getFactionOwner())
        debug.trace("TERMINAL: Faction = "+(getLinkedRef(linkTerminalTurret)).getFactionOwner())
    else
        debug.trace("TERMINAL: no faction owner for turret: "+getLinkedref(linkTerminalTurret))
        addtextreplacementData("TurretFaction", turretFaction)
        debug.trace("TERMINAL: Faction = "+turretFaction)
    endif

    ;DEBUG.TRACE("TERMINAL: Am I dead? "+(getLinkedref(linkTerminalTurret) as actor).isDead())
    if (getLinkedref(linkTerminalTurret) as actor).isDead()
        addtextReplacementData("TurretOnStatus", terminalTurretStatusDead)
        else
        if ((getLinkedref(linkTerminalTurret) as actor).isUnconscious())
            addtextreplacementData("TurretOnStatus", terminalTurretStatusOffline)
        else
            addtextreplacementData("TurretOnStatus", terminalTurretStatusOnline)
        endif
    endif

    if (getLinkedref(linkTerminalTurret) as actor).getCombatState() == 0
        addTextReplacementData("TurretAIstatus", terminalTurretStatusNonCombat)
    elseif (getLinkedref(linkTerminalTurret) as actor).getCombatState() == 1
        addTextReplacementData("TurretAIstatus", terminalTurretStatusCombat)
    else
        addTextReplacementData("TurretAIstatus", terminalTurretStatusSearching)
    endif


EndEvent
Faction Property RobotFaction Auto Const
