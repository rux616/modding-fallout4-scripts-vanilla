;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst302_RRDesdemonaScene_000D6127 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN CODE
; RR201's dialog is no longer blocked by Bunker Hill
(pRR201 as RR201Script).bBlockRR201 = 0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRR201 Auto Const
