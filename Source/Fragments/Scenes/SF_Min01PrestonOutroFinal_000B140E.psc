;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Min01PrestonOutroFinal_000B140E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE Min01Script
Min01Script kmyQuest = GetOwningQuest() as Min01Script
;END AUTOCAST
;BEGIN CODE
if kmyQuest.GetStageDone(2000)
	kmyQuest.SetStage(2010) ; complete MinRecruit00
	if kmyQuest.GetStageDone(1500)
		kmyQuest.SetStage(2100)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
