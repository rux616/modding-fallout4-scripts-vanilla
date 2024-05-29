;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS301PulserStation_001A8B3D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_21_End
Function Fragment_Phase_21_End()
;BEGIN CODE
if (BoSM01.isQuestTrackingEnabled)
     BoSM01.SetObjectiveDisplayed(60, True, True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BoSM01QuestScript Property BoSM01 Auto Const
