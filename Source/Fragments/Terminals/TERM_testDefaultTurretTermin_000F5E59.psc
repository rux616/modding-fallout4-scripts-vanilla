;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_testDefaultTurretTermin_000F5E59 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if gNativeTermTurretsStatus.GetValue() != 2
	ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalTurret)

	int i = 0
	while i < linkedRefArray.length
		(linkedRefArray[i] as actor).stopCombat()
		(linkedRefArray[i] as actor).setUnconscious(TRUE)
		(linkedRefArray[i] as actor).stopCombat()
		i += 1
	endWhile

	akTerminalRef.addtextreplacementData("OnStatus", terminalTurretStatusOffline)
	akTerminalRef.addtextreplacementData("AIStatus", terminalTurretStatusOffline)

	gNativeTermTurretsStatus.SetValueInt(1)

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalTurret)
int i = 0
while i < linkedRefArray.length
	(linkedRefArray[i] as actor).setUnconscious(FALSE)
	i += 1
endWhile
akTerminalRef.addtextreplacementData("OnStatus", terminalTurretStatusOnline)
gNativeTermTurretsStatus.SetValueInt(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
;NOTE - This function, setUpNodeData() is contained within the fragment script.  If you want to look at it, view the source.  (Not viewable in-editor)

Objectreference[] systemArray = akTerminalRef.getLinkedRefArray(linkTerminalTurret)

setUpNodeData(1, akTerminalRef, "LinkedNode01", "LinkedNode01HP", gNativeTermNode01HP, "LinkedNode01Online", "LinkedNode01Status", "Node01Comma", "Node01Percent", gNativeTermNode01Dist, "LinkedNode01Dist", "LinkedNode01meters", systemArray )
setUpNodeData(2, akTerminalRef, "LinkedNode02", "LinkedNode02HP", gNativeTermNode02HP, "LinkedNode02Online", "LinkedNode02Status", "Node02Comma", "Node02Percent", gNativeTermNode02Dist, "LinkedNode02Dist", "LinkedNode02meters", systemArray )
setUpNodeData(3, akTerminalRef, "LinkedNode03", "LinkedNode03HP", gNativeTermNode03HP, "LinkedNode03Online", "LinkedNode03Status", "Node03Comma", "Node03Percent", gNativeTermNode03Dist, "LinkedNode03Dist", "LinkedNode03meters", systemArray )
setUpNodeData(4, akTerminalRef, "LinkedNode04", "LinkedNode04HP", gNativeTermNode04HP, "LinkedNode04Online", "LinkedNode04Status", "Node04Comma", "Node04Percent", gNativeTermNode04Dist, "LinkedNode04Dist", "LinkedNode04meters", systemArray )
setUpNodeData(5, akTerminalRef, "LinkedNode05", "LinkedNode05HP", gNativeTermNode05HP, "LinkedNode05Online", "LinkedNode05Status", "Node05Comma", "Node05Percent", gNativeTermNode05Dist, "LinkedNode05Dist", "LinkedNode05meters", systemArray )
setUpNodeData(6, akTerminalRef, "LinkedNode06", "LinkedNode06HP", gNativeTermNode06HP, "LinkedNode06Online", "LinkedNode06Status", "Node06Comma", "Node06Percent", gNativeTermNode06Dist, "LinkedNode06Dist", "LinkedNode06meters", systemArray )
setUpNodeData(7, akTerminalRef, "LinkedNode07", "LinkedNode07HP", gNativeTermNode07HP, "LinkedNode07Online", "LinkedNode07Status", "Node07Comma", "Node07Percent", gNativeTermNode07Dist, "LinkedNode07Dist", "LinkedNode07meters", systemArray )
setUpNodeData(8, akTerminalRef, "LinkedNode08", "LinkedNode08HP", gNativeTermNode08HP, "LinkedNode08Online", "LinkedNode08Status", "Node08Comma", "Node08Percent", gNativeTermNode08Dist, "LinkedNode08Dist", "LinkedNode08meters", systemArray )
setUpNodeData(9, akTerminalRef, "LinkedNode09", "LinkedNode09HP", gNativeTermNode09HP, "LinkedNode09Online", "LinkedNode09Status", "Node09Comma", "Node09Percent", gNativeTermNode09Dist, "LinkedNode09Dist", "LinkedNode09meters", systemArray )
setUpNodeData(10, akTerminalRef, "LinkedNode10", "LinkedNode10HP", gNativeTermNode10HP, "LinkedNode10Online", "LinkedNode10Status", "Node10Comma", "Node10Percent", gNativeTermNode10Dist, "LinkedNode10Dist", "LinkedNode10meters", systemArray )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
bool function setupNodeData(int index, objectReference akTerminalRef, string LinkedNodeXX, string LinkedNodeXXHP, GlobalVariable gNativeTermNodeXXHP, string LinkedNodeXXOnline, string LinkedNodeXXStatus, string linkedNodeXXcomma, string linkedNodeXXpercentSign, globalVariable gNativeTermNodeXXDist, string linkedNodeXXDist, string linkedNodeXXmeters, ObjectReference[] systemArray = none)
    if systemArray.length < index;(systemArray[index-1] == NONE) || (systemArray[index] == systemArray[index - 1])
        debug.trace("TERMINAL: No node found "+index+" links from "+akTerminalRef)
        debug.trace("     Set all strings to blanks and bail.")
        akTerminalRef.addtextreplacementData(LinkedNodeXX, blankMessage)
        akTerminalRef.addtextreplacementData(LinkedNodeXXHP, blankMessage)
        akTerminalRef.addtextreplacementData(LinkedNodeXXOnline, blankMessage)
        akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXcomma, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXpercentSign, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXDist, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXmeters, blankMessage)
        return FALSE
    else
        objectReference thisNode = systemArray[index-1]

        debug.trace("TERMINAL: Found node "+thisNode+" "+index+" links from "+akTerminalRef)
        debug.trace("     Set up string replacements for sysDiag menu.")

        akTerminalRef.addtextreplacementData(linkedNodeXXcomma, defaultComma)
        akTerminalRef.addtextreplacementData(linkedNodeXXpercentSign, defaultPercentSign)
        akTerminalRef.addtextreplacementData(linkedNodeXXmeters, defaultMetersAbbreviation)

        akTerminalRef.addtextreplacementData(LinkedNodeXX, thisNode.getBaseObject())
        
        gNativeTermNodeXXHP.setValue(thisNode.getValuePercentage(Health)*100 as int)
        if gNativeTermNodeXXHP.getValueInt() < 0 || (thisNode as actor).isDead()
            gNativeTermNodeXXHP.setValueInt(0)
        endif
        akTerminalRef.addtextreplacementData(LinkedNodeXXHP,gNativeTermNodeXXHP)

        if (thisNode as actor).isDead() 
            akTerminalRef.addtextreplacementData(LinkedNodeXXOnline,terminalTurretStatusOffline)
            akTerminalRef.addtextreplacementData(LinkedNodeXXStatus,terminalTurretStatusDead)
        else    
            if (thisNode as actor).isUnconscious()
                akTerminalRef.addtextreplacementData(LinkedNodeXXOnline,terminalTurretStatusOffline)
            else
                akTerminalRef.addtextreplacementData(LinkedNodeXXOnline, terminalTurretStatusOnline)
            endif

            if (thisNode as actor).getCombatState() == 0
                akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, terminalTurretStatusNonCombat)
            elseif (thisNode as actor).getCombatState() == 1
                akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, terminalTurretStatusCombat)
            elseif (thisNode as actor).getCombatState() == 2
                akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, terminalTurretStatusSearching)
            endif
        endif

        debug.trace("Set up distance from terminal ("+thisNode.getDistance(akTerminalRef)+")")
        gNativeTermNodeXXDist.setValue(thisNode.getDistance(akTerminalRef)/64 as int)
        debug.trace("akTerminalRef: "+akTerminalRef)
        debug.trace("linkedNodeXXDist: "+linkedNodeXXDist)
        debug.trace("gNativeTermNodeXXDist: "+gNativeTermNodeXXDist)
        akTerminalRef.addtextreplacementData(linkedNodeXXDist, gNativeTermNodeXXDist)

        return TRUE

    endif
