;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSM01_Brandis_110_000B33CA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if (GetOwningQuest().GetStageDone(105))
     BoSM01_DanseStage150CMP_Exit.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoSM01_DanseStage150CMP_Exit Auto Const
