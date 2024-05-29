;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CZ_Arena_Combat_Pre_A_0010C017 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AnnounceFight()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
