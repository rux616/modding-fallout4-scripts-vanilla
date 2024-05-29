;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN070_TurretHallOpenScene_00112D92 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
;Finish opening the turret hall.
;Use StartTimer here to fork the call so the scene doesn't block while the script runs.
DN070_TurretHallManagerRef.StartTimer(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN070 Auto Const

DN070_TurretHallManagerScript Property DN070_TurretHallManagerRef Auto Const
