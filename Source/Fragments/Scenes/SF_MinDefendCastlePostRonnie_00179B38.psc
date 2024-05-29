;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MinDefendCastlePostRonnie_00179B38 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mindefendcastlescript
mindefendcastlescript kmyQuest = GetOwningQuest() as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.IsRunning() && kmyQuest.IsStopping() == false
  kmyQuest.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
