;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS13BConfrontCookeScene_0003D2C8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_16_Begin
Function Fragment_Phase_16_Begin()
;BEGIN AUTOCAST TYPE MS13Script
MS13Script kmyQuest = GetOwningQuest() as MS13Script
;END AUTOCAST
;BEGIN CODE
if kmyQuest.PhaseBPlayerHelping
	; make Cooke hostile to player
	GetOwningQuest().SetStage(320)
endif
; always hostile to Paul
GetOwningQuest().SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
