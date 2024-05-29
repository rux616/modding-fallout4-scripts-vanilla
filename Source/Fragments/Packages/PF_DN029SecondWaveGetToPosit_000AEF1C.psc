;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_DN029SecondWaveGetToPosit_000AEF1C Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
GetOwningQuest().SetStage(250)
utility.Wait(0.1)
akActor.MoveTo((GetOwningQuest() as defaultQuestRespawnScript).RespawnMarkerFailsafe)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
