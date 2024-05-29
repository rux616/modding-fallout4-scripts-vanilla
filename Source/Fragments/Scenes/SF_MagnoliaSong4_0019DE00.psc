;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MagnoliaSong4_0019DE00 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
MagnoliaSongsScript kmyQuest = GetOwningQuest() as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.var_CurrentSong = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
MagnoliaSongsScript kmyQuest = GetOwningQuest() as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SongEnded()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
MagnoliaSongsScript kmyQuest = GetOwningQuest() as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SongStarted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
