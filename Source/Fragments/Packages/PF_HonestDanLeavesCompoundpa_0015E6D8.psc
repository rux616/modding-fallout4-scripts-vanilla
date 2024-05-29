;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_HonestDanLeavesCompoundpa_0015E6D8 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
; Disable Dan and end the quest
akActor.Disable()
GetOwningQuest().SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
