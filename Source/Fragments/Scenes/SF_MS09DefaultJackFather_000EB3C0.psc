;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS09DefaultJackFather_000EB3C0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE MS09Script
MS09Script kmyQuest = GetOwningQuest() as MS09Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerAskedAboutFathersAge = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
