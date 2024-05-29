;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04_KK_Terminal_SubSp_0202273F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;This tells the quest to turn off the rad sprayers
DLC04_KiddieKingdomMain.SetRadMisterState(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory
