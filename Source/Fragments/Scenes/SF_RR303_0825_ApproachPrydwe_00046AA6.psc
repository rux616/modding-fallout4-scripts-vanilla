;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RR303_0825_ApproachPrydwe_00046AA6 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneGhostCheck()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
