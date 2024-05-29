;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst307Fight_VirusScene_0100CAC5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
Inst307Fight.virusUploadTime = Inst307Fight.virusUploadTime + 1
Debug.Trace("Incremented to " + Inst307Fight.virusUploadTime)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Inst307FightQuestScript Property Inst307Fight Auto Const
