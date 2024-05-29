;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01MQ02_CodsworthStage6_0100254C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; stop quest if stage 700 is done (meaning quest coomplete)
if GetOwningQuest().GetStageDone(700)
  GetOwningQuest().SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

