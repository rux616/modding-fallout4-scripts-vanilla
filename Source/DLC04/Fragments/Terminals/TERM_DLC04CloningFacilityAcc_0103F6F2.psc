;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04CloningFacilityAcc_0103F6F2 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if PDLC04SafariAdventureQuest.getStageDone(115) == 0 && PDLC04SafariAdventureQuest.getStageDone(90) == 1 && PDLC04SafariAdventureQuest.getStage() < 120
   PDLC04SafariAdventureQuest.setstage(115)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
doortoUnlock.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04SafariAdventureQuest Auto Const Mandatory

ObjectReference Property doorToUnlock Auto Const
