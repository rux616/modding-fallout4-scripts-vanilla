;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeSpotlightTerminal_000FDF2C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;SpotlightScript LightScript = (akTerminalRef.getLinkedRef(linkTerminalSpotlight)) as spotlightScript
;lightScript.ShutdownSpotlight()
ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalSpotlight)

int i = 0
while i < linkedRefArray.length
	(linkedRefArray[i] as spotlightscript).Activate(akTerminalRef)
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;SpotlightScript LightScript = (akTerminalRef.getLinkedRef(linkTerminalSpotlight)) as spotlightScript
;lightScript.TurnOnSpotlight()
ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalSpotlight)

int i = 0
while i < linkedRefArray.length
	(linkedRefArray[i] as spotlightscript).Activate(akTerminalRef)
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
;NOTE - This function, setUpNodeData() is contained within the fragment script.  If you want to look at it, view the source.  (Not viewable in-editor)
Objectreference[] systemArray = akTerminalRef.getLinkedRefArray(linkTerminalSpotlight)
setUpNodeData(1, akTerminalRef, "LinkedNode01", "LinkedNode01Online", "LinkedNode01Status", "Node01Comma", gNativeTermNode01Dist, "LinkedNode01Dist", "LinkedNode01meters", systemArray )
setUpNodeData(2, akTerminalRef, "LinkedNode02", "LinkedNode02Online", "LinkedNode02Status", "Node02Comma", gNativeTermNode02Dist, "LinkedNode02Dist", "LinkedNode02meters", systemArray )
setUpNodeData(3, akTerminalRef, "LinkedNode03", "LinkedNode03Online", "LinkedNode03Status", "Node03Comma", gNativeTermNode03Dist, "LinkedNode03Dist", "LinkedNode03meters", systemArray )
setUpNodeData(4, akTerminalRef, "LinkedNode04", "LinkedNode04Online", "LinkedNode04Status", "Node04Comma", gNativeTermNode04Dist, "LinkedNode04Dist", "LinkedNode04meters", systemArray )
setUpNodeData(5, akTerminalRef, "LinkedNode05", "LinkedNode05Online", "LinkedNode05Status", "Node05Comma", gNativeTermNode05Dist, "LinkedNode05Dist", "LinkedNode05meters", systemArray )
setUpNodeData(6, akTerminalRef, "LinkedNode06", "LinkedNode06Online", "LinkedNode06Status", "Node06Comma", gNativeTermNode06Dist, "LinkedNode06Dist", "LinkedNode06meters", systemArray )
setUpNodeData(7, akTerminalRef, "LinkedNode07", "LinkedNode07Online", "LinkedNode07Status", "Node07Comma", gNativeTermNode07Dist, "LinkedNode07Dist", "LinkedNode07meters", systemArray )
setUpNodeData(8, akTerminalRef, "LinkedNode08", "LinkedNode08Online", "LinkedNode08Status", "Node08Comma", gNativeTermNode08Dist, "LinkedNode08Dist", "LinkedNode08meters", systemArray )
setUpNodeData(9, akTerminalRef, "LinkedNode09", "LinkedNode09Online", "LinkedNode09Status", "Node09Comma", gNativeTermNode09Dist, "LinkedNode09Dist", "LinkedNode09meters", systemArray )
setUpNodeData(10, akTerminalRef, "LinkedNode10", "LinkedNode10Online", "LinkedNode10Status", "Node10Comma", gNativeTermNode10Dist, "LinkedNode10Dist", "LinkedNode10meters", systemArray )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSpotlight Auto Const

bool function setupNodeData(int index, objectReference akTerminalRef, string LinkedNodeXX, string LinkedNodeXXOnline, string LinkedNodeXXStatus, string linkedNodeXXcomma, globalVariable gNativeTermNodeXXDist, string linkedNodeXXDist, string linkedNodeXXmeters, ObjectReference[] systemArray = none)

    if systemArray.length < index;(systemArray[index-1] == NONE) || (systemArray[index] == systemArray[index - 1])
        debug.trace("TERMINAL: No node found "+index+" links from "+akTerminalRef)
        debug.trace("     Set all strings to blanks and bail.")
        akTerminalRef.addtextreplacementData(LinkedNodeXX, blankMessage)
        akTerminalRef.addtextreplacementData(LinkedNodeXXOnline, blankMessage)
        akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXcomma, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXDist, blankMessage)
        akTerminalRef.addtextreplacementData(linkedNodeXXmeters, blankMessage)
        return FALSE
    else
        objectReference thisNode = systemArray[index-1]

        debug.trace("TERMINAL: Found node "+thisNode+" "+index+" links from "+akTerminalRef)
        debug.trace("     Set up string replacements for sysDiag menu.")

        akTerminalRef.addtextreplacementData(linkedNodeXXcomma, defaultComma)
        akTerminalRef.addtextreplacementData(linkedNodeXXmeters, defaultMetersAbbreviation)

        akTerminalRef.addtextreplacementData(LinkedNodeXX, terminalSpotlightID)

        SpotLightScript spotlightScriptRef = thisNode as spotlightscript

        if spotlightScriptRef.destroyed == true 
            akTerminalRef.addtextreplacementData(LinkedNodeXXOnline,terminalTurretStatusOffline)
            akTerminalRef.addtextreplacementData(LinkedNodeXXStatus,terminalTurretStatusDead)
        else
            if spotlightScriptRef.shutdown == true
                akTerminalRef.addtextreplacementData(LinkedNodeXXOnline,terminalTurretStatusOffline)
            else
                spotlightScriptRef.shutdown == false
                akTerminalRef.addtextreplacementData(LinkedNodeXXOnline, terminalTurretStatusOnline)
            endif
       
            if (spotlightScriptRef.detectscript).detecting == true
                    akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, terminalSpotlightStatusDetected)
            else
                (spotlightScriptRef.detectscript).detecting == false
                akTerminalRef.addtextreplacementData(LinkedNodeXXStatus, terminalSpotlightStatusAllClear)
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
Message Property terminalSpotlightStatusDetected Auto Const
Message Property terminalSpotlightStatusAllClear Auto Const
Message Property terminalSpotlightID Auto Const


Message Property BlankMessage Auto Const
Message Property defaultComma Auto Const
Message Property defaultMetersAbbreviation auto const
