;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ00MamaMurphy_NoMoreChem_001826BB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ00MamaMurphyScript
MQ00MamaMurphyScript kmyQuest = GetOwningQuest() as MQ00MamaMurphyScript
;END AUTOCAST
;BEGIN CODE
kmyquest.GoCleanAttempt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