endFunction

ActorValue Property Aggression Auto Const
ActorValue Property Health Auto Const

Faction Property PlayerFaction Auto Const
Keyword Property LinkTerminalTurret Auto Const

GlobalVariable Property gNativeTermNode01HP Auto Const
GlobalVariable Property gNativeTermNode03HP Auto Const
GlobalVariable Property gNativeTermNode02HP Auto Const
GlobalVariable Property gNativeTermNode04HP Auto Const
GlobalVariable Property gNativeTermNode05HP Auto Const
GlobalVariable Property gNativeTermNode06HP Auto Const
GlobalVariable Property gNativeTermNode07HP Auto Const
GlobalVariable Property gNativeTermNode08HP Auto Const
GlobalVariable Property gNativeTermNode09HP Auto Const
GlobalVariable Property gNativeTermNode10HP Auto Const

GlobalVariable Property gNativeTermNode01Dist Auto Const
GlobalVariable Property gNativeTermNode03Dist Auto Const
GlobalVariable Property gNativeTermNode02Dist Auto Const
GlobalVariable Property gNativeTermNode04Dist Auto Const
GlobalVariable Property gNativeTermNode05Dist Auto Const
GlobalVariable Property gNativeTermNode06Dist Auto Const
GlobalVariable Property gNativeTermNode07Dist Auto Const
GlobalVariable Property gNativeTermNode08Dist Auto Const
GlobalVariable Property gNativeTermNode09Dist Auto Const
GlobalVariable Property gNativeTermNode10Dist Auto Const

Message Property terminalTurretStatusOnline Auto Const
Message Property terminalTurretStatusOffline Auto Const
Message Property terminalTurretStatusDead Auto Const
Message Property terminalTurretStatusFrenzied Auto Const
Message Property terminalTurretStatusCombat Auto Const
Message Property terminalTurretStatusNonCombat Auto Const
Message Property terminalTurretStatusSearching Auto Const

Message Property BlankMessage Auto Const
Message Property defaultComma Auto Const
Message Property defaultPercentSign Auto Const
Message Property defaultMetersAbbreviation auto const

GlobalVariable Property gNativeTermTurretsStatus Auto Const
