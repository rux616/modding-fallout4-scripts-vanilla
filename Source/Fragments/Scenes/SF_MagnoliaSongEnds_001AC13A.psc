;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MagnoliaSongEnds_001AC13A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
MagnoliaSongsScript kmyQuest = GetOwningQuest() as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AudienceClaps()
ThirdRailCrowdSoundsREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
ThirdRailCrowdSoundsREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
ThirdRailCrowdSoundsREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ThirdRailCrowdSoundsREF Auto Const Mandatory
