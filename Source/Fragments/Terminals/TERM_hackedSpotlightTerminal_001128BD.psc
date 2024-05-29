;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackedSpotlightTerminal_001128BD Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SpotlightScript LightScript = (akTerminalRef.getLinkedRef(plinkTerminalSpotlight)) as spotlightScript
LightScript.FactionOwner = PlayerFaction
if LightScript.shutdown != true
	LightScript.RestartSpotlight()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SpotlightScript LightScript = (akTerminalRef.getLinkedRef(plinkTerminalSpotlight)) as spotlightScript
lightScript.FactionOwner = None
if LightScript.shutdown != true
	LightScript.RestartSpotlight()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.getLinkedRef(plinkTerminalSpotlight).DamageObject(1000.00)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property pLinkTerminalSpotlight Auto Const

Faction Property PlayerFaction Auto Const


