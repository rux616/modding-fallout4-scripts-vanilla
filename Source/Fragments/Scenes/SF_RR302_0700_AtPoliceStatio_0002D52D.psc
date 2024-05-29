;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RR302_0700_AtPoliceStatio_0002D52D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE rr302script
rr302script kmyQuest = GetOwningQuest() as rr302script
;END AUTOCAST
;BEGIN CODE
; Flagged that this talk happened
kmyQuest.bTalkedToTinkAtPoliceStation = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN CODE
; Call the meta-quest
pRR304.SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRR304 Auto Const
