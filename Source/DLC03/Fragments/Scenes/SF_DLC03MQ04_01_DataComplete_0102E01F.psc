;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ04_01_DataComplete_0102E01F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
debug.trace(self + " scene START")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC03:MQ04Script
DLC03:MQ04Script kmyQuest = GetOwningQuest() as DLC03:MQ04Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " scene end - exit VR")
kmyQuest.EnterVR(false, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
