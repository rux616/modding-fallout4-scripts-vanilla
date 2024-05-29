;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN019JoinCultEmogene_000C519B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DN019JoinCultScript
DN019JoinCultScript kmyQuest = GetOwningQuest() as DN019JoinCultScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAskAboutEmogeneFlag(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
