;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN136_BioTerminalSub02_001277EA Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference myDoor = akTerminalRef.getLinkedRef()
myDoor.activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference myDoor = akTerminalRef.getLinkedRef()
myDoor.activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Set stage 30 in InstM03, which shuts everything down
InstM03.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM03 Auto Const

ObjectReference Property DN136_BioScienceKlaxon01REF Auto Const

ObjectReference Property DN136_BioScienceKlaxonSound01REF Auto Const

Quest Property DN136_Attack Auto Const

ObjectReference Property DN136_BioScienceKlaxon01Marker Auto Const
