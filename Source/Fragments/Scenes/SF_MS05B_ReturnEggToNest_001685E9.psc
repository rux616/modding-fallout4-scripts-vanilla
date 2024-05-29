;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS05B_ReturnEggToNest_001685E9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if MS05B.GetStageDone(510) || !MS05B_PoppaWatchesScene.IsPlaying()
  MS05B.SetStage(1100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS05B Auto Const

ReferenceAlias Property PoppaDeathclaw Auto Const

Scene Property MS05B_PoppaWatchesScene Auto Const
