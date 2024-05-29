;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN070_TurretHallIDRejecte_0014E0A7 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
;Trigger the security system.
DN070_TurretHallManagerRef.TriggerTurretHall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DN070_TurretHallManagerScript Property DN070_TurretHallManagerRef Auto Const
