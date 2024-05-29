;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04_CloningTerminalMa_0103B9E4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
PDLC04SafariAdventureQuest.setstage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
PDLC04SafariGazelleCloningOn.setValue(1)
PDLC04OBJCloningMachineActivate.Play(PDLC04CloningMachineSoundMarker)
utility.wait(1)
PDLC04SafariCloningMachineGazelleEnabler.Enable()
PDLC04SafariCloningDoor.setopen(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04SafariAdventureQuest Auto Const Mandatory

GlobalVariable Property PDLC04SafariGazelleCloningOn Auto Const Mandatory

ObjectReference Property PDLC04SafariCloningMachineGazelleEnabler Auto Const Mandatory

ObjectReference Property PDLC04SafariCloningDoor Auto Const Mandatory

ObjectReference Property PDLC04CloningMachineSoundMarker Auto Const Mandatory

Sound Property PDLC04OBJCloningMachineActivate Auto Const Mandatory
