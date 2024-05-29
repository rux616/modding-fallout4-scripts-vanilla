;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RR303_0600a_DeaconPost_001475E1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE RR303Script
RR303Script kmyQuest = GetOwningQuest() as RR303Script
;END AUTOCAST
;BEGIN CODE
; Flag that Deacon had this talk
kmyQuest.bDeaconPostChurchTalk = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
