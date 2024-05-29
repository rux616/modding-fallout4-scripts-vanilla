;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Terminals:TERM_DLC01LairENT_DeconHallC_01008B17 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Activate the arches.
DLC01Lair.SetDeconHallArchState(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Deactivate the arches.
DLC01Lair.SetDeconHallArchState(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Default2StateActivator Property DLC01LairENT_DeconArch01 Auto Const Mandatory

Default2StateActivator Property DLC01_ActivationDummy Auto Const Mandatory

DLC01:DLC01LairQuestScript Property DLC01Lair Auto Const Mandatory
