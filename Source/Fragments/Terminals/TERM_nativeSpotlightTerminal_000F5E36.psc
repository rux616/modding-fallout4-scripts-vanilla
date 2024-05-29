;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeSpotlightTerminal_000F5E36 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("TERMINAL: set up globals for spotlight info")
debug.trace("TERMINAL: Begin new array population")
Objectreference[] linkedSpotlights = akTerminalRef.getLinkedRefArray(linkTerminalSpotlight)

;debug.trace("TERMINAL: My array is linkedSpotlights is: "+linkedSpotlights)

;;;; Figure out how many spotlights are connected
debug.trace("TERMINAL: Counting Linked Items")
gNativeTermSpotlightsConnected.setValueInt(linkedSpotlights.length)
dnmasterQuest.UpdateCurrentInstanceGlobal(gNativeTermSpotlightsConnected)
akTerminalRef.addtextreplacementData("SpotlightsConnected", gNativeTermSpotlightsConnected)
debug.trace("TERMINAL: Spotlight Count: "+gNativeTermSpotlightsConnected.getValueInt())

;;;; Text Replace - If I have faction owner, use that data.  Otherwise use default faction.
DEBUG.TRACE("TERMINAL: Linked spotlight Faction Owner is: "+akTerminalRef.getLinkedRef(linkTerminalspotlight).getFactionOwner())
debug.trace("TERMINAL: refresh text replacement data (faction)")

if (akTerminalRef.getLinkedRef(linkTerminalspotlight) as spotlightscript).factionOwner != NONE
	debug.trace("TERMINAL: Faction = "+(akTerminalRef.getLinkedRef(linkTerminalspotlight) as spotlightscript).factionOwner)
	akTerminalRef.addtextreplacementData("spotlightFaction", (akTerminalRef.getLinkedRef(linkTerminalspotlight) as spotlightscript).factionOwner)
else
	debug.trace("TERMINAL: no faction owner for spotlight: "+akTerminalRef.getLinkedref(linkTerminalspotlight))
	akTerminalRef.addtextreplacementData("spotlightFaction", BlankMessage)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSpotlight Auto Const
GlobalVariable Property gNativeTermSpotlightsConnected Auto Const
Faction Property SpotlightFaction Auto Const
Quest property dnmasterQuest auto const

Message Property BlankMessage Auto Const

