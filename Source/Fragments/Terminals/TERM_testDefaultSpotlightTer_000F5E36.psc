;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_testDefaultSpotlightTer_000F5E36 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("SPOTLIGHT: Deactivate Fragment")
SpotlightScript LightScript = (akTerminalRef.getLinkedRef(linkTerminalSpotlight)) as spotlightScript
lightScript.Activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("SPOTLIGHT: Deactivate Fragment, came from: "+akTerminalRef)
debug.trace("Trying to poke my linked ref: "+akTerminalRef.getLinkedRef(linkTerminalSpotlight))
SpotlightScript LightScript = (akTerminalRef.getLinkedRef(linkTerminalSpotlight)) as spotlightScript
lightScript.Activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSpotlight Auto Const
