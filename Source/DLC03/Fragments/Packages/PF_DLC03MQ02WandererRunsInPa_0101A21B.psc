;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Packages:PF_DLC03MQ02WandererRunsInPa_0101A21B Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; When you get into the gate then close the gate
GetOwningQuest().SetStage(205)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
